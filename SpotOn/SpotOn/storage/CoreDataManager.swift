//
//  CoreDataManager.swift
//  SpotOn
//
//  Created by Rachel Lew on 3/5/17.
//  Copyright © 2017 LewPRO. All rights reserved.
//

import CoreData

public protocol CoreDataManager
{
    var mainMOC : NSManagedObjectContext { get }
    func saveContext() -> Bool
}

public class CoreData
{
    static var coreDataManager : CoreDataManager?
    
    static func store() -> CoreDataManager
    {
        if let manager = coreDataManager {
            return manager
        }
        
        coreDataManager = CoreDataImpl()
        return coreDataManager!
    }
}

class CoreDataImpl : CoreDataManager
{
    private let model = "SpotOn"
    
    lazy var mainMOC: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        managedObjectContext.parent = self.privateMOC
        
        return managedObjectContext
    }()
    
    func saveContext() -> Bool
    {
        var success = true
        mainMOC.performAndWait
        {
            if self.mainMOC.hasChanges {
                do {
                    try self.mainMOC.save()
                } catch {
                    print("Core Data error: \(error)")
                    success = false
                }
            }
        }
        
        privateMOC.perform
        {
            if self.privateMOC.hasChanges {
                do {
                    try self.privateMOC.save()
                } catch {
                    print("Core Data error: \(error)")
                    success = false
                }
            }
        }
        return success
    }
    
    // MARK: Private Methods
    
    private lazy var privateMOC : NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        
        managedObjectContext.persistentStoreCoordinator = self.persistentStore
        
        return managedObjectContext
    }()
    
    private lazy var managedObjectModel : NSManagedObjectModel? = {
        guard let modelURL = Bundle.main.url(forResource: self.model, withExtension: "momd") else {
            fatalError("Unable to find managed object model file.")
        }
        
        return NSManagedObjectModel(contentsOf: modelURL)
    }()
    
    private lazy var persistentStore : NSPersistentStoreCoordinator = {
        guard let moModel = self.managedObjectModel else {
            fatalError("Unable to find managed object model.")
        }
        
        let store = NSPersistentStoreCoordinator(managedObjectModel: moModel)
        
        let storeName = "\(self.model).sqlite"
        let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documentsDirectoryURL.appendingPathComponent(storeName)
        
        do {
            let options = [NSMigratePersistentStoresAutomaticallyOption : true,
                           NSInferredMappingModelError : true] as [AnyHashable : Bool]
            try store.addPersistentStore(ofType: NSSQLiteStoreType,
                                         configurationName: nil,
                                         at: url,
                                         options: options)
        } catch {
            fatalError("Core data setup error: \(error)")
        }
        
        return store
    }()
}
