//
//  dayFour.swift
//  AdventOfCode
//
//  Created by Andrei Bocan on 03/01/16.
//  Copyright © 2016 Andrei Bocan. All rights reserved.
//

import Foundation

class DayFour {
    static func md5(string string: String) -> [UInt8] {
        var digest = [UInt8](count: Int(CC_MD5_DIGEST_LENGTH), repeatedValue: 0)
        if let data = string.dataUsingEncoding(NSUTF8StringEncoding) {
            CC_MD5(data.bytes, CC_LONG(data.length), &digest)
        }
        
        return digest
    }
    
    static func checksumMatches(checksum: [UInt8]) -> Bool {
        return checksum[0] == 0 && checksum[1] == 0 && checksum[2] == 0
    }
    
    static func main() {
        var hash:[UInt8]
        let prefix = "yzbqklnj"
        var iterations = 0
        var currentString: String
        
        repeat {
            iterations += 1
            currentString = prefix + String(iterations)
            hash = md5(string: currentString)
        } while !checksumMatches(hash)
        
        if checksumMatches(hash) {
            print("Current matching string is ", currentString)
            print("Hash is ", hash.map({ val in return String(format: "%02X", val) }).joinWithSeparator(""))
        }
        
    }
}