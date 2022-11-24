//
//  Game.swift
//  ApplePie
//
//  Created by Christian Manzaraz on 24/11/2022.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var gessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character) {
        gessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
}
