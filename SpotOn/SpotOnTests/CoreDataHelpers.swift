//
//  CoreDataHelpers.swift
//  SpotOnTests
//
//  Created by Adam on 10/8/17.
//  Copyright © 2017 LewPRO. All rights reserved.
//

import CoreData

func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
    guard let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle.main]) else {
        fatalError("Unable to find managed object model file.")
    }
    
    let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
    
    do {
        try persistentStoreCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
    } catch {
        print("Adding in-memory persistent store failed")
    }
    
    let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
    
    return managedObjectContext
}
