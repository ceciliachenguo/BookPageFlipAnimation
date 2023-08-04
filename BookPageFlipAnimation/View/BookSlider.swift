//
//  BookSlider.swift
//  BookPageFlipAnimation
//
//  Created by Cecilia Chen on 8/4/23.
//

import SwiftUI

struct BookSlider: View {
    @Binding var currentBook: Book
    
    var body: some View {
        TabView(selection: $currentBook) {
            ForEach(sampleBooks) { book in
                BookView(book: book)
                    .tag(book)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .background {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
    }
}

#Preview {
    BookSlider(currentBook: .constant(sampleBooks[0]))
}
