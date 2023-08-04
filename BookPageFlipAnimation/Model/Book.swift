//
//  Book.swift
//  BookPageFlipAnimation
//
//  Created by Cecilia Chen on 8/4/23.
//

import Foundation

struct Book: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let title: String
    let image: String
    let author: String
}

var sampleBooks:[Book] = [
    .init(title: "Summer Advanture", image: "Summer Adventure", author: "Phyllis Schwaiger"),
    .init(title: "Our Butterfly", image: "Our Butterfly", author: "Olivia Wilson"),
    .init(title: "The Beautiful Night", image: "The Beautiful Night", author: "Hannah Morales"),
    .init(title: "Walk With Moths", image: "Walk With Moths", author: "Juliana Silva")
]
