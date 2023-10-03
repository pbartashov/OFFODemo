//
//  DomainModelConvertible+.swift
//  OFFODemo
//
//  Created by Павел Барташов on 26.09.2023.
//

//import CoreData
//
//extension DomainModelConvertible where Self: NSManagedObject, DomainModelType: UUIDIdentifiable {
//    static func getEntity(for domainModel: DomainModelType) {
//        let persistedValue: Self
//            let fetchRequest = Self.fetchRequest()
//            fetchRequest.predicate = NSPredicate(format: "id = %@", domainModel.id as CVarArg)
//            if let results = try? conte.fetch(fetchRequest),
//               let firstResult = results.first as? Self {
//                persistedValue = firstResult
//            } else {
//                persistedValue = Self.init(context: context)
//                self.id = persistedValue.value(forKey: "id") as? Int
//            }
//
//
//        return setValuesFromMirror(persistedValue: persistedValue)
//    }
//}
//
//
