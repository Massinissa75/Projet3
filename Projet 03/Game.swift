//
//  Game.swift
//  Projet 03
//
//  Created by Massinissa_theking on 02/04/2019.
//  Copyright © 2019 Massinissa_theking. All rights reserved.
//

import Foundation


/* dans une partie il y a les 2 joueurs, le choix des personnages, les rounds, le chrono durant le combat, les degats infligés , le vinqueur et le perdant, massage pour proposer une autre partie(continuer)*/


class Game{
    
    var team1 : Player
    var team2 : Player
    var round : Int
    var timeRound : Int = 90
    var attacker = [Character]()
    var defender = [Character]()
    
    init(round: Int) {
        self.round = round
        team1 = Player ()
        team2 = Player ()
        
        debutDeLaPartie()
        attack()
        
    }
    
    func debutDeLaPartie (){  // debut de la partie et création des équipes
            print("Préparez-vous pour la grande bataille !")
            print("Bonjour , comment voulez-vous nommer votre équipe ?")
            team1.setPlayerName()
            team1.createTeam()
            print("Felicitations ! la 1ère équipea a été crée. ")
            print("Bonjour , comment voulez-vous nommer votre équipe ?")
            team2.setPlayerName()
            team2.createTeam()
            print("Felicitations ! la 2eme équipea a été crée.")
    }
        // désigner aléatoirement celui qui va commencer la partie
    func attack(){
        let attacker = team1
        let defender = team2
        let attackingCharacter : Character?
        let defendingCharacter: Character?
            print(" \(attacker.name) vous etes celui qui va commencer la partie")
// afficher les membres de l'équipe
            print("Veuillez choisir un combatan parmis les membres de votre équipe: ")
        for (index, character) in attacker.team.enumerated(){
            print("\(index) - \(character.name) - \(character.life) - \(character.dammage)")
        }
// permettre a l'utilisateur de choisir un combatant de son équipe
        if let choice = readLine(){
            attackingCharacter = attacker.team[Int(choice)!]
            print(" vous avez sélectionné le combatant \(attacker.team[Int(choice)!])")
        }
// afficher les membres de l'équipe adverse
            print("Veuillez choisir un combatan parmis les membres de l'équipe adverse: ")
        for (index, character) in defender.team.enumerated(){
            print("\(index) - \(character.name) - \(character.life) - \(character.dammage)")
        }
// permettre a l'utilisateur de choisir un combatant de l'équipe adverse ( à attaqsuer)
        if let choice = readLine(){
            defendingCharacter = defender.team[Int(choice)!]
            print(" vous allez attaquer le combatant \(defender.team [Int(choice)!])")
        }
    }
    // attaquer la cible
    
    func makeAttack(attacker: Character , defender: Character){
       
        attacker.attack(target: defender)
        defender.life -= defender.dammage
        print(" \(defender.name) a reçu \(defender.dammage) de dégats et il lui reste \(defender.life) points de vie !")
        if defender.life == 0 {
            print("le \(defender.name) est mort!")
        }else{
            print("le combat continue")
        }
     
    
    
    
    
    
    
    
    
        
        /* -
         - attaquer et infliger des dégats ... recevoir des dégats
         - si life cible = 0 : le joueur à perdu et il passe au second personnage
         - si life des 3 personnages = 0 le joueur a perdu et la partie est terminee (print: voulez vouz rejouer)*/
        
        
        
        
        
        
        
        
    }

}
