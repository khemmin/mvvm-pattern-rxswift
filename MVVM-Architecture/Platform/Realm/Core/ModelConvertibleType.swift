//
//  ModelConvertibleType.swift
//  MVVM-Architecture
//
//  Created by Kemin Suenggittawisuthi on 4/6/2562 BE.
//  Copyright © 2562 Kemin Suenggittawisuthi. All rights reserved.
//

import Foundation

protocol ModelConvertibleType {
    associatedtype ModelType
    func asModel() -> ModelType
}