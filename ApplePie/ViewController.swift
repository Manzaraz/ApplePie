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
 
    }
    


    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
}

