//
//  UserSettings.swift
//  UserDefaultsSaving
//
//  Created by Иван Романов on 14.07.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import Foundation

final class UserSettings {
    
    private static let defaults = UserDefaults.standard
    private enum UserSettingsKeys: String {
        case name
        case userModel
    }
    
    /// Value type saving
    static var name: String! {
        
        get {
            return defaults.string(forKey: Keys.name.rawValue)
        }
        
        set {
            if let name = newValue {
                print("name added")
                defaults.set(name, forKey: Keys.name.rawValue)
            }
        }
    }
    
    /// Complex type saving
    static var userModel: UserModel! {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: UserSettingsKeys.userModel.rawValue) as? Data, let decodedModel = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? UserModel else {
                return nil
            }
            
            return decodedModel
        }
        set {
            let key = UserSettingsKeys.userModel.rawValue
            
            if let userModel = newValue {
                if let archivedData = try? NSKeyedArchiver.archivedData(withRootObject: userModel, requiringSecureCoding: false) {
                    UserDefaults.standard.set(archivedData, forKey: key)
                }
            }
        }
    }
}
