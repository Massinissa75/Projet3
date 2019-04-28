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
    var attackingCharacter: Character?
    var defendingCharacter: Character?
    
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
    
    
        // désigner celui qui va commencer la partie
    func attack(){
        var attacker = team1
        var defender = team2
        repeat{
        // Choisir un membre
        print(" \(attacker.name) vous etes celui qui va commencer la partie")
        let attackingCharacter = makeChoice (in: attacker)
        // Si c'est le mage, il choisi un membre de son équipe à soigné sinon un membre de l'équipe adverse à attaquer
        if let magus = attackingCharacter as? Wizard {
            print("\(attacker.name) vous avez choisi \(attackingCharacter.name) pour lui prodiguer des soins")
            let healedCharacter = makeChoice(in: attacker)
            magus.heal(target: healedCharacter)
            print("\(healedCharacter.name) a maintenant \(healedCharacter.life) points de vie !")
        } else {
        // Choix de l'adversaire à attaquer
            print("\(attacker.name) veuillez choisir un membre de l'équipe adverse à attaquer ")
            let defendingCharacter = makeChoice(in: defender)
            print("\(attacker.name) vous allez attaquer \(defendingCharacter.name)")
            if defendingCharacter.life > 0 {
            attackingCharacter.attack(target: defendingCharacter)
            }
        }
        swap(&attacker, &defender)
        }while (team1.team.count > 0 || team2.team.count > 0)

    }
            
        // afficher les membres de l'équipe
    
        func makeChoice (in player: Player)-> Character {
            for (index, character) in player.team.enumerated() {
                print("\(index) - Name: \(character.name) - Life: \(character.life) - Dammage:\(character.dammage)")
            }
                if let choice = readLine(){
                    if let selected = Int(choice){
                        if (selected < player.team.count && selected >= 0){
                            return player.team[selected]
                        }
                    }
                }
                print("Je n'ai pas compris")
                return makeChoice(in: player)
        }
}
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
          /*  print("Veuillez choisir un combattant parmis les membres de votre équipe: ")
        for (index, character) in attacker.team.enumerated(){
            print("\(index) - Nom: \(character.name) - Vie: \(character.life) - Dégats:\(character.dammage)")
        }
// permettre a l'utilisateur de choisir un combatant de son équipe
        if let choice = readLine(){
            if let selected = Int(choice){
               attackingCharacter = attacker.team[selected]
                if let attackingCharacter = attackingCharacter {
                    print(" vous avez sélectionné le combattant \(attackingCharacter.name)")
                }
            }
        }
        if let magus = attackingCharacter as? Wizard {
            print(" \(attacker.name) choisissez un membre de votre equipe à soigner")
            for (index, character) in attacker.team.enumerated(){
                print("\(index) - Nom: \(character.name) - Vie: \(character.life) - Dégats:\(character.dammage)")
            }
            if let choice = readLine(){
                if let selected = Int(choice){
                    defendingCharacter = attacker.team[selected]
                    let healedCharacter = attacker.team[selected]
                        print(" vous avez sélectionné le combattant \(healedCharacter.name)")
                        magus.heal(target: healedCharacter)
                }
            }
        } else {   // afficher les membres de l'équipe adverse
            
            
            print("Veuillez choisir un combattant parmis les membres de l'équipe adverse: ")
            for (index, character) in defender.team.enumerated(){
                print("\(index) - nom: \(character.name) - Vie: \(character.life) - Dégats: \(character.dammage)")
            }
 */



// permettre a l'utilisateur de choisir un combattant de l'équipe adverse ( à attaqsuer)
 
    
       /*func makeAttack(attacker: Character, defender: Character ){
           
        attacker.attack(target: defender)
        defender.life -= defender.dammage
        print(" \(defender.name) a reçu \(defender.dammage) de dégats et il lui reste \(defender.life) points de vie !")
        if defender.life == 0 {
            print("le \(defender.name) est mort!")
        }else{
            print("le combat continue")
        }
     
    makeAttack(attacker: attackingCharacter!, defender: defendingCharacter!)

        
    }
        -
         - attaquer et infliger des dégats ... recevoir des dégats
         - si life cible = 0 : le joueur à perdu et il passe au second personnage
         - si life des 3 personnages = 0 le joueur a perdu et la partie est terminee (print: voulez vouz rejouer) */

