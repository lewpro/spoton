// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Player.swift instead.

import Foundation
import CoreData

public enum PlayerAttributes: String {
    case id = "id"
    case name = "name"
}

public enum PlayerRelationships: String {
    case boards = "boards"
    case games = "games"
}

open class _Player: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "Player"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Player.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var id: NSNumber?

    @NSManaged open
    var name: String

    // MARK: - Relationships

    @NSManaged open
    var boards: NSSet

    open func boardsSet() -> NSMutableSet {
        return self.boards.mutableCopy() as! NSMutableSet
    }

    @NSManaged open
    var games: NSSet

    open func gamesSet() -> NSMutableSet {
        return self.games.mutableCopy() as! NSMutableSet
    }

}

extension _Player {

    open func addBoards(_ objects: NSSet) {
        let mutable = self.boards.mutableCopy() as! NSMutableSet
        mutable.union(objects as Set<NSObject>)
        self.boards = mutable.copy() as! NSSet
    }

    open func removeBoards(_ objects: NSSet) {
        let mutable = self.boards.mutableCopy() as! NSMutableSet
        mutable.minus(objects as Set<NSObject>)
        self.boards = mutable.copy() as! NSSet
    }

    open func addBoardsObject(_ value: Board) {
        let mutable = self.boards.mutableCopy() as! NSMutableSet
        mutable.add(value)
        self.boards = mutable.copy() as! NSSet
    }

    open func removeBoardsObject(_ value: Board) {
        let mutable = self.boards.mutableCopy() as! NSMutableSet
        mutable.remove(value)
        self.boards = mutable.copy() as! NSSet
    }

}

extension _Player {

    open func addGames(_ objects: NSSet) {
        let mutable = self.games.mutableCopy() as! NSMutableSet
        mutable.union(objects as Set<NSObject>)
        self.games = mutable.copy() as! NSSet
    }

    open func removeGames(_ objects: NSSet) {
        let mutable = self.games.mutableCopy() as! NSMutableSet
        mutable.minus(objects as Set<NSObject>)
        self.games = mutable.copy() as! NSSet
    }

    open func addGamesObject(_ value: Game) {
        let mutable = self.games.mutableCopy() as! NSMutableSet
        mutable.add(value)
        self.games = mutable.copy() as! NSSet
    }

    open func removeGamesObject(_ value: Game) {
        let mutable = self.games.mutableCopy() as! NSMutableSet
        mutable.remove(value)
        self.games = mutable.copy() as! NSSet
    }

}

