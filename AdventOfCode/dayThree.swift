//
//  dayThree.swift
//  AdventOfCode
//
//  Created by Andrei Bocan on 03/01/16.
//  Copyright © 2016 Andrei Bocan. All rights reserved.
//

import Foundation

class DayThree {
    
    class Santa {
        var x = 0
        var y = 0
        
        func visit(direction: Character) -> (Int, Int) {
            switch direction {
            case ">":
                x += 1
            case "<":
                x -= 1
            case "^":
                y += 1
            case "v":
                y -= 1
            default:
                break
            }
            
            return (x,y)
        }
    }
    
    static func main() {
        let input = getFileInput(3)

        
        var houses = Set(["0,0"])
        let santa = Santa()
        let roboSanta = Santa()
        var isRoboSantaTurn = false
        
        var x: Int, y: Int
        
        for char in input.characters {
            if isRoboSantaTurn {
                (x,y) = roboSanta.visit(char)
            } else {
                (x,y) = santa.visit(char)
            }
            
            isRoboSantaTurn = !isRoboSantaTurn
            
            houses.insert(NSString(format: "%d,%d", x,y) as String)
        }
        
        print("Houses visited ", houses.count)
    }
}