//
//  Home.swift
//  BookPageFlipAnimation
//
//  Created by Cecilia Chen on 8/4/23.
//

import SwiftUI

struct Home: View {
    @State var currentBook: Book = sampleBooks.first!
    
    var body: some View {
        VStack {
            HeaderView()
            BookSlider(currentBook: $currentBook)
            SliderBottomView(currentBook: $currentBook)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ContentView()
}
