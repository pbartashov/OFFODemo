////
////  CounterRepository.swift
////  OFFODemo
////
////  Created by Павел Барташов on 01.09.2022.
////
//
//import CoreDataStorage
//import Combine
//
////https://www.userdesk.io/blog/repository-pattern-using-core-data-and-swift/
///// Protocol that describes a Counter repository.
//public protocol CounterRepositoryInterface {
//
//    associatedtype DomainViewModelType
//
//    var countersPublisher: AnyPublisher<[CounterViewModel], Never> { get }
//
//    /// Get a counter using a predicate
//    func getCounters(predicate: NSPredicate?) async throws -> [CounterViewModel]
//    /// Creates a Counter on the persistance layer.
//    func create(counter: CounterViewModel) async throws
//    /// Creates or Updates existing Counter on the persistance layer.
//    func save(counter: CounterViewModel) async throws
//    /// Deletes a Counter from the persistance layer.
//    func delete(counter: CounterViewModel) async throws
//    /// Saves changes to Repository.
//    func saveChanges() async throws
//
//    //    func setupResultsControllerStateChangedHandler(stateChanged:((FetchResultServiceState) -> Void)?)
//    //
//    func startFetchingWith(predicate: NSPredicate?,
//                           sortDescriptors: [NSSortDescriptor]?) throws
//}
//
///// Counter Repository class.
//public final class CounterRepository {
//    /// The Core Data Counter repository.
//    private let repository: CoreDataRepository<CounterEntity>
//    
//    /// Designated initializer
//    /// - Parameter context: The context used for storing and quering Core Data.
//    public init(context: NSManagedObjectContext) {
//        self.repository = CoreDataRepository<CounterEntity>(managedObjectContext: context)
//    }
//}
//
//extension CounterRepository: CounterRepositoryInterface {
//    
//    public var countersPublisher: AnyPublisher<[CounterViewModel], Never> {
//        repository.fetchedResultsPublisher
//            .map { counterEntities in
//                counterEntities.map { $0.toDomainModel() }
//            }
//            .eraseToAnyPublisher()
//    }
//    
//    //    private func mapToCounters(counterEntities: [CounterEntity]) -> [Counter] {
//    //        counterEntities.map { $0.toDomainModel() }
//    //    }
//    //
//    /// Get Counters using a predicate
//    public func getCounters(predicate: NSPredicate?) async throws -> [CounterViewModel] {
//        let counterEntities = try await repository.get(predicate: predicate, sortDescriptors: nil)
//        // Transform the NSManagedObject objects to domain objects
//        return counterEntities.map { $0.toDomainModel() }
//    }
//    
//    /// Creates a Counter on the persistance layer.
//    public func create(counter: CounterViewModel) async throws {
//        let counterEntity = try await repository.create()
//        counterEntity.copyDomainModel(model: counter)
//    }
//    
//    /// Deletes a Counter from the persistance layer.
//    public func delete(counter: CounterViewModel) async throws {
//        let counterEntity = try await getCounterEntity(for: counter)
//        await repository.delete(entity: counterEntity)
//    }
//    
//    /// Creates or Updates existing Counter on the persistance layer.
//    public func save(counter: CounterViewModel) async throws {
//        try await create(counter: counter)
//    }
//    
//    private func getCounterEntity(for counter: CounterViewModel) async throws -> CounterEntity {
//        let predicate = NSPredicate(format: "uid == %@", counter.counter.uid)
//        let counterEntities = try await repository.get(predicate: predicate, sortDescriptors: nil)
//        guard let counterEntity = counterEntities.first else {
//            throw DatabaseError.notFound
//        }
//        return counterEntity
//    }
//    
//    /// Save the NSManagedObjectContext.
//    public func saveChanges() async throws {
//        try await repository.saveChanges()
//    }
//    
//    /// Starts fetching with given NSPredicate and array of NSSortDescriptors.
//    public func startFetchingWith(predicate: NSPredicate?,
//                                  sortDescriptors: [NSSortDescriptor]?) throws {
//        var sorting = sortDescriptors
//        if sorting == nil {
//            sorting = [NSSortDescriptor(keyPath: \CounterEntity.timestamp, ascending: false)]
//        }
//        
//        try repository.startFetchingWith(predicate: predicate, sortDescriptors: sorting)
//    }
//}
