//
//  APButton.swift
//  Appetizers
//
//  Created by Archit Joshi on 28/06/26.
//

import SwiftUI

struct APButton: View {
    let title: LocalizedStringKey
    let action: (() -> Void)?
    var body: some View {
        Button {
            action?()
        } label: {
            HStack {
                Spacer()
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.background)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.all, 12)
        }
        .background(.brandPrimary)
        .cornerRadius(12)
    }
}

#Preview {
    APButton(title: "test") {
        print("tapped")
    }
}
