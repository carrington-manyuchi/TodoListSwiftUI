//
//  ItemModel.swift
//  TodoList
//
//  Created by Manyuchi, Carrington C on 2024/10/26.
//

import Foundation

// Immutable Struct
struct ItemModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
        self.id = id
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
