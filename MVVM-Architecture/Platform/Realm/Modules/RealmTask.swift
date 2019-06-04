//
//  RealmTask.swift
//  MVVM-Architecture
//
//  Created by Kemin Suenggittawisuthi on 4/6/2562 BE.
//  Copyright © 2562 Kemin Suenggittawisuthi. All rights reserved.
//

import Foundation
import RealmSwift
import RxRealm
import RxSwift

final class RealmTask<R: Repository>: TaskUseCase where R.Entity == Task {
    private let repository: R
    
    init(repository: R) {
        self.repository = repository
    }
    
    func add(_ task: Task) -> Observable<Task> {
        return repository.save(task)
    }
    
    func update(_ task: Task) -> Observable<Task> {
        return repository.save(task)
    }
    
//    func today() -> Observable<[Task]> {
//        let calendar = Calendar(from: <#T##Decoder#>)
//        let today = Date()
//        var components = calendar.dateComponents(from: today)
//        guard let startDate = calendar.date(from: components.begin()),
//            let endDate = calendar.date(from: components.end()) else {
//                return Observable.error(RealmError.system)
//        }
//        let predicate = NSPredicate(format: "startAt >= %@ AND startAt =< %@", argumentArray: [startDate, endDate])
//        let sortDescriptors: [NSSortDescriptor] = [NSSortDescriptor(key: "isFinish", ascending: true),
//                                                   NSSortDescriptor(key: "startAt", ascending: true)]
//        return repository.find(with: predicate, sortDescriptors: sortDescriptors)
//    }
    
    func find(by id: String) -> Observable<Task?> {
        let predicate = NSPredicate(format: "id = %@", argumentArray: [id])
        return repository.find(with: predicate, sortDescriptors: []).map({ tasks -> Task? in
            return tasks.first
        })
    }
    
    func delete(_ task: Task) -> Observable<Void> {
        return repository.delete(task)
    }
}

