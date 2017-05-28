//
//  MMEnumCounterProtocol.swift
//  Mental Math Trainer
//
//  Created by Fabricio Machado on 5/28/17.
//  Copyright © 2017 Fabricio Machado. All rights reserved.
//

// enum which provides a count of its cases
protocol CaseCountable {
    static func countCases() -> Int
    static var caseCount : Int { get }
}


// provide a default implementation to count the cases for Int enums assuming starting at 0 and contiguous
extension CaseCountable where Self : RawRepresentable, Self.RawValue == Int {
    // count the number of cases in the enum
    static func countCases() -> Int {
        // starting at zero, verify whether the enum can be instantiated from the Int and increment until it cannot
        var count = 0
        while let _ = Self(rawValue: count) { count+=1 }
        return count
    }
}
