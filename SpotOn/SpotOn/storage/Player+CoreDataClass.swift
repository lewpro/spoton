//
//  Player+CoreDataClass.swift
//  SpotOn
//
//  Created by Rachel Lew on 10/2/17.
//  Copyright © 2017 LewPRO. All rights reserved.
//

import Foundation
import CoreData

@objc(Player)
public class Player: NSManagedObject {
    class func createOrFetchPlayer(withName name: String) -> Player {
        let context = CoreData.store().mainMOC
        
        let request : NSFetchRequest<Player> = Player.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", name)
        do {
            let existingPlayer = try context.fetch(request)
            if let player = existingPlayer.first {
                return player
            }
        } catch {
            print("Failure when trying to retrieve existing player: \(error.localizedDescription)")
        }
        
        let player = NSEntityDescription.insertNewObject(forEntityName: "Player", into: context) as! Player
        player.name = name
        
        _ = CoreData.store().saveContext()
        
        return player
    }
}
