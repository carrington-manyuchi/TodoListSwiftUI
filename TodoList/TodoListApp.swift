//
//  TodoListApp.swift
//  TodoList
//
//  Created by Manyuchi, Carrington C on 2024/10/26.
//

import SwiftUI

@main
struct TodoListApp: App {
    
     @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
