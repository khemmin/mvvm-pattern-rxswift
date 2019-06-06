//
//  PostsViewModel.swift
//  MVVM-Architecture
//
//  Created by Kemin Suenggittawisuthi on 4/6/2562 BE.
//  Copyright © 2562 Kemin Suenggittawisuthi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class PostsViewModel: ViewModelType {
    
    struct Input {
//        let trigger: Driver<Void>
        let createPostTrigger: Driver<Void>
//        let selection: Driver<IndexPath>
    }
    struct Output {
        let fetching: Driver<Bool>
//        let posts: Driver<[PostItemViewModel]>
        let createPost: Driver<Void>
//        let selectedPost: Driver<Post>
        let error: Driver<Error>
    }
    
    private let useCase: PostsUseCaseProtocol
    private let navigator: PostsNavigator
    
    init(useCase: PostsUseCaseProtocol, navigator: PostsNavigator) {
        self.useCase = useCase
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
//        let posts = input.trigger.flatMapLatest {
//            return self.useCase.posts()
//                .trackActivity(activityIndicator)
//                .trackError(errorTracker)
//                .asDriverOnErrorJustComplete()
//                .map { $0.map { PostItemViewModel(with: $0) } }
//        }
//        let posts = input.trigger.flatMapLatest {
//            return self.useCase.posts()
//                .trackActivity(activityIndicator)
//                .trackError(errorTracker)
//                .asDriverOnErrorJustComplete()
//                .map { $0.map { PostItemViewModel(with: $0) } }
//        }
        
        let fetching = activityIndicator.asDriver()
        let errors = errorTracker.asDriver()
//        let selectedPost = input.selection
//            .withLatestFrom(posts) { (indexPath, posts) -> Post in
//                return posts[indexPath.row].post
//            }
//            .do(onNext: navigator.toPost)
        let createPost = input.createPostTrigger.do(onNext: { (Void) in
            let val = self.useCase.posts().subscribe()
            print(val)
        })
        
        
        return Output(fetching: fetching,
//                      posts: posts,
                      createPost: createPost,
//                      selectedPost: selectedPost,
                      error: errors)
    }
}
