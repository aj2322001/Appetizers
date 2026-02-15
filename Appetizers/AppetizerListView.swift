//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Archit  Joshi on 08/02/26.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
                .navigationTitle("Appetizers")
        }
        .onAppear {
            viewModel.getAppetiers()
        }
        .alert(item: $viewModel.alertItem) { item in
            Alert(title: item.title,
                  message: item.message,
                  dismissButton: item.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}
