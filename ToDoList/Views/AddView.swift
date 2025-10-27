//
//  AddView.swift
//  ToDoList
//
//  Created by Dogancan turgut on 21.10.2025.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var sayfayiKapat
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type somethings..", text: $textFieldText)
                    .padding(10)
                    .frame(height: 56)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                    
                } label: {
                    Text("Save".uppercased())
                        .foregroundStyle(Color.white)
                        .frame(height: 56)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                
                
                
                
                
            }
            .padding(10)
        }
        .navigationTitle("New to do")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonPressed() {
        if textValid() {
            listViewModel.addItem(title: textFieldText)
            sayfayiKapat.callAsFunction()
        }
    }
    
    func textValid() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "To do task is must be large than 3 character"
            showAlert.toggle()
            return false
        } else {
            return true
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
}
