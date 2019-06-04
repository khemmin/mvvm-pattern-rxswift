//
//  Task.swift
//  MVVM-Architecture
//
//  Created by Kemin Suenggittawisuthi on 4/6/2562 BE.
//  Copyright © 2562 Kemin Suenggittawisuthi. All rights reserved.
//

import Foundation

final class Task {
    let id: String
    var name: String
    var startAt: Date
    var createdAt: Date
    var updatedAt: Date
    var isFinish: Bool
    
    init(id: String = UUID().uuidString,
         name: String, startAt: Date,
         createdAt: Date = Date(), updatedAt: Date = Date(),
         isFinish: Bool = false) {
        self.id = id
        self.name = name
        self.startAt = startAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.isFinish = isFinish
    }
    
    func updateStatus(_ status: Bool = true) {
        isFinish = status
    }
}
