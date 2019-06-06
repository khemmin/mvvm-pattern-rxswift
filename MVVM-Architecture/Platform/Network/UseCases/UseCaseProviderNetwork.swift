//
//  UseCaseProviderNetwork.swift
//  MVVM-Architecture
//
//  Created by Kemin Suenggittawisuthi on 4/6/2562 BE.
//  Copyright © 2562 Kemin Suenggittawisuthi. All rights reserved.
//

import Foundation

final class UseCaseProviderNetwork: UseCaseProviderProtocol {
    private let networkProvider: NetworkProvider
    
    init() {
        networkProvider = NetworkProvider()
    }
    
    func makePostsUseCase() -> PostsUseCaseProtocol {
        return PostsUseCaseNetwork(network: networkProvider.makePostsNetwork(),
                            cache: Cache<Post>(path: "allPosts"))
    }
}
