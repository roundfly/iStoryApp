//
//  StorageAccessInterface.swift
//  
//
//  Created by Nikola Stojanovic on 24.7.21..
//

import Foundation

public protocol StorageAccessInterface {
    func integer(forKey defaultName: String) -> Int
    func bool(forKey defaultName: String) -> Bool
    func double(forKey defaultName: String) -> Double
    func string(forKey defaultName: String) -> String?
    func data(forKey defaultName: String) -> Data?
    func set(_ value: Bool, forKey defaultName: String)
    func set(_ value: Any?, forKey defaultName: String)
    func register(defaults registrationDictionary: [String: Any])
    func removeObject(forKey defaultName: String)
    func value(forKey key: String) -> Any?
    func object(forKey defaultName: String) -> Any?
}

public extension UserDefaults: StorageAccessInterface {}
