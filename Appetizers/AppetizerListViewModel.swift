//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Archit  Joshi on 15/02/26.
//

import Foundation

class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    
    func getAppetiers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizersFromServer):
                    self.appetizers = appetizersFromServer
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
