//
//  UserModel.swift
//  UserDefaultsSaving
//
//  Created by Иван Романов on 13.07.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import Foundation

enum Keys: String {
    case name, surname, sex, city
}

enum SexType: String {
    case male
    case female
}

class UserModel: NSObject, NSCoding {
    
    let name: String
    let surname: String
    let sex: SexType
    let city: String
    
    init(name: String, surname: String, sex: SexType, city: String) {
        self.name = name
        self.surname = surname
        self.city = city
        self.sex = sex
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: Keys.name.rawValue)
        coder.encode(surname, forKey: Keys.surname.rawValue)
        coder.encode(sex.rawValue, forKey: Keys.sex.rawValue)
        coder.encode(city, forKey: Keys.city.rawValue)
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: Keys.name.rawValue) as? String ?? ""
        surname = coder.decodeObject(forKey: Keys.surname.rawValue) as? String ?? ""
        city = coder.decodeObject(forKey: Keys.city .rawValue) as? String ?? ""
        sex = SexType(rawValue: coder.decodeObject(forKey: Keys.sex.rawValue) as! String) ?? SexType.male

    }
    
}
