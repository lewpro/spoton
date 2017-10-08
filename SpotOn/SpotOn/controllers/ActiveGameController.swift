//
//  ActiveGameController.swift
//  SpotOn
//
//  Created by Rachel Lew on 10/2/17.
//  Copyright © 2017 LewPRO. All rights reserved.
//

import UIKit

struct Const {
    struct SupportedLangs {
        static let english = "EN"
    }
    
    struct LetterSets {
        static let englishLetters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X/Y", "Z"]
    }
    
    struct LetterColoring {
        struct Selected {
            static let background = UIColor(colorLiteralRed: 0.75, green: 1, blue: 0.94, alpha: 1)
            static let foreground = UIColor(colorLiteralRed: 0.21, green: 0.78, blue: 1, alpha: 1)
        }
        
        struct Unselected {
            static let background = UIColor(colorLiteralRed: 0.82, green: 0.82, blue: 0.82, alpha: 1)
            static let foreground = UIColor.white
        }
    }
}

class ActiveGameController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var currentPlayerLabel: UILabel!
    @IBOutlet weak var turnTimer: UILabel!
    @IBOutlet weak var currentBoard: UICollectionView!

    var game : Game!
    var players : [Player]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let game = game {
            // Build board from old game
        } else {
            game = Game.startNewGame(players: players)
        }
        currentPlayerLabel.text = game.currentPlayer() ?? "Winner: \(game.currentWinner())"
        currentBoard.dataSource = self
        currentBoard.delegate = self
        currentBoard.reloadData()
    }

    @IBAction func pauseGame(_ sender: Any) {
    }
    
    @IBAction func exitGame(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "letterCell", for: indexPath) as! LetterCell
        if indexPath.row < Const.LetterSets.englishLetters.count {
            cell.letterLabel.text = Const.LetterSets.englishLetters[indexPath.row]
            cell.isSelected = game.currentBoard?.hasPoint(atIndex: indexPath.row) ?? false
            cell.updateColors()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Const.LetterSets.englishLetters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        game.currentBoard?.togglePoint(atIndex: indexPath.row)
        collectionView.reloadItems(at: [indexPath])
    }
    
    private func concealGameBoard(message: String) {
        
    }
}

class LetterCell : UICollectionViewCell {
    @IBOutlet weak var letterLabel: UILabel!
    
    func updateColors() {
        if isSelected {
            backgroundColor = Const.LetterColoring.Selected.background
            letterLabel.textColor = Const.LetterColoring.Selected.foreground
        } else {
            backgroundColor = Const.LetterColoring.Unselected.background
            letterLabel.textColor = Const.LetterColoring.Unselected.foreground
        }
    }
}
