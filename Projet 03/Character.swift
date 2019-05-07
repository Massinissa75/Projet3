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
    var life : Int {
        didSet {            //when defendingCharacter has no points of life ... he dead
            if life < 0 {
                self.life = 0
            }
        }
    }
    var damage : Int
    var weapon : String
    
    init(name: String, life: Int, damage: Int, weapon: String) {
        self.name = name
        self.life = life
        self.damage = damage
        self.weapon = weapon
    }
        
    func attack (target: Character){
        target.life = target.life - self.damage
        print("\(target.name) received \(self.damage) points of dammage. He has now \(target.life) life points ")
    }
}

class Fighter: Character {}

class Colossus: Character {}

class Dwarf: Character {}

class Wizard: Character {
    var heal: Int
    init(name: String, life: Int, weapon: String, damage: Int, heal: Int) {
        self.heal = heal
        super.init(name: name, life: 60, damage: 0, weapon: "")
    }
    func health (target: Character){
        target.life = target.life + self.heal
        print("\(target.name) received \(self.heal) points of heal and he has now \(target.life) life points ")
    }

}



