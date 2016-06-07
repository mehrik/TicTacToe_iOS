//
//  PlayerViewController.swift
//  Tic Tac Toe
//
//  Created by Maric Sobreo on 1/14/16.
//  Copyright © 2016 Maric Sobreo (Coding Dojo). All rights reserved.
//

import UIKit
class PlayerViewController: UIViewController, DelegateProtocol {
    
    @IBOutlet weak var redPlayerName: UITextField!
    @IBOutlet weak var bluePlayerName: UITextField!
    
    func sendNames() -> [String]{
        if redPlayerName.text!.isEmpty {
            redPlayerName.text! = "Red"
        }
        if bluePlayerName.text!.isEmpty {
            bluePlayerName.text! = "Blue"
        }
        return [redPlayerName.text!, bluePlayerName.text!]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PlayGame" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let gameController = navigationController.topViewController as! GameViewController
            gameController.playerDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
