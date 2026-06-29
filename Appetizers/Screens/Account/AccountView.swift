//
//  AccountView.swift
//  Appetizers
//
//  Created by Archit  Joshi on 08/02/26.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    var body: some View {
        NavigationView {
            Form {
                Section("Personal Info".uppercased()) {
                    TextField("First Name",
                              text: $viewModel.user.firstName)
                    
                    TextField("List Name",
                              text: $viewModel.user.lastName)
                    
                    TextField("Email",
                              text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled(true)
                    
                    DatePicker("Birthday",
                               selection: $viewModel.user.birthday,
                               displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section("Requests".uppercased()) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNakins)
                        
                    Toggle("Frequent Refills", isOn: $viewModel.user.freqRefills)
                }
            }
            .navigationTitle("Account")
            .tint(.brandPrimary)
        }
        .onAppear {
            viewModel.retrieveChanges()
        }
        .alert(item: $viewModel.alertItem) { item in
            Alert(title: item.title,
                  message: item.message,
                  dismissButton: item.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
