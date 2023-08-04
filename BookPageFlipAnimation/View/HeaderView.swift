//
//  HeaderView.swift
//  BookPageFlipAnimation
//
//  Created by Cecilia Chen on 8/4/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(spacing: 15) {
            Text("Top Rated")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.black.opacity(0.7))
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(15)
    }
}

#Preview {
    HeaderView()
}
