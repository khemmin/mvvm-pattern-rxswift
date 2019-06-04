//
//  Post.swift
//  MVVM-Architecture
//
//  Created by Kemin Suenggittawisuthi on 31/5/2562 BE.
//  Copyright © 2562 Kemin Suenggittawisuthi. All rights reserved.
//

import Foundation

struct Post: Codable {
    let body: String
    let title: String
    let uid: String
    let userId: String
    let createdAt: String
    
    init(body: String,
                title: String,
                uid: String,
                userId: String,
                createdAt: String) {
        self.body = body
        self.title = title
        self.uid = uid
        self.userId = userId
        self.createdAt = createdAt
    }
    
    init(body: String, title: String) {
        self.init(body: body, title: title, uid: NSUUID().uuidString, userId: "5", createdAt: String(round(Date().timeIntervalSince1970 * 1000)))
    }
    
    enum CodingKeys: String, CodingKey {
        case body
        case title
        case uid
        case userId
        case createdAt
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        body = try container.decode(String.self, forKey: .body)
        title = try container.decode(String.self, forKey: .title)
        
        if let createdAt = try container.decodeIfPresent(Int.self, forKey: .createdAt) {
            self.createdAt = "\(createdAt)"
        } else {
            createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        }
        
        if let userId = try container.decodeIfPresent(Int.self, forKey: .userId) {
            self.userId = "\(userId)"
        } else {
            userId = try container.decode(String.self, forKey: .userId)
        }
        
        if let uid = try container.decodeIfPresent(Int.self, forKey: .uid) {
            self.uid = "\(uid)"
        } else {
            uid = try container.decodeIfPresent(String.self, forKey: .uid) ?? ""
        }
    }
}

extension Post: Equatable {
     static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.uid == rhs.uid &&
            lhs.title == rhs.title &&
            lhs.body == rhs.body &&
            lhs.userId == rhs.userId &&
            lhs.createdAt == rhs.createdAt
    }
}

