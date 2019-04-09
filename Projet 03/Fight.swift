//
//  Fight.swift
//  Projet 03
//
//  Created by Massinissa_theking on 09/04/2019.
//  Copyright © 2019 Massinissa_theking. All rights reserved.
//

import Foundation

class Fight {
    
    var attack: Int
    var fighterLife: Int
    var targetLife: Int
    init(attack: Int, fighterLife: Int, targetLife: Int) {
        self.attack = attack
        self.fighterLife = fighterLife
        self.targetLife = targetLife
    }
}

func attaquer () {
    print("Choose a character from your team, and choose a target from the opponent team to make an attack")
    
    
    
    var fighterLife :Int = 0
    var targetLife:Int = 0
    
    if fighterLife > targetLife {
        print("the fighter won")
    }
    
    
}
