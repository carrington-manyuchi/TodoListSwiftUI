//
//  ListView.swift
//  TodoList
//
//  Created by Manyuchi, Carrington C on 2024/10/26.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
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
                .listStyle(.plain)
            }
        }
            .navigationTitle("Todo List ✍️")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add", destination: AddView())
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
        }
        
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
    .environmentObject(ListViewModel())
}


