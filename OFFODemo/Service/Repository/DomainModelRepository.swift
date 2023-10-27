//
//  DomainModelRepository.swift
//  OFFODemo
//
//  Created by Павел Барташов on 13.09.2023.
//

import CoreData
import CoreDataStorage
import Combine

//https://www.userdesk.io/blog/repository-pattern-using-core-data-and-swift/
/// Protocol that describes a Domain model repository.
public protocol DomainModelRepositoryProtocol {

    associatedtype DomainModelType

    var domainModelsPublisher: AnyPublisher<[DomainModelType], Never> { get }

    /// Get a Domain model using a predicate
    func getDomainModels(predicate: NSPredicate?) async throws -> [DomainModelType]
    /// Creates a Domain model on the persistance layer.
    func create(domainModel: DomainModelType) async throws
    /// Creates or Updates existing Domain model on the persistance layer.
    func save(domainModel: DomainModelType) async throws
    /// Deletes a Domain model from the persistance layer.
    func delete(domainModel: DomainModelType) async throws
    /// Saves changes to Repository.
    func saveChanges() async throws
    /// Starts fetching data from Repository.
    func startFetchingWith(predicate: NSPredicate?,
                           sortDescriptors: [NSSortDescriptor]?) throws
}

/// Domain model Repository class.
public struct DomainModelRepository<T: Repository> where T.Entity: DomainModelConvertible {

    public typealias RepositoryType = T
    public typealias Entity = T.Entity

    /// The Core Data Domain model repository.
    private let repository: RepositoryType

    /// Designated initializer
    /// - Parameter context: The context used for storing and quering Core Data.
    public init(repository: RepositoryType) {
        self.repository = repository
    }
}

extension DomainModelRepository: DomainModelRepositoryProtocol
where Entity.DomainModelType: Identifiable,
      Entity.DomainModelType.ID: CVarArg {

    public typealias DomainModelType = Entity.DomainModelType

    public var domainModelsPublisher: AnyPublisher<[DomainModelType], Never> {
        repository.fetchedResultsPublisher
            .map { domainModelEntities in
                domainModelEntities.map { $0.toDomainModel() }
            }
            .eraseToAnyPublisher()
    }

    /// Get Domain models using a predicate
    public func getDomainModels(predicate: NSPredicate?) async throws -> [DomainModelType] {
        let domainModelEntities = try await repository.get(predicate: predicate, sortDescriptors: nil)
        // Transform the NSManagedObject objects to domain objects
        return domainModelEntities.map { $0.toDomainModel() }
    }

    /// Creates a Domain model on the persistance layer.
    public func create(domainModel: DomainModelType) async throws {
        let domainModelEntity = try await repository.create()
        domainModelEntity.copyDomainModel(model: domainModel)
    }

    /// Deletes a Domain model from the persistance layer.
    public func delete(domainModel: DomainModelType) async throws {
        let domainModelEntity = try await getEntity(for: domainModel)
        await repository.delete(entity: domainModelEntity)
    }

    /// Creates or Updates existing Domain model on the persistance layer.
    public func save(domainModel: DomainModelType) async throws {
        try await create(domainModel: domainModel)
    }

    private func getEntity(for domainModel: DomainModelType) async throws -> Entity {
        let predicate = NSPredicate(format: "uid == %@", domainModel.id)
        let domainModelEntities = try await repository.get(predicate: predicate, sortDescriptors: nil)
        guard let domainModelEntity = domainModelEntities.first else {
            throw DatabaseError.notFound
        }
        return domainModelEntity
    }

    /// Save the NSManagedObjectContext.
    public func saveChanges() async throws {
        try await repository.saveChanges()
    }

    /// Starts fetching with given NSPredicate and array of NSSortDescriptors.
    public func startFetchingWith(predicate: NSPredicate?,
                                  sortDescriptors: [NSSortDescriptor]?) throws {
        try repository.startFetchingWith(predicate: predicate, sortDescriptors: sortDescriptors, sectionNameKeyPath: nil)
    }
}
