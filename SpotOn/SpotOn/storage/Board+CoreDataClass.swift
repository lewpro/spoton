//
//  Board+CoreDataClass.swift
//  SpotOn
//
//  Created by Rachel Lew on 10/2/17.
//  Copyright © 2017 LewPRO. All rights reserved.
//

import Foundation
import CoreData

@objc(Board)
public class Board: NSManagedObject {
    var score : Int16 {
        get {
            // TODO: Bitshift the lettermask over to calculate current score
            return 0
        }
    }
    
    func hasPoint(atIndex index: Int) -> Bool {
        // TODO: Bitshift to find true / false value
        return false
    }
    
    func togglePoint(atIndex index: Int) {
        // Update bit at index
    }
}
