//
//  GameSelector.swift
//  SpotOn
//
//  Created by Adam on 2/26/17.
//  Copyright © 2017 LewPRO. All rights reserved.
//

import CoreData
import UIKit

class GameSelector: UIViewController, NSFetchedResultsControllerDelegate, UITableViewDataSource {
    
    @IBOutlet weak var prevGamesTable: UITableView!
    private var gamesController : NSFetchedResultsController<Game>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gamesController = NSFetchedResultsController.init(fetchRequest: Game.recentGamesRequest(),
                                                          managedObjectContext: CoreData.store().mainMOC,
                                                          sectionNameKeyPath: nil,
                                                          cacheName: nil)
        gamesController.delegate = self
        prevGamesTable.dataSource = self
        
        do {
            try gamesController.performFetch()
        } catch {
            print("Unable to perform fetch of recent games: \(error.localizedDescription)")
        }
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prevGameCell")!
        if let games = gamesController.fetchedObjects, indexPath.row < games.count {
            let currentGame = games[indexPath.row]
            cell.textLabel?.text = currentGame.currentWinner()
            cell.detailTextLabel?.text = DateFormatter.localizedString(from: currentGame.started! as Date,
                                                                       dateStyle: .short,
                                                                       timeStyle: .short)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesController.fetchedObjects?.count ?? 0
    }
    
    // MARK: NSFetchedResultsControllerDelegate
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        prevGamesTable.reloadData()
    }
}

