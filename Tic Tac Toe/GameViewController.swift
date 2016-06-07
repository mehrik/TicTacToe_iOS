//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Maric Sobreo on 1/8/16.
//  Copyright © 2016 Maric Sobreo (Coding Dojo). All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var redNameLabel: UILabel!
    @IBOutlet weak var blueNameLabel: UILabel!
    
    weak var playerDelegate: DelegateProtocol?
    var TTTG = TicTacToeGame()
    
    @IBOutlet var squares: [UIButton]!
    @IBOutlet weak var winnerLabel: UILabel!
    
    // When you press a square
    @IBAction func gameButtonPressed(sender: UIButton) {
        let turnCount = TTTG.updateTicTacToeBoard(sender)
        if turnCount >= 5 {
            TTTG.checkGame(winnerLabel)
        }
        if winnerLabel.hidden == false {
            for square in squares {
                square.enabled = false
            }
        }
//        let move = Game(obj: TTTG)
//        move.save()
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
        let names = playerDelegate?.sendNames()
        redNameLabel.text = names![0]
        blueNameLabel.text = names![1]
        if let lastGame = Game.last()?.objective {
            TTTG = lastGame
        } else {
            TTTG = TicTacToeGame()
            TTTG.names = names!
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

