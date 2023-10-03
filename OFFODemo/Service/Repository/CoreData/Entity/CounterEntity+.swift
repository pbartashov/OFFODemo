//
//  CounterEntity+.swift
//  OFFODemo
//
//  Created by Павел Барташов on 01.09.2022.
//

import Foundation
import CoreDataStorage

//https://www.userdesk.io/blog/repository-pattern-using-core-data-and-swift/
extension CounterEntity: DomainModelConvertible {
    public typealias DomainModelType = Counter

    public func toDomainModel() -> DomainModelType {
//        let post = Post(uid: uid ?? "",
//                        timestamp: timestamp ?? Date(),
//                        authorId: authorId ?? "",
//                        content: content ?? "",
//                        likes: Int(likes),
//                        views: Int(views))
//
//        let postViewModel = PostViewModel(from: post)
//        postViewModel.authorName = authorName
//        postViewModel.authorStatus = authorStatus
//        postViewModel.authorAvatarData = authorAvatarData
//        postViewModel.imageData = imageData
        let type = try? JSONDecoder().decode(CounterType.self, from: type ?? Data())

        return Counter(id: uid ?? UUID(),
                       type: type ?? .unknown,
                       roomID: room?.uid ?? UUID(),
                       serialNumber: serialNumber ?? "",
                       account: account ?? "",
                       isTwoTariff: isTwoTariff)
    }

    public func copyDomainModel(model: DomainModelType) {
        uid = model.id
        account = model.account
        isTwoTariff = model.isTwoTariff
        serialNumber = model.serialNumber
        type = try? JSONEncoder().encode(model.type)
        room = managedObjectContext?.getEntity(forUid: model.roomID)
    }
}

extension CounterEntity: UUIDIdentifiable { }
