//
//  NetworkProvider.swift
//  MVVM-Architecture
//
//  Created by Kemin Suenggittawisuthi on 4/6/2562 BE.
//  Copyright © 2562 Kemin Suenggittawisuthi. All rights reserved.
//

import Foundation

final class NetworkProvider {
    private let apiEndpoint: String
    
    init() {
        apiEndpoint = "https://jsonplaceholder.typicode.com"
    }
    
//    public func makeAlbumsNetwork() -> AlbumsNetwork {
//        let network = Network<Album>(apiEndpoint)
//        return AlbumsNetwork(network: network)
//    }
//    
//    public func makeCommentsNetwork() -> CommentsNetwork {
//        let network = Network<Comment>(apiEndpoint)
//        return CommentsNetwork(network: network)
//    }
//    
//    public func makePhotosNetwork() -> PhotosNetwork {
//        let network = Network<Photo>(apiEndpoint)
//        return PhotosNetwork(network: network)
//    }
    
    func makePostsNetwork() -> PostsNetwork {
        let network = Network<Post>(apiEndpoint)
        return PostsNetwork(network: network)
    }
    
//    public func makeTodosNetwork() -> TodosNetwork {
//        let network = Network<Todo>(apiEndpoint)
//        return TodosNetwork(network: network)
//    }
//
//    public func makeUsersNetwork() -> UsersNetwork {
//        let network = Network<User>(apiEndpoint)
//        return UsersNetwork(network: network)
//    }
}
