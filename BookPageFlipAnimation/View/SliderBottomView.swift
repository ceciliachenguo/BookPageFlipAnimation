//
//  SliderBottomView.swift
//  BookPageFlipAnimation
//
//  Created by Cecilia Chen on 8/4/23.
//

import SwiftUI

struct SliderBottomView: View {
    @Binding var currentBook: Book
    
    var body: some View {
        VStack {
            GeometryReader {
                let size = $0.size
                
                HStack(spacing: 0) {
                    ForEach(sampleBooks) { book in
                        let index = indexOf(book: book)
                        let currentIndex = indexOf(book: currentBook)
                        
                        VStack(alignment: .leading, spacing: 18) {
                            Text(book.title)
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.black.opacity(0.7))
                                .offset(x: CGFloat(currentIndex) * -(size.width + 30))
                                .opacity(currentIndex == index ? 1 : 0)
                                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(currentIndex < index ? 0.1 : 0), value: currentIndex == index)
                            
                            Text("By \(book.author)")
                                .font(.callout)
                                .foregroundColor(.gray)
                                .offset(x: CGFloat(currentIndex) * -(size.width + 30))
                                .opacity(currentIndex == index ? 1 : 0)
                                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(currentIndex < index ? 0.1 : 0), value: currentIndex == index)

                        }
                        .frame(width: size.width+30, alignment: .leading)
                    }
                }
            }
            .padding(.horizontal, 15)
            .frame(height: 100)
            .padding(.bottom, 10)
            
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(.gray.opacity(0.4))
                
                GeometryReader {
                    let size = $0.size
                    Capsule()
                        .fill(Color("OrangeIndicator"))
                        .frame(width: CGFloat(indexOf(book: currentBook)) / CGFloat(sampleBooks.count - 1) * size.width)
                        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.75, blendDuration: 0.75), value: currentBook)
                }
            }
            .frame(height: 4)
            .padding(.top, 10)
            .padding([.horizontal, .bottom], 15)
        }
    }
}

#Preview {
    SliderBottomView(currentBook: .constant(sampleBooks[0]))
}
