//
//  Animal.swift
//  afternoonProjectCardGame
//
//  Created by Justin Webster on 4/22/21.
//

import UIKit

class Animal {
    
    let species: String
    let photo: UIImage?
    let breed: String
    let uuid: String
    
    init(species: String, photo: UIImage?, breed: String, uuid: String = UUID().uuidString) {
        
        self.species = species
        self.photo = photo
        self.breed = breed
        self.uuid = uuid
    }
    
}//End of Class

extension Animal: Equatable {
    static func == (lhs: Animal, rhs: Animal) -> Bool {
       return lhs.uuid == rhs.uuid
    }
}//End of Extension
