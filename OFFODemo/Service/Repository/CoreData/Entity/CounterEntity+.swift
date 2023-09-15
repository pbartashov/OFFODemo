//
//  CounterEntity+.swift
//  OFFODemo
//
//  Created by Павел Барташов on 01.09.2022.
//

import CoreDataStorage

//https://www.userdesk.io/blog/repository-pattern-using-core-data-and-swift/
extension CounterEntity: DomainModel {
    public typealias DomainModelType = CounterViewModel

    public func toDomainModel() -> CounterViewModel {
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

        return CounterViewModel()
    }

    public func copyDomainModel(model: CounterViewModel) {
//        uid = model.post.uid
//        timestamp = model.timestamp
//        authorId = "\(model.post.uid)\(model.post.authorId)"
//        authorName = model.authorName
//        authorStatus = model.authorStatus
//        content = model.content
//        authorAvatarData = model.authorAvatarData
//        imageData = model.imageData
//        likes = Int32(model.likes)
//        views = Int32(model.views)
    }
}
