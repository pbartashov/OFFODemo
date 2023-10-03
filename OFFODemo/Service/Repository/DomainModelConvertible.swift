//
//  DomainModelConvertible.swift
//  OFFODemo
//
//  Created by Павел Барташов on 01.09.2022.
//



//import Foundation

//protocol UUIDIdentifiable: Identifiable {
//    var id: UUID { get }
//}

//https://www.userdesk.io/blog/repository-pattern-using-core-data-and-swift/
public protocol DomainModelConvertible {
    associatedtype DomainModelType
    func toDomainModel() -> DomainModelType
    func copyDomainModel(model: DomainModelType)
}
