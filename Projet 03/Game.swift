//
//  Game.swift
//  Projet 03
//
//  Created by Massinissa_theking on 02/04/2019.
//  Copyright © 2019 Massinissa_theking. All rights reserved.
//

import Foundation

class Game{
    
    var team1 : Player
    var team2 : Player
    var round : Int
    var attacker = [Character]()
    var defender = [Character]()
    var attackingCharacter: Character?
    var defendingCharacter: Character?
    
    init(round: Int) {
        self.round = round
        team1 = Player()
        team2 = Player()
    }
    //Beginning of the game
    func beginning (){
            print("Hello, how do you want to name your team ?")
            team1.setPlayerName()
            team1.createTeam()
            print("Congrats! The first team was created.")
            print("Hello, how do you want to name your team ?")
            team2.setPlayerName()
            team2.createTeam()
            print("Congrats! The second team was created.")
    }
    // function to show team members
    func makeChoice (in player: Player)-> Character {
        for (index, character) in player.team.enumerated() {
            print("""
                \(index) - Name: \(character.name)
                ❤️Life: \(character.life)
                💥Damage: \(character.damage)
                """)
        }
        if let choice = readLine(){
            if let selected = Int(choice){
                if (selected < player.team.count && selected >= 0){
                    return player.team[selected]
                }
            }
        }
        print("I don't understand ")
        return makeChoice(in: player)
    }
    // function to make attack
    func attack(){
        var attacker = team1
        var defender = team2
        repeat{
    // Choose a member
            print(" \(attacker.name) you are the one who will start the game this turn. Please choose a character !")
        let attackingCharacter = makeChoice (in: attacker)
            print("\(attacker.name) you've choose \(attackingCharacter.name)")
    // If he is the mage, he chooses a member of his team to be healed if not a member of the opposing team to attack
            mysteriousBox(character: attackingCharacter)
        if let magus = attackingCharacter as? Wizard {
            print("\(attacker.name) please choose a member of your team to heal!")
            let healedCharacter = makeChoice(in: attacker)
            print("\(attacker.name) you choose \(healedCharacter.name) to provide him care ")
            magus.health(target: healedCharacter)
        } else {
    // Choice of the opponent to attack
            print("\(attacker.name) please choose a member of the opposing team to attack ")
            let defendingCharacter = makeChoice(in: defender)
            print("\(attacker.name) you will attack \(defendingCharacter.name)")
            attackingCharacter.attack(target: defendingCharacter)
            if defendingCharacter.life <= 0 {
                if let x = defender.team.firstIndex(where: { $0.name == defendingCharacter.name})
                {
                defender.team.remove(at: x)
                print("\(defendingCharacter.name) is dead !")
                }
            }
        }
        swap(&attacker, &defender)
        }while (team1.team.count > 0 && team2.team.count > 0)
        if (team1.team.count > 0){
            print("")
            print("\(team1.name) win !")
        }else{
            print("\(team2.name) win !")
        }
    }
    // Mysterious box function
    func mysteriousBox (character: Character){           
        let surprise = Int.random(in: 0...3)
        if surprise == 1 {
            print(" What do I see? A safe! open quickly !")
            if let magus = character as? Wizard{
            magus.weapon = "antidote"
            magus.heal = 15
                print("\(magus.name) has received \(magus.weapon) as a new weapon, and can provide \(magus.heal) life points")
            }
        } else if surprise == 3 {
            print(" What do I see? A safe! open quickly !")
            if character is Wizard {
            } else {
            character.weapon = "Lightsaber"
            character.damage = 50
            print("\(character.name) he received \(character.weapon) as a new combat weapon, and now can inflict \(character.damage) damages points")
            }
        }
    }
}
