//
//  ViewController.swift
//  ApplePie
//
//  Created by Christian Manzaraz on 23/11/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    var listOfWords = [ "corsario", "swift", "glorioso","incandescente", "pestaña", "insecto", "programa"] // Lista de palabras a adivinar
    let incorrectMovesAllowed = 7 // Establece cuántas veces está permitido equivocarse por ronda. Cuanto menor sea el número, más difícil será que el jugador gane
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    
    var currentGame: Game!
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            
            updateUI()
        } else {
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func updateUI()   {
        let letters: [String] = currentGame.formattedWord.map({String($0)}) /* En reemplazo de ↓
     var letters:  Array<String> = []
     for letter in currentGame.formattedWord {
         letters.append(String(letter))
     }
     */
        
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
        updateGameSate()
    }
    
    func updateGameSate(){
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else  if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
}




