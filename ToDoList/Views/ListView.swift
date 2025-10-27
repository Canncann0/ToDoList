//
//  ListView.swift
//  ToDoList
//
//  Created by Dogancan turgut on 21.10.2025.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                VStack{
                    Text("🤷‍♂️")
                        .font(.title)
                    Text("You haven't added a task yet")
                        .foregroundStyle(Color.gray)
                }
                
                
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }
        .navigationTitle("Todo List")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
    
    
}


#Preview {
    NavigationStack {
        ListView()
    }
    .environmentObject(ListViewModel())
}


