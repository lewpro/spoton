//
//  CoreDataHelpers.swift
//  SpotOnTests
//
//  Created by Adam on 10/8/17.
//  Copyright © 2017 LewPRO. All rights reserved.
//

import Foundation
import CoreData

func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
    guard let modelURL = Bundle.main.url(forResource: "SponOn", withExtension: "momd") else {
        fatalError("Unable to find managed object model file.")
    }
        
    guard let managedOBjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
        fatalError("Unable to find managed object model file.")
    }
    
    let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedOBjectModel)
    
    do {
        try persistentStoreCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
    } catch {
        print("Adding in-memory persistent store failed")
    }
    
    let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
    
    return managedObjectContext
}
