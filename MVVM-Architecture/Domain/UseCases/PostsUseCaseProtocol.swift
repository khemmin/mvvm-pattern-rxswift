//
//  PostsUseCaseProtocol.swift
//  MVVM-Architecture
//
//  Created by Kemin Suenggittawisuthi on 31/5/2562 BE.
//  Copyright © 2562 Kemin Suenggittawisuthi. All rights reserved.
//

import Foundation
import RxSwift

protocol PostsUseCaseProtocol {
    func posts() -> Observable<[Post]>
    func save(post: Post) -> Observable<Void>
    func delete(post: Post) -> Observable<Void>
}

