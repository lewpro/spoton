// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Board.swift instead.

import Foundation
import CoreData

public enum BoardAttributes: String {
    case letterMask = "letterMask"
    case score = "score"
}

public enum BoardRelationships: String {
    case player = "player"
}

open class _Board: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "Board"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Board.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var letterMask: NSNumber?

    @NSManaged open
    var score: NSNumber?

    // MARK: - Relationships

    @NSManaged open
    var player: Player?

}

