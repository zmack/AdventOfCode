//
//  dayOne.swift
//  AdventOfCode
//
//  Created by Andrei Bocan on 02/01/16.
//  Copyright © 2016 Andrei Bocan. All rights reserved.
//

import Foundation

class DayOne {
    static func getTotalRide(input: String) -> Int {
        return input.characters.reduce(0, combine: { (collector, char) -> Int in
            switch char {
            case "(":
                return collector + 1
            case ")":
                return collector - 1
            default:
                return collector
            }
        })
    }
    static func getFirstBasementRide(input: String) -> Int? {
        var total: Int = 0
        for (index, char) in input.characters.enumerate() {
            switch char {
            case "(":
                total = total + 1
            case ")":
                total = total - 1
            default:
                break
            }
            
            if total == -1 {
                return index + 1
            }
        }
        print("Total is -> ", total)
        
        return nil
    }
    
    static func main() {
        let input = getFileInput(1)
        
        print("Result is ", getTotalRide(input))
        print("First basement ride is ", getFirstBasementRide(input))
        
    }
}