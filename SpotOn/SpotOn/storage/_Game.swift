// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Game.swift instead.

import Foundation
import CoreData

public enum GameAttributes: String {
    case lastPlayed = "lastPlayed"
    case started = "started"
}

public enum GameRelationships: String {
    case boards = "boards"
    case winner = "winner"
}

open class _Game: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "Game"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Game.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var lastPlayed: Date

    @NSManaged open
    var started: Date

    // MARK: - Relationships

    @NSManaged open
    var boards: NSSet

    open func boardsSet() -> NSMutableSet {
        return self.boards.mutableCopy() as! NSMutableSet
    }

    @NSManaged open
    var winner: Player?

}

extension _Game {

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

