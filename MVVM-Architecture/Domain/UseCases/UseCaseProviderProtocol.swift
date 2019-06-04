//
//  UseCaseProviderProtocol.swift
//  MVVM-Architecture
//
//  Created by Kemin Suenggittawisuthi on 31/5/2562 BE.
//  Copyright © 2562 Kemin Suenggittawisuthi. All rights reserved.
//

import Foundation

protocol UseCaseProviderProtocol {
    
    func makePostsUseCase() -> PostsUseCaseProtocol
}
