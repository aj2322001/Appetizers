//
//  OrderView.swift
//  Appetizers
//
//  Created by Archit  Joshi on 08/02/26.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    APButton(
                        title: "\(order.totalPrice, specifier: "%.2f") - Place Order"
                    ){
                        print("Place Order tapped")
                    }
                    .padding()
                }
                
                if order.items.isEmpty {
                    EmptyState(
                        message: "You have no items in your order.\nPlease add an appetizer!"
                    )
                }
            }
            .navigationTitle("Orders")
        }
    }
}

#Preview {
    OrderView()
}
