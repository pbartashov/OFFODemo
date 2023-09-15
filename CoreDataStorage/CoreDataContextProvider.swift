//
//  CoreDataContextProvider.swift
//  CoreDataStorage
//
//  Created by Павел Барташов on 01.09.2022.
//

//https://www.userdesk.io/blog/repository-pattern-using-core-data-and-swift/
import CoreData

public final class CoreDataContextProvider {

    /// Returns the current container view context
    public var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    /// Returns  container background context
    public let backgroundContext: NSManagedObjectContext

    /// The persistent container
    private var persistentContainer: NSPersistentContainer
    
    public init(bundle: Bundle,
                managedObjectModelFileName: String,
                persistentContainerName: String,
                completionClosure: ((Error?) -> Void)? = nil
    ) {
        // Create a persistent container
        guard let url = bundle.url(forResource: managedObjectModelFileName, withExtension: "momd"),
              let model = NSManagedObjectModel(contentsOf: url)
        else {
            fatalError("Failed to load Core Data model")
        }

        persistentContainer = NSPersistentContainer(name: persistentContainerName, managedObjectModel: model)
        persistentContainer.loadPersistentStores() { (description, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
                
            }
            completionClosure?(error)
        }

        backgroundContext = persistentContainer.newBackgroundContext()
    }
    
    /// Creates a context for background work
    public func newBackgroundContext() -> NSManagedObjectContext {
        persistentContainer.newBackgroundContext()
    }
}
