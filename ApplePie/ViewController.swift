//
//  ViewController.swift
//  ApplePie
//
//  Created by Christian Manzaraz on 23/11/2022.
//

import UIKit

var listOfWords = [ "corsario", "swift", "glorioso","incandescente", "pestaña", "insecto", "programa"] // Lista de palabras a adivinar
let incorrectMovesAllowed = 7 // Establece cuántas veces está permitido equivocarse por ronda. Cuanto menor sea el número, más difícil será que el jugador gane
var totalWins = 0
var totalLosses = 0



class ViewController: UIViewController {
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
        
    }
    
    var currentGame: Game!
    
    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        
        updateUI()
    }
    
    func updateUI()   {
        var letters:  Array<String> = []
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        
        let wordWithSpacing = letters.joined(separator: " ")
        
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Triunfos: \(totalWins), derrotas: \(totalLosses)"
        
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
        
    }
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        
        currentGame.playerGuessed(letter: letter)
        updateUI()
        
    }
    
}

