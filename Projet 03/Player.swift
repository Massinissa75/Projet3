//
//  Player.swift
//  Projet 03
//
//  Created by Massinissa_theking on 12/03/2019.
//  Copyright © 2019 Massinissa_theking. All rights reserved.
//

import Foundation

func input() -> Int {
    let strData = readLine();
    
    return Int(strData!)!
}


class Player {
    
    var name : String
    var team :[ Character ]
    var playerChoice : Int
    
    init(name: String, team:[ Character], playerChoice: Int) {
        self.name = name
        self.team = team
        self.playerChoice = playerChoice
    }
    
    }
    
    func createTeam (){
        
        var Character = [Fighter, Colossus, Wizard, Dwarf]
        var playerChoice : Int
        
        
        print(" veuillez choisir parmis les personnages suivant !")

// afficher les personnages existant
        
        print("1. Fighter ")
        print("2. Colossus ")
        print("3. Wizard ")
        print("4. Dwarf ")
        
        playerChoice = input()
        
        while team.count < 3 {
            switch playerChoice {
                
            case 1: Character = .Fighter
            case 2: Character =  .Colossus
            case 3: Character =  .Wizard
            case 4: Character =  .Dwarf
            
            default:
                break
        }
        
        
    
    
        
        // ecouter l'entree clavier pour le choix d'un personnage
        
   
            print("Veullez selectionner 3 personnages !")
        
        // repeter l'operation jusqu'a ce que on est 3 personnages dans l'equipe
        
    }
    
}



