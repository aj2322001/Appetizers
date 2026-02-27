//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Archit  Joshi on 15/02/26.
//

import Foundation

class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    
    func getAppetiers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { [self] result in
            DispatchQueue.main.async { [self] in
                isLoading = false
            }
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizersFromServer):
                    self.appetizers = appetizersFromServer
                case .failure(let error):
                    self.alertItem = AlertItem.getAlertItem(err: error)
                }
            }
        }
    }
}
