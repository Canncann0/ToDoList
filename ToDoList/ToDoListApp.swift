//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Dogancan turgut on 21.10.2025.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
        }
        .environmentObject(listViewModel)
    }
}
