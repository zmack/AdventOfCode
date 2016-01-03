//
//  main.swift
//  AdventOfCode
//
//  Created by Andrei Bocan on 02/01/16.
//  Copyright © 2016 Andrei Bocan. All rights reserved.
//

import Foundation


func getFileInput(path: String) -> String {
    return try! NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding) as String
}

DayFour.main()