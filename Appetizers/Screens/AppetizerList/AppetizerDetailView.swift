//
//  AppatizerDetailView.swift
//  Appetizers
//
//  Created by Archit Joshi on 27/06/26.
//

import SwiftUI


//MARK: Main Details View
struct AppetizerDetailView: View {
    @Binding var appetizer: Appetizer?
    @EnvironmentObject var order: Order
    
    var body: some View {
            
        VStack {
            ScrollView(showsIndicators: false) {
                VStack{
                    AppetizerRemoteImage(urlString: appetizer?.imageURL ?? "",
                                         placeHolder: "food_placeholder")
                        .frame(height: 200)
                        .background()
                    VStack(alignment: .center, spacing: 5) {
                        // food title
                        Text(appetizer?.name ?? "")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        // food desc
                        Text(appetizer?.description ?? "")
                            .foregroundStyle(.secondary)
                            .font(.body)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                        
                        // Ingredient Info
                        IngredientInfoView(items: appetizer?.ingredientInfo)
                    }
                    .padding(16)
                    
                }
            }
            .scrollBounceBehavior(.basedOnSize)
            
            APButton(
                title: "$\(appetizer?.price ?? 0, specifier: "%.2f") - Add To Order"
            ){
                guard let appetizer else { return }
                order.add(appetizer)
                dismissView()
            }
            .padding(.all, 12)
        }
        .frame(width: UIScreen.main.bounds.width * 0.8)
        .frame(maxHeight: UIScreen.main.bounds.height * 0.6)
        .background(.background)
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay (alignment: .topTrailing) {
            DismissXButton {
                dismissView()
            }
        }
        .ignoresSafeArea()
    }
    
    private func dismissView() {
        appetizer = nil
    }
}

//MARK: Ingredient Section
struct IngredientInfoView: View {
    let items: [IngredientInfo]?
    var body: some View {
        if let items {
            HStack(spacing: 32) {
                ForEach(items) { item in
                    IngredientInfoItemView(title: item.item,
                                           desc: item.infoDesc)
                }
            }
            .padding(12)
        }
    }
}

struct IngredientInfoItemView: View {
    let title: String
    let desc: String
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
            Text(desc)
                .foregroundStyle(.secondary)
                .font(.subheadline)
                .italic()
        }
    }
}

//MARK: Preview
#Preview {
    AppetizerDetailView(appetizer: .constant(MockData.sampleAppetizer))
}
