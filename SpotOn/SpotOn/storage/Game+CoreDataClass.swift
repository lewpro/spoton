//
//  Game+CoreDataClass.swift
//  SpotOn
//
//  Created by Rachel Lew on 10/2/17.
//  Copyright © 2017 LewPRO. All rights reserved.
//

import Foundation
import CoreData

@objc(Game)
public class Game: NSManagedObject {
    class func startNewGame(players: [Player]) -> Game {
        let context = CoreData.store().mainMOC
        
        var boards = Set<Board>()
        for player in players {
            // Create a board for that player
            let board = NSEntityDescription.insertNewObject(forEntityName: "Board", into: context) as! Board
            board.player = player
            boards.insert(board)
        }
        
        // Initialize game
        let game = NSEntityDescription.insertNewObject(forEntityName: "Game", into: context) as! Game
        game.language = Const.SupportedLangs.english
        game.started = NSDate()
        game.lastPlayed = NSDate()
        game.currentBoard = boards.first
        game.boards = NSSet(set: boards)

        _ = CoreData.store().saveContext()
        return game
    }
    
    class func recentGamesRequest() -> NSFetchRequest<Game> {
        let req = NSFetchRequest<Game>(entityName: "Game")
        req.sortDescriptors = [NSSortDescriptor(key: "started", ascending: false)]
        return req
    }
    
    func currentWinner() -> String? {
        var winners : String? = nil
        var highestScore : Int16 = 0
        for board in boards as! Set<Board> {
            let player : String = board.player!.name ?? "Unknown Player"
            if board.score == highestScore {
                if winners == nil || winners!.isEmpty {
                    winners = player
                } else {
                    winners = "\(winners!), \(player)"
                }
            } else if board.score > highestScore {
                highestScore = board.score
                winners = player
            }
        }
        return winners
    }
    
    func currentPlayer() -> String? {
        return currentBoard?.player?.name
    }
}
