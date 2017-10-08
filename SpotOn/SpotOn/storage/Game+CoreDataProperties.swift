//
//  Game+CoreDataProperties.swift
//  SpotOn
//
//  Created by Rachel Lew on 10/2/17.
//  Copyright © 2017 LewPRO. All rights reserved.
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game");
    }

    @NSManaged public var lastPlayed: NSDate?
    @NSManaged public var started: NSDate?
    @NSManaged public var language: String?
    @NSManaged public var boards: NSSet?
    @NSManaged public var currentBoard: Board?

}

// MARK: Generated accessors for boards
extension Game {

    @objc(addBoardsObject:)
    @NSManaged public func addToBoards(_ value: Board)

    @objc(removeBoardsObject:)
    @NSManaged public func removeFromBoards(_ value: Board)

    @objc(addBoards:)
    @NSManaged public func addToBoards(_ values: NSSet)

    @objc(removeBoards:)
    @NSManaged public func removeFromBoards(_ values: NSSet)

}
