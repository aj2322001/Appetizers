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
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                        }
                }
                .navigationTitle("Appetizers")
                .disabled(viewModel.isShowingDetailsScreen)
            }
            .onAppear {
                viewModel.getAppetiers()
            }
            .blur(radius: viewModel.isShowingDetailsScreen ? 20 : 0)
            
            if viewModel.isShowingDetailsScreen {
                AppetizerDetailView(appetizer: $viewModel.selectedAppetizer)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
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
