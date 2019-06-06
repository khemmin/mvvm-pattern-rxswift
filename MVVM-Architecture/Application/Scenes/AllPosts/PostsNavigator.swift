//
//  PostsNavigator.swift
//  MVVM-Architecture
//
//  Created by Kemin Suenggittawisuthi on 4/6/2562 BE.
//  Copyright © 2562 Kemin Suenggittawisuthi. All rights reserved.
//

import UIKit

protocol PostsNavigator {
//    func toCreatePost()
//    func toPost(_ post: Post)
    func toPosts()
}

class DefaultPostsNavigator: PostsNavigator {
    private let storyBoard: UIStoryboard
    private let navigationController: UINavigationController
    private let services: UseCaseProviderProtocol
    
    init(services: UseCaseProviderProtocol,
         navigationController: UINavigationController,
         storyBoard: UIStoryboard) {
        self.services = services
        self.navigationController = navigationController
        self.storyBoard = storyBoard
    }
    
    func toPosts() {
        let vc = storyBoard.instantiateViewController(ofType: PostsViewController.self)
        vc.viewModel = PostsViewModel(useCase: services.makePostsUseCase(),
                                      navigator: self)
        navigationController.pushViewController(vc, animated: true)
    }
//
//    func toCreatePost() {
//        let navigator = DefaultCreatePostNavigator(navigationController: navigationController)
//        let viewModel = CreatePostViewModel(createPostUseCase: services.makePostsUseCase(),
//                                            navigator: navigator)
//        let vc = storyBoard.instantiateViewController(ofType: CreatePostViewController.self)
//        vc.viewModel = viewModel
//        let nc = UINavigationController(rootViewController: vc)
//        navigationController.present(nc, animated: true, completion: nil)
//    }
//
//    func toPost(_ post: Post) {
//        let navigator = DefaultEditPostNavigator(navigationController: navigationController)
//        let viewModel = EditPostViewModel(post: post, useCase: services.makePostsUseCase(), navigator: navigator)
//        let vc = storyBoard.instantiateViewController(ofType: EditPostViewController.self)
//        vc.viewModel = viewModel
//        navigationController.pushViewController(vc, animated: true)
//    }
}

