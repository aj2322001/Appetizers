//
//  EmptyState.swift
//  Appetizers
//
//  Created by Archit Joshi on 19/07/26.
//

import SwiftUI

struct EmptyState: View {
    var imageName: String = "empty-order"
    var message: String = "No content available"
    var body: some View {
        ZStack {
            Color(.systemBackground)
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 159)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
        }
    }
}

#Preview {
    EmptyState()
}
