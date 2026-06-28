//
//  DismissXButton.swift
//  Appetizers
//
//  Created by Archit Joshi on 28/06/26.
//

import SwiftUI

struct DismissXButton: View {
    let action: (() -> Void)?
    var body: some View {
        Button {
            action?()
        } label: {
            ZStack(alignment: .center) {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.white)
                    .opacity(0.6)
                Image(systemName: "xmark")
                    .frame(width: 44, height: 44)
                    .foregroundStyle(.brandPrimary)
            }
            .shadow(radius: 12)
        }
    }
}

#Preview {
    DismissXButton {
        print("DismissXButton tapped")
    }
}
