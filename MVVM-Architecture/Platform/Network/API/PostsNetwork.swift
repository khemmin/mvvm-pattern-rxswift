//
//  PostsNetwork.swift
//  MVVM-Architecture
//
//  Created by Kemin Suenggittawisuthi on 4/6/2562 BE.
//  Copyright © 2562 Kemin Suenggittawisuthi. All rights reserved.
//

import Foundation
import RxSwift

final class PostsNetwork {
    private let network: Network<Post>
    
    init(network: Network<Post>) {
        self.network = network
    }
    
    func fetchPosts() -> Observable<[Post]> {
        return network.getItems("posts")
    }
    
    func fetchPost(postId: String) -> Observable<Post> {
        return network.getItem("posts", itemId: postId)
    }
    
    func createPost(post: Post) -> Observable<Post> {
        return network.postItem("posts", parameters: post.toJSON())
    }
    
    func deletePost(postId: String) -> Observable<Post> {
        return network.deleteItem("posts", itemId: postId)
    }
}
