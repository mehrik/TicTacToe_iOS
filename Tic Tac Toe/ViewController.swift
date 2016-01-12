//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Maric Sobreo on 1/8/16.
//  Copyright © 2016 Maric Sobreo (Coding Dojo). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var TTTG = TicTacToeGame()
    
    @IBOutlet var squares: [UIButton]!
    @IBOutlet weak var winnerLabel: UILabel!
    
    // When you press a square
    @IBAction func gameButtonPressed(sender: UIButton) {
        let turnCount = TTTG.updateTicTacToeBoard(sender)
        if turnCount >= 5 {
            TTTG.checkRows(winnerLabel)
            TTTG.checkColumns(winnerLabel)
            TTTG.checkDiagonals(winnerLabel)
        }
        if winnerLabel.hidden == false {
            for square in squares {
                square.enabled = false
            }
        }
    }
    
    @IBAction func resetButtonPressed(sender: UIButton) {
        for square in squares {
            square.enabled = true
            square.backgroundColor = UIColor.lightGrayColor()
        }
        TTTG.reset(winnerLabel)
    }
    
    // Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        TTTG.reset(winnerLabel)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

