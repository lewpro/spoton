//
//  Board+CoreDataClass.swift
//  SpotOn
//
//  Created by Rachel Lew on 10/2/17.
//  Copyright © 2017 LewPRO. All rights reserved.
//

import Foundation
import CoreData

@objc(Board)
public class Board: NSManagedObject {
    enum LetterState {
        case ON
        case OFF
    }
    
    enum BoardExceptions: Error {
        case InvalidLetter
    }
    
    var score : Int16 {
        get {
            var count = 0
            var i = 0
            while(i<Const.LetterSets.englishLetters.count){
                if(letterMask & 1 == 1){
                    count = count + 1
                }
                letterMask = letterMask >> 1
                i = i + 1
            }
            return Int16(count)
        }
    }
    
    func toString(){
        print(letterMask)
    }
    
    
    func getIndexAt(letter l: String) -> Int? {
        return Const.LetterSets.englishLetters.index(of: l)
    }
    
    func resetBoard() {
        self.letterMask = 0
    }
    
    func togglePoint(atIndex i: Int) {
        letterMask ^= 1 << i
    }
    
    func togglePoint(atLetter l: String) throws {
        if let i = getIndexAt(letter: l){
            togglePoint(atIndex: i)
        } else {
            throw BoardExceptions.InvalidLetter
        }
    }
    
    func hasPoint(atIndex i: Int) -> Bool {
        let bit = (letterMask >> i) & 1
        return bit == 1
    }
    
    func hasPoint(atLetter l: String) throws -> Bool {
        if let i = getIndexAt(letter: l){
            return hasPoint(atIndex: i)
        } else {
            throw BoardExceptions.InvalidLetter
        }
    }
    
}

