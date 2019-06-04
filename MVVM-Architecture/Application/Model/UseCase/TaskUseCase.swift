//
//  TaskUseCase.swift
//  MVVM-Architecture
//
//  Created by Kemin Suenggittawisuthi on 4/6/2562 BE.
//  Copyright © 2562 Kemin Suenggittawisuthi. All rights reserved.
//

import Foundation
import RxSwift

protocol TaskUseCase {
    func add(_ task: Task) -> Observable<Task>
    func update(_ task: Task) -> Observable<Task>
//    func today() -> Observable<[Task]>
    func find(by id: String) -> Observable<Task?>
    func delete(_ task: Task) -> Observable<Void>
}
