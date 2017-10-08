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
        case invalidLetter
    }
    
    var score : Int16 {
        get {
            // TODO: Bitshift the lettermask over to calculate current score
            return 0
        }
    }
    
    
    func getIndexAt(letter l: String) -> Int? {
        return Const.LetterSets.englishLetters.index(of: l)
    }
    
    func resetBoard() {
        self.letterMask = 0
    }
    
    private func togglePointAt(index i: Int) {
        letterMask ^= 1 << i
    }
    
    func togglePoint(_ l: String) throws {
        if let i = getIndexAt(letter: l){
            togglePointAt(index: i)
        } else {
            throw BoardExceptions.invalidLetter
        }
    }
    
    private func hasPointAt(index i: Int) -> Bool {
        let bit = (letterMask >> i) & 1
        return bit == 1
    }
    
    func hasPointAt(Letter l: String) throws -> Bool {
        if let i = getIndexAt(letter: l){
            return hasPointAt(index: i)
        } else {
            throw BoardExceptions.invalidLetter
        }
    }
    
}

