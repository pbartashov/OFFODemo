//
//  DomainModel.swift
//  CoreDataStorage
//
//  Created by Павел Барташов on 01.09.2022.
//

//https://www.userdesk.io/blog/repository-pattern-using-core-data-and-swift/
public protocol DomainModel {
    associatedtype DomainModelType
    func toDomainModel() -> DomainModelType
    func copyDomainModel(model: DomainModelType)
}
