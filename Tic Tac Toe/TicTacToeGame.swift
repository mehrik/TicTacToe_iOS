//
//  TicTacToeGame.swift
//  Tic Tac Toe
//
//  Created by Maric Sobreo on 1/11/16.
//  Copyright © 2016 Maric Sobreo (Coding Dojo). All rights reserved.
//

import UIKit
class TicTacToeGame {
    var colorRedWhenTrueFalseWhenBlue: Bool = false
    var turnCount: Int = 0
    var ticTacToeBoard: [Int] = [0, 0, 0,
        0, 0, 0,
        0, 0, 0]

    var names: [String] = ["", ""]
    
//    init() {
//        colorRedWhenTrueFalseWhenBlue = false
//        turnCount = 0
//        ticTacToeBoard = [0, 0, 0,
//                          0, 0, 0,
//                          0, 0, 0]
//    }

    func updateTicTacToeBoard(square: UIButton) -> Int {
        let index = square.tag
        if colorRedWhenTrueFalseWhenBlue {
            // Red
            ticTacToeBoard[index] = 1
            square.backgroundColor = UIColor.redColor()
        } else {
            // Blue
            ticTacToeBoard[index] = 2
            square.backgroundColor = UIColor.blueColor()
        }
        colorRedWhenTrueFalseWhenBlue = !colorRedWhenTrueFalseWhenBlue
        square.enabled = false
        ++turnCount
        return turnCount
    }
    
    func reset(winnerLabel: UILabel) {
        winnerLabel.hidden = true
        turnCount = 0
        ticTacToeBoard = [0, 0, 0,
                          0, 0, 0,
                          0, 0, 0]
    }
    
    func checkGame(winnerLabel: UILabel) {
        checkRows(winnerLabel)
        checkColumns(winnerLabel)
        checkDiagonals(winnerLabel)
    }
    
    func checkRows(winnerLabel: UILabel) {
        for var i = 0; i <= 6; i += 3 {
            guard ticTacToeBoard[i] != 0 else { continue }
            guard ticTacToeBoard[i] == ticTacToeBoard[i + 1] else { continue }
            guard ticTacToeBoard[i] == ticTacToeBoard[i + 2] else { continue }
            let color = ticTacToeBoard[i]
            printWinner(color, winnerLabel: winnerLabel)
        }
    }
    
    func checkColumns(winnerLabel: UILabel) {
        for var i = 0; i < 3 ; ++i {
            guard ticTacToeBoard[i] != 0 else { continue }
            guard ticTacToeBoard[i] == ticTacToeBoard[i + 3] else { continue }
            guard ticTacToeBoard[i] == ticTacToeBoard[i + 6] else { continue }
            let color = ticTacToeBoard[i]
            printWinner(color, winnerLabel: winnerLabel)
        }
    }
    
    func checkDiagonals(winnerLabel: UILabel) {
        if ticTacToeBoard[4] != 0 && (leftDiagonal() || rightDiagonal()) {
            let color = ticTacToeBoard[4]
            printWinner(color, winnerLabel: winnerLabel)
        }
    }
    
    func leftDiagonal() -> Bool {
        guard ticTacToeBoard[4] == ticTacToeBoard[0] else { return false }
        guard ticTacToeBoard[4] == ticTacToeBoard[8] else { return false }
        return true
    }
    
    func rightDiagonal() -> Bool {
        guard ticTacToeBoard[4] == ticTacToeBoard[2] else { return false }
        guard ticTacToeBoard[4] == ticTacToeBoard[6] else { return false }
        return true
    }
    
    func printWinner(color: Int, winnerLabel: UILabel) {
        let player: String
        if color == 1 {
            player = names[0]
        } else {
            player = names[1]
        }
        winnerLabel.text = "Congrats \(player) Won!"
        winnerLabel.hidden = false
    }
    
    
}
