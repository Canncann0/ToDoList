//
//  ListRowView.swift
//  ToDoList
//
//  Created by Dogancan turgut on 21.10.2025.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .background(Color.white)
        
    }
}

