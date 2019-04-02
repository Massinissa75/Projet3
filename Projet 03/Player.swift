//
//  Player.swift
//  Projet 03
//
//  Created by Massinissa_theking on 12/03/2019.
//  Copyright © 2019 Massinissa_theking. All rights reserved.
//

import Foundation


class Player{
    
    var name: String = ""
    var team: [Character] = []
    static var uniqueName:[String] = []
    
    // afficher les personnages disponibles
    func createTeam (){
        print(" Bonjour et bienvenue \(name): ")
        
        
        // repeter l'operation jusqu'à avoir 3 personnages
        
        while team.count < 3 {
            let characterNeeded = 3 - team.count   // le nombre de personnages restant à selectionner
            
            print("""
                veuillez constituer votre équipe et choisir entre les personnages suivant:
                1. Fighter: Le combattant aux 100 points de vies et aux 10 points de dégats
                2. Colossus: Le gros dur qui ne fait pas trop mal
                3. Wizard: Le seul magicien capable de bien des surprises
                4. Dwarf: Le nain qu'il ne faut jamais sous-estimer
                (Il vous reste \(characterNeeded) personnage à selectionner)
                """)
            
            // écouter l'entrée du clavier
            
            let entry = readLine()
            print(entry)
            
            if let playerChoice = entry {
                var character : Character?
                
                switch playerChoice {
                    
                case "1":
                    character = Fighter(name:"", life: 100, dammage: 10, weapon:"sword")
                case "2":
                    character = Colossus(name:"", life: 110, dammage: 5, weapon:"")
                case "3":
                    character = Wizard (name:"" , life: 80, dammage: 3, weapon:"")
                case "4":
                    character = Dwarf (name:"", life: 90, dammage: 12, weapon:"")
                default:
                    print("Vous n'avez toujours pas selectionné 3 personnages !")
                }
                
                if let char = character {
                           print("Comment voulez-vous appeler votre personnage?")
                    if let name = readLine(){
                        if name.count > 0 {
                        if (availableName(uniqueName: name)) {
                                char.name = name
                                team.append(char)
                                print("\(char.name) a été ajouté à votre équipe")
                            } else {
                            print("Vous devez nommer votre joueur ... veuillez recommencer !")
                          
                        }
                      
                    }
                    
                }
               
            }
           
        }
      
    }
    
    }

func availableName(uniqueName: String)-> Bool{
    
    if Player.uniqueName.contains (uniqueName){
        print("Oups ! le nom \(uniqueName) est dejà pris ! ")
        return false
    }else{
        Player.uniqueName.append(uniqueName)
            print(" Votre personnage a un nom qui claque !")
        return true
   }
}
}
