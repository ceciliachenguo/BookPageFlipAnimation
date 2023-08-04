//
//  BookView.swift
//  BookPageFlipAnimation
//
//  Created by Cecilia Chen on 8/4/23.
//

import SwiftUI

struct BookView: View {
    let book: Book
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            let rect = $0.frame(in: .global)
            let minX = (rect.minX - 50) < 0 ? (rect.minX - 50) : -(rect.minX - 50)
            let progress = (minX) / rect.width
            let rotation = progress * 45

            ZStack {
                IsometricView(depth: 10) {
                    Color.white
                } bottom: {
                    Color.white
                } side: {
                    Color.white
                }
                .frame(width: size.width/1.2, height: size.height/1.5)
                .shadow(color: .black.opacity(0.12), radius: 5, x: 15, y: 8)
                .shadow(color: .black.opacity(0.1), radius: 6, x: -10, y: -8)

                
                Image(book.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width/1.2, height: size.height/1.5)
                    .clipped()
                    .shadow(color: .black.opacity(0.1), radius: 6, x: 10, y: 8)
                    .rotation3DEffect(
                        .init(degrees: rotation), axis: (x:0, y: 1, z: 0), anchor: .leading, perspective: 1)
                    .modifier(CustomProjection(value: 1+(-progress < 1 ? progress : -1.0)))

            }
            .offset(x: indexOf(book: book) > 0 ? -(progress * 45) : 0)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding(.horizontal, 50)
    }
}

#Preview {
    BookView(book: sampleBooks[0])
}
