//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Archit Joshi on 28/06/26.
//

import SwiftUI 

final class AccountViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    @Published var user: User = User()
     
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = .getAlertItem(err: .invalidForm)
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = .getAlertItem(err: .invalidEmail)
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = .getAlertItem(err: .userSaveSuccess)
        } catch {
            alertItem = .getAlertItem(err: .invalidUserData)
        }
    }
    
    func retrieveChanges() {
        guard let userData else { return }
        do {
            let data = try JSONDecoder().decode(User.self, from: userData)
            user = data
        } catch {
            alertItem = .getAlertItem(err: .invalidUserData)
        }
    }
}
