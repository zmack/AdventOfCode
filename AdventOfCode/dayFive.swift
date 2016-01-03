//
//  dayFive.swift
//  AdventOfCode
//
//  Created by Andrei Bocan on 03/01/16.
//  Copyright © 2016 Andrei Bocan. All rights reserved.
//

import Foundation

class DayFive {
    static let vowels:Set<Character> = Set(["a", "e", "i", "o", "u"])
    static let blacklistedSubstrings = Set(["ab", "cd", "pq", "xy"])
    
    static func isValidName(name: String) -> Bool {
        var hasDoubleLetter = false
        var numVowels = 0
        var lastChar:Character?
        
        for char in name.characters {
            if vowels.contains(char) {
                numVowels += 1
            }
            
            if lastChar == char {
                hasDoubleLetter = true
            }
            
            if lastChar != nil {
                let lastTuple = String([lastChar!, char])
                if blacklistedSubstrings.contains(lastTuple) {
                    return false
                }
            }

            lastChar = char
        }
        
        return hasDoubleLetter && numVowels > 2
    }
    
    static func isValidForSecondRuleset(name: String) -> Bool {
        var hasLetterPair = false
        var hasLetterFlip = false
        var lastChar:Character?
        var index = name.startIndex
        
        for char in name.characters {
            if lastChar != nil && !hasLetterPair {
                let lastTuple = String([lastChar!, char])
                hasLetterPair =
                    name.substringFromIndex(index.advancedBy(1)).containsString(lastTuple)
            }
            
            if !hasLetterFlip &&
                name.startIndex.distanceTo(index) > 2 &&
                name[index] == name[index.advancedBy(-2)] {
                    hasLetterFlip = true
                
            }
            
            if hasLetterFlip && hasLetterPair {
                return true
            }
            
            lastChar = char
            index++
        }
        
        return false
    }
    
    static func main() {
        let input = getFileInput(5)
        // let input = "qjhvhtzxzqqjkmpb\nxxyxx\nuurcxstgmygtbstg\nieodomkazucvgmuy"
        var validNames = 0
    
        input.enumerateLines() { (name, stop) in
            if isValidForSecondRuleset(name) {
                validNames++
            }
        }
        
        print("Valid names found ", validNames)
    }
}