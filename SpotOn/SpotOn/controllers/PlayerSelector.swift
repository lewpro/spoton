//
//  PlayerSelector.swift
//  SpotOn
//
//  Created by Rachel Lew on 10/2/17.
//  Copyright © 2017 LewPRO. All rights reserved.
//

import UIKit

class PlayerSelector: UIViewController {

    @IBOutlet weak var player1: UITextField!
    @IBOutlet weak var player2: UITextField!
    
    @IBAction func startGame(_ sender: Any) {
        guard let p1 = player1.text, !p1.isEmpty,
            let p2 = player2.text, !p2.isEmpty else {
            return
        }
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let gameBoard = storyboard.instantiateViewController(withIdentifier: "gameBoard") as! ActiveGameController
        gameBoard.players = [Player.createOrFetchPlayer(withName: p1),
                             Player.createOrFetchPlayer(withName: p2)]
        let prevVC = presentingViewController
        prevVC?.dismiss(animated: true, completion: {
            prevVC?.present(gameBoard, animated: true, completion: nil)
        })
    }
    
    @IBAction func cancel(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
