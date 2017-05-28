//
//  MMConstants.swift
//  Mental Math Trainer
//
//  Created by Fabricio Machado on 5/27/17.
//  Copyright © 2017 Fabricio Machado. All rights reserved.
//

struct CategorySummary {
    var title: String
    var subTitle: String
    var longDescription: String
    func summaryDescription() -> String {
        return " Category is \(title), summary is: \(subTitle), detail is: \(longDescription)"
    }
}

enum Category: Int, CaseCountable {

    case allLectures = 0
    case lecture1, lecture2, lecture3, lecture4, lecture5, lecture6, lecture7, lecture8, lecture9, lecture10, lecture11, lecture12
    static let caseCount = Category.countCases()
    
    func summary() -> CategorySummary {
        var summaryItem = CategorySummary(title: "All Lectures", subTitle: "problems that cover all topics from all lectures", longDescription: "Problems that cover all topics from all lectures.")
        
        switch self {
        case .allLectures:
            summaryItem.title = "All Lectures"
            summaryItem.subTitle = "problems that cover all topics from all lectures"
            summaryItem.longDescription = "Problems that cover all topics from all lectures."
        case .lecture1:
            summaryItem.title = "LECTURE 1"
            summaryItem.subTitle = "Math in Your Head!"
            summaryItem.longDescription = "Problems that cover all topics from all lectures."
        case .lecture2:
            summaryItem.title = "LECTURE 2"
            summaryItem.subTitle = "Mental Addition and Subtraction"
            summaryItem.longDescription = "Problems that cover all topics from all lectures."
        case .lecture3:
            summaryItem.title = "LECTURE 3"
            summaryItem.subTitle = "Go Forth and Multiply "
            summaryItem.longDescription = "Problems that cover all topics from all lectures."
        case .lecture4:
            summaryItem.title = "LECTURE 4"
            summaryItem.subTitle = "Divide and Conquer"
            summaryItem.longDescription = "Problems that cover all topics from all lectures."
        case .lecture5:
            summaryItem.title = "LECTURE 5"
            summaryItem.subTitle = "The Art of Guesstimation"
            summaryItem.longDescription = "Problems that cover all topics from all lectures."
        case .lecture6:
            summaryItem.title = "LECTURE 6"
            summaryItem.subTitle = "Mental Math and Paper"
            summaryItem.longDescription = "Problems that cover all topics from all lectures."
        case .lecture7:
            summaryItem.title = "LECTURE 7"
            summaryItem.subTitle = "Intermediate Multiplication"
            summaryItem.longDescription = "Problems that cover all topics from all lectures."
        case .lecture8:
            summaryItem.title = "LECTURE 8"
            summaryItem.subTitle = "The Speed of Vedic Division"
            summaryItem.longDescription = "Problems that cover all topics from all lectures."
        case .lecture9:
            summaryItem.title = "LECTURE 9"
            summaryItem.subTitle = "Memorizing Numbers"
            summaryItem.longDescription = "Problems that cover all topics from all lectures."
        case .lecture10:
            summaryItem.title = "LECTURE 10"
            summaryItem.subTitle = "Calendar Calculating"
            summaryItem.longDescription = "Problems that cover all topics from all lectures."
        case .lecture11:
            summaryItem.title = "LECTURE 11"
            summaryItem.subTitle = "Advanced Multiplication"
            summaryItem.longDescription = "Problems that cover all topics from all lectures."
        case .lecture12:
            summaryItem.title = "LECTURE 12"
            summaryItem.subTitle = "Masters of Mental Math"
            summaryItem.longDescription = "Problems that cover all topics from all lectures."
        }
        return summaryItem
    }
}
