//
//  Utility.swift
//  BookPageFlipAnimation
//
//  Created by Cecilia Chen on 8/4/23.
//

import Foundation

func indexOf(book: Book) -> Int {
    if let index = sampleBooks.firstIndex(of: book) {
        return index
    }
    return 0
}
