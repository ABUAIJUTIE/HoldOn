//
//  CoreDataStack.swift
//  HoldOn
//
//  Created by derrick·J on 2018/1/11.
//  Copyright © 2018年 Zheng Buxuan. All rights reserved.
//

import CoreData

class CoreDataStack {
    // MARK: - Core Data stack
    static let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "HoldOn")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Core Data Saving support
    class func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
