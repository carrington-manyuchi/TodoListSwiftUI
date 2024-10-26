//
//  AddView.swift
//  TodoList
//
//  Created by Manyuchi, Carrington C on 2024/10/26.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
                Spacer(minLength: 50)
                
                Button(action: {
                    
                }, label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(.blue))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                })
                    
            }
            .padding(14)
        }
        .navigationTitle("Add an item ")
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
}
