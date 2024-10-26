//
//  ListRowView.swift
//  TodoList
//
//  Created by Manyuchi, Carrington C on 2024/10/26.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    let items = [
        ItemModel(title: "One item", isCompleted: false),
        ItemModel(title: "Two item", isCompleted: true)
    ]
    
    return Group {
        ForEach(items, id: \.title) { item in
            ListRowView(item: item)
        }
    }
    .previewLayout(.sizeThatFits)
}
