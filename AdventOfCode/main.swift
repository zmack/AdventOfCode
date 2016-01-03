//
//  main.swift
//  AdventOfCode
//
//  Created by Andrei Bocan on 02/01/16.
//  Copyright © 2016 Andrei Bocan. All rights reserved.
//

import Foundation


func inputFilename(day: Int) -> String {
    return String(format: "/Users/zmack/Documents/Apps/AdventOfCode/Inputs/day-%d-input.txt", arguments: [day])
}

func getFileInput(fromDay: Int) -> String {
    let path = inputFilename(fromDay)
    return getFileInput(path)
}

func getFileInput(path: String) -> String {
    return try! NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding) as String
}

DayFive.main()