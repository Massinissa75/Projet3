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
    var attackingCharacter : Character?
    var deffendingCharacter: Character?
    //Show the available characters & create team
    func createTeam (){
        print(" Welcome \(name): ")
    // repeat the operation until you have 3 characters
        while team.count < 3 {
            let characterNeeded = 3 - team.count   // number of characters remaining to select

            print("""
                Please form your team and choose from the following characters:
                
                1. 🥋𝙁𝐼𝘎𝐻𝑇𝑬𝑹: The great and the brave warrior
                   Characteristics:
                                     🧡 Life: 100 Pts
                                     💥 Damage: 10 Pts
                                     🗡 Weapon: Sword
                
                2. 🏋🏼𝑪O𝐿O𝘚𝘚𝘜𝘚: The tough guy who doesn’t hurt too much
                   Characteristics:
                                     🧡Life: 110 Pts
                                     💥Damage: 8 Pts
                                     🗡Weapon: Axe
                
                3. 🧙‍♂️𝙒𝐼𝒵𝘼𝑹𝘿: The only magician capable of many surprises
                   Characteristics:
                                     🧡Life: 90 Pts
                                     💊Health: 6 Pts
                                     🥢Weapon: Magic wand
                
                4. 🧝🏾𝘋𝙒𝘼𝑹𝑭: The dwarf must never be underestimated
                   Characteristics:
                                    🧡Life: 90 Pts
                                    💥Damage: 12 Pts
                                    🗡Weapon: Mass
                
                (You still have \(characterNeeded) character to select)
                (Please choose a number between 1 and 4)
                """)
    // the user's answer
            let entry = readLine()
            print(entry!)
            
            if let playerChoice = entry {
                var character : Character?
                
                switch playerChoice {
                    
                case "1":
                    character = Fighter(name:"", life: 100, damage: 10, weapon:"Sword")
                case "2":
                    character = Colossus(name:"", life: 110, damage: 8, weapon:"Axe")
                case "3":
                    character = Wizard(name:"" , life: 90, weapon:"Magic wand", damage: 0, heal: 6)
                case "4":
                    character = Dwarf(name:"", life: 90, damage: 12, weapon:"Mass")
                default:
                    print("You still haven’t selected 3 characters !")
                }
                if let char = character {
                    print("How do you want to call your character?")
                    char.name = setName()
                    team.append(char)
                    print("\(char.name) has been added to your team")
                } else {
                    print("You must name your player ... please start again !")
                }
            }
        }
    }
    func setPlayerName(){
        self.name = setName()
    }
}
// function to name the characters (with unique name)
func availableName(uniqueName: String)-> Bool{
    if Player.uniqueName.contains (uniqueName.lowercased()){
        print("Oups !\(uniqueName) is already taken. Please choose another one ! ")
        return false
    }else{
        Player.uniqueName.append(uniqueName.lowercased())
        return true
    }
}
func setName()-> String{
    if let name = readLine(){
        if name.count > 0 {
            if (availableName(uniqueName: name)){
                return name
            }else{
                print("This name is already taken, please choose another one")
            }
        }
    }
    return setName()
}
