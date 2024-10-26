//
//  AddView.swift
//  TodoList
//
//  Created by Manyuchi, Carrington C on 2024/10/26.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
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
                    saveButtonPressed()
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
        .alert(alertTitle, isPresented: $showAlert) {
            
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropiate() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func textIsAppropiate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be atleast 3 characters long! 😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
    .environmentObject(ListViewModel())
}
