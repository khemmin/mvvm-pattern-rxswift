//
//  RealmRepository.swift
//  MVVM-Architecture
//
//  Created by Kemin Suenggittawisuthi on 4/6/2562 BE.
//  Copyright © 2562 Kemin Suenggittawisuthi. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import RxSwift
import RxRealm

protocol Repository {
    associatedtype Entity
    func findAll() -> Observable<[Entity]>
    func find(with predicate: NSPredicate, sortDescriptors: [NSSortDescriptor]) -> Observable<[Entity]>
    func save(_ entities: [Entity]) -> Observable<[Entity]>
    func save(_ entity: Entity) -> Observable<Entity>
    func delete(_ entity: Entity) -> Observable<Void>
}

final class RealmRepository<T: RealmRepresentable>: Repository where T == T.RealmType.ModelType, T.RealmType: Object {
    
    private let configuration: Realm.Configuration
    private let concurrentScheduler: ConcurrentDispatchQueueScheduler
    private let serialScheduler: SerialDispatchQueueScheduler
    
    private var realm: Realm {
        guard let realm = try? Realm(configuration: configuration) else {
            fatalError()
        }
        return realm
    }
    
    init(configuration: Realm.Configuration = Realm.Configuration()) {
        self.configuration = configuration
        let concurrentQueue = DispatchQueue(label: "me.mlsuho.realm.concurrent", qos: .background)
        concurrentScheduler = ConcurrentDispatchQueueScheduler(queue: concurrentQueue)
        serialScheduler = SerialDispatchQueueScheduler(internalSerialQueueName: "me.mlsuho.realm.serial")
        print("📂\(RLMRealmPathForFile("default.realm"))")
    }
    
    func findAll() -> Observable<[T]> {
        return Observable.deferred {
            let realm = self.realm
            let objs = realm.objects(T.RealmType.self)
            return Observable.array(from: objs)
                .map { $0.map { $0.asModel() } }
                .observeOn(self.concurrentScheduler)
        }
    }
    
    func find(with predicate: NSPredicate, sortDescriptors: [NSSortDescriptor]) -> Observable<[T]> {
        return Observable.deferred {
            let realm = self.realm
            let objs = realm
                .objects(T.RealmType.self)
                .filter(predicate)
                .sorted(by: sortDescriptors.compactMap { (des) -> SortDescriptor? in
                    guard let key = des.key else { return nil }
                    return SortDescriptor(keyPath: key, ascending: des.ascending)
                })
            return Observable.array(from: objs)
                .map { $0.map { $0.asModel() } }
                .observeOn(self.concurrentScheduler)
        }
    }
    
    func save(_ entities: [T]) -> Observable<[T]> {
        return Observable.deferred {
            let realm = self.realm
            return realm.rx.save(entities)
            }.observeOn(self.serialScheduler)
    }
    
    func save(_ entity: T) -> Observable<T> {
        return Observable.deferred {
            let realm = self.realm
            return realm.rx.save(entity)
            }.observeOn(self.serialScheduler)
    }
    
    func delete(_ entity: T) -> Observable<Void> {
        return Observable.deferred {
            let realm = self.realm
            return realm.rx.delete(entity)
            }.observeOn(self.serialScheduler)
    }
}

