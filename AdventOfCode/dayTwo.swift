//
//  dayTwo.swift
//  AdventOfCode
//
//  Created by Andrei Bocan on 02/01/16.
//  Copyright © 2016 Andrei Bocan. All rights reserved.
//

import Foundation

class DayTwo {
    static let inputPath = "/Users/zmack/Documents/Apps/AdventOfCode/Inputs/day-2-input.txt"
    
    struct PresentWrapping {
        let length, height, width: Int
        init(length: Int, height: Int, width: Int) {
            self.width = width
            self.height = height
            self.length = length
        }
        
        init(string: String) {
            let components:[Int] = string.componentsSeparatedByString("x").map({ str in Int(str)! }).sort()
            self.length = components[0]
            self.width = components[1]
            self.height = components[2]
        }
        
        var faceArea: [Int] {
            return [
                height * length,
                width * length,
                width * height
            ]
        }
        
        func totalArea() -> Int {
            return faceArea.map({ (area) -> Int in return area * 2 }).reduce(0, combine: +)
        }
        
        func slack() -> Int {
            return faceArea.minElement()!
        }
        
        func ribbonRequired() -> Int {
            return length * 2 + width * 2 + width * height * length;
        }
    }
    
    static func main() {
        let input = getFileInput(inputPath)
        var totalRibbon = 0
        var totalWrapping = 0

        input.enumerateLines() { (line, stop) in
            let currentWrapping = PresentWrapping(string: line)
            totalWrapping += currentWrapping.totalArea() + currentWrapping.slack()
            totalRibbon += currentWrapping.ribbonRequired()
        }
        
        
        print("Total wrapping needed ", totalWrapping)
        print("Total ribbon required ", totalRibbon)
    }
}