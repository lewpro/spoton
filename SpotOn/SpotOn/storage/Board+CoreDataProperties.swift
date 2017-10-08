//
//  Board+CoreDataProperties.swift
//  SpotOn
//
//  Created by Rachel Lew on 10/2/17.
//  Copyright © 2017 LewPRO. All rights reserved.
//

import Foundation
import CoreData


extension Board {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Board> {
        return NSFetchRequest<Board>(entityName: "Board");
    }

    @NSManaged public var letterMask: Int32
    @NSManaged public var game: Game?
    @NSManaged public var player: Player?

}
