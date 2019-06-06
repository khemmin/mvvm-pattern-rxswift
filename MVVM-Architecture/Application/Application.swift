//
//  Application.swift
//  MVVM-Architecture
//
//  Created by Kemin Suenggittawisuthi on 5/6/2562 BE.
//  Copyright © 2562 Kemin Suenggittawisuthi. All rights reserved.
//

import Foundation
import UIKit

final class Application {
    static let shared = Application()
    
    private let networkUseCaseProvider: UseCaseProviderProtocol
    
    private init() {
        self.networkUseCaseProvider = UseCaseProviderNetwork()
    }
    
    func configureMainInterface(in window: UIWindow) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let networkNavigationController = UINavigationController()

        let networkNavigator = DefaultPostsNavigator(services: networkUseCaseProvider,
                                                     navigationController: networkNavigationController,
                                                     storyBoard: storyboard)
      
        window.rootViewController = networkNavigationController
        
        networkNavigator.toPosts()
    }
}
