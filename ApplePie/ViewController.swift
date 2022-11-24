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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
}

