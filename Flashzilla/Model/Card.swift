//
//  Card.swift
//  Flashzilla
//
//  Created by Baptiste Cadoux on 11/07/2022.
//

import Foundation

struct Card {
    let prompt: String
    let answer: String

    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?",
                              answer: "Jodie Whittaker")
}
