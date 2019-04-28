//
//  Character.swift
//  Projet 03
//
//  Created by Massinissa_theking on 11/03/2019.
//  Copyright © 2019 Massinissa_theking. All rights reserved.
//

import Foundation


class Character {
    var name : String
    var life : Int
    var dammage : Int
    var weapon : String
    
    init(name: String, life: Int, dammage: Int, weapon: String) {
        self.name = name
        self.life = life
        self.dammage = dammage
        self.weapon = weapon
    }
        
    func attack (target: Character){
        target.life = target.life - target.dammage
        print("\(target.name) a reçu \(target.dammage) points de degats. Il a maintenant \(target.life) points de vies ")
    }
}

class Fighter: Character {
    
}

class Colossus: Character {

}
        

class Wizard: Character {
    func heal (target: Character){
        target.life = target.life + target.dammage
        print("\(target.name) a reçcu \(target.dammage) points de soins et a \(target.life) points de vies ")
    }

}

class Dwarf: Character {
    
}


