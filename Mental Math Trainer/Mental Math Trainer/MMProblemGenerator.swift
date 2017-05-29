//
//  MMProblemGenerator.swift
//  Mental Math Trainer
//
//  Created by Fabricio Machado on 5/28/17.
//  Copyright © 2017 Fabricio Machado. All rights reserved.
//

import Foundation

struct MMProblem {
    var expressionText: String
    var solution: Float
    var tipSheetText: String
}

class MMProblemGenerator {
    static let sharedInstance = MMProblemGenerator()
    private init() {} //This prevents others from using the default '()' initializer for this class.
    
    func generateFor(problemCategory: Category) -> MMProblem {
        var problem = MMProblem(expressionText: "", solution: 0.0, tipSheetText: "")
        switch problemCategory {
        case .allLectures:
            problem = self.generateLecture1Problem()
        case .lecture1:
            problem = self.generateLecture1Problem()
/*
        case .lecture2:
            problem = self.generateLecture2Problem()
        case .lecture3:
            problem = self.generateLecture3Problem()
        case .lecture4:
            problem = self.generateLecture4Problem()
        case .lecture5:
z               problem = self.generateLecture5Problem()
        case .lecture6:
            problem = self.generateLecture6Problem()
        case .lecture7:
            problem = self.generateLecture7Problem()
        case .lecture8:
            problem = self.generateLecture8Problem()
        case .lecture9:
            problem = self.generateLecture9Problem()
        case .lecture10:
            problem = self.generateLecture10Problem()
        case .lecture11:
            problem = self.generateLecture11Problem()
        case .lecture12:
            problem = self.generateLecture12Problem()
 */
        default: break
        }
        return problem
    }
    

    /********* Lecture 1 *********/
    private func generateLecture1Problem() -> MMProblem {
        // There are 6 types of problem in Lecture 1, so we have to randomely generate one of the 6 problems.
        var tipSheet = [
            "The product of 11 and any 2-digit number begins and ends with the two digits of the multiplier; the number in the middle is the sum of the original two digits. Example: 23 × 11   2 + 3 = 5; answer: 253. For a multiplier whose digits sum to a number greater than 9, you have to carry. Example: 85 × 11   8 + 5 = 13; carry the 1 from 13 to the 8; answer: 935.",
            "The product of 11 and any 3-digit number also begins and ends with the  first and last digits of the multiplier, although the  first digit can change from carries. In the middle, insert the result of adding the  first and second digits and the second and third digits. Example: 314 × 11   3 + 1 = 4 and 1 + 4 = 5; answer: 3454.",
            "To square a 2-digit number that ends in 5, multiply the  first digit in the number by the next higher digit, then attach 25 at the end. Example: 352   3 × 4 = 12; answer: 1225. For 3-digit numbers, multiply the  first two numbers together by the next higher number, then attach 25. Example: 3052   30 × 31 = 930; answer: 93,025.",
            "To multiply two 2-digit numbers that have the same  first digits and last digits that sum to 10, multiply the  first digit by the next higher digit, then attach the product of the last digits in the original two numbers. Example: 84 × 86   8 × 9 = 72 and 4 × 6 = 24; answer: 7224.",
            "To multiply a number between 10 and 20 by a 1-digit number, multiply the 1-digit number by 10, then multiply it by the second digit in the 2-digit number, and add the products. Example: 13 × 6   (6 × 10) + (6 × 3) = 60 + 18; answer: 78.",
            "To multiply two numbers that are both between 10 and 20, add the  first number and the last digit of the second number, multiply the result by 10, then add that result to the product of the last digits in both numbers of the original problem. Example: 13 × 14   13 + 4 = 17, 17 × 10 = 170, 3 × 4 = 12, 170 + 12 = 182; answer: 182."
            ]
        
        var problem = MMProblem(expressionText: "", solution: 0.0, tipSheetText: "")
        let lecture1ProblemType = arc4random_uniform(6) + 1
        switch lecture1ProblemType {
        case 1:
            /*
             1. The product of 11 and any 2-digit number begins and ends with the two digits of the multiplier; the number in the middle is the sum of the original two digits. Example: 23 × 11   2 + 3 = 5; answer: 253. For a multiplier whose digits sum to a number greater than 9, you have to carry. Example: 85 × 11   8 + 5 = 13; carry the 1 from 13 to the 8; answer: 935.
             */
            let twoDigitOperand = arc4random_uniform(99) + 1
            let result = 11 * twoDigitOperand;
            let elevenFirstInOrderSequence = arc4random_uniform(2)
            var expression = "11 × \(twoDigitOperand)"
            if (elevenFirstInOrderSequence == 1) {
                expression = "\(twoDigitOperand) × 11"
            }
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture1ProblemType) - 1])
        case 2:
            /*
             2. The product of 11 and any 3-digit number also begins and ends with the  first and last digits of the multiplier, although the  first digit can change from carries. In the middle, insert the result of adding the  first and second digits and the second and third digits. Example: 314 × 11   3 + 1 = 4 and 1 + 4 = 5; answer: 3454.
             */
            let threeDigitOperand = arc4random_uniform(999) + 1
            let result = 11 * threeDigitOperand;
            let elevenFirstInOrderSequence = arc4random_uniform(2)
            var expression = "11 × \(threeDigitOperand)"
            if (elevenFirstInOrderSequence == 1) {
                expression = "\(threeDigitOperand) × 11"
            }
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture1ProblemType) - 1])
        case 3:
            /*
             3. To square a 2-digit number that ends in 5, multiply the  first digit in the number by the next higher digit, then attach 25 at the end. Example: 352   3 × 4 = 12; answer: 1225. For 3-digit numbers, multiply the  first two numbers together by the next higher number, then attach 25. Example: 3052   30 × 31 = 930; answer: 93,025.
            */
            var twoDigitEndingInFive = (arc4random_uniform(18) + 1) * 5
            if (twoDigitEndingInFive % 10 == 0) {
                twoDigitEndingInFive += 5
            }
            let result = pow(Float(twoDigitEndingInFive), 2.0)
            let expression = "\(twoDigitEndingInFive)\u{00B2}"
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture1ProblemType) - 1])
        case 4:
            /*
             4. To multiply two 2-digit numbers that have the same  first digits and last digits that sum to 10, multiply the  first digit by the next higher digit, then attach the product of the last digits in the original two numbers. Example: 84 × 86   8 × 9 = 72 and 4 × 6 = 24; answer: 7224.
            */
            let firstDigit = Int(arc4random_uniform(9) + 1)
            let tensPlace = firstDigit * 10
            var secondDigitFirstOperand = Int(arc4random_uniform(9) + 1)
            var secondDigitSecondOperand = Int(arc4random_uniform(9) + 1)
            let differenceFromTen = 10 - (secondDigitFirstOperand + secondDigitSecondOperand)

            let adjustFirstOperand = Int(arc4random_uniform(2))
            if (adjustFirstOperand == 0) {
                secondDigitFirstOperand += differenceFromTen
            } else {
                secondDigitSecondOperand += differenceFromTen
            }
            
            let firstOperand = tensPlace + secondDigitFirstOperand
            let secondOperand = tensPlace + secondDigitSecondOperand
            
            let result = firstOperand * secondOperand
            let expression = "\(firstOperand) × \(secondOperand)"
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture1ProblemType) - 1])
        case 5:
            /*
             5. To multiply a number between 10 and 20 by a 1-digit number, multiply the 1-digit number by 10, then multiply it by the second digit in the 2-digit number, and add the products. Example: 13 × 6   (6 × 10) + (6 × 3) = 60 + 18; answer: 78.
            */
            let firstOperand = Int(arc4random_uniform(9) + 1) + 10
            let secondOperand = Int(arc4random_uniform(9))
            let result = firstOperand * secondOperand
            let expression = "\(firstOperand) × \(secondOperand)"
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture1ProblemType) - 1])
        case 6:
            /*
             6. To multiply two numbers that are both between 10 and 20, add the  first number and the last digit of the second number, multiply the result by 10, then add that result to the product of the last digits in both numbers of the original problem. Example: 13 × 14   13 + 4 = 17, 17 × 10 = 170, 3 × 4 = 12, 170 + 12 = 182; answer: 182.
            */
            let firstOperand = Int(arc4random_uniform(9) + 1) + 10
            let secondOperand = Int(arc4random_uniform(9) + 1) + 10
            let result = firstOperand * secondOperand
            let expression = "\(firstOperand) × \(secondOperand)"
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture1ProblemType) - 1])
        default:
            let threeDigitOperand = arc4random_uniform(999) + 1
            let result = 11 * threeDigitOperand;
            let elevenFirstInOrderSequence = arc4random_uniform(2)
            var expression = "11 × \(threeDigitOperand)"
            if (elevenFirstInOrderSequence == 1) {
                expression = "\(threeDigitOperand) × 11"
            }
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture1ProblemType) - 1])
        }
        return problem
    }
    
    /*
    private func generateLecture2Problem() -> MMProblem {
        var problem = MMProblem(expressionText: "", solution: 0.0)
        return problem
    }
    
    private func generateLecture3Problem() -> MMProblem {
        var problem = MMProblem(expressionText: "", solution: 0.0)
        return problem
    }
    
    private func generateLecture4Problem() -> MMProblem {
        var problem = MMProblem(expressionText: "", solution: 0.0)
        return problem
    }
    
    private func generateLecture5Problem() -> MMProblem {
        var problem = MMProblem(expressionText: "", solution: 0.0)
        return problem
    }
    
    private func generateLecture6Problem() -> MMProblem {
        var problem = MMProblem(expressionText: "", solution: 0.0)
        return problem
    }
    
    private func generateLecture7Problem() -> MMProblem {
        var problem = MMProblem(expressionText: "", solution: 0.0)
        return problem
    }
    
    private func generateLecture8Problem() -> MMProblem {
        var problem = MMProblem(expressionText: "", solution: 0.0)
        return problem
    }
    
    private func generateLecture9Problem() -> MMProblem {
        var problem = MMProblem(expressionText: "", solution: 0.0)
        return problem
    }
    
    private func generateLecture10Problem() -> MMProblem {
        var problem = MMProblem(expressionText: "", solution: 0.0)
        return problem
    }
    
    private func generateLecture11Problem() -> MMProblem {
        var problem = MMProblem(expressionText: "", solution: 0.0)
        return problem
    }
    
    private func generateLecture12Problem() -> MMProblem {
        var problem = MMProblem(expressionText: "", solution: 0.0)
        return problem
    }
 */
    
}
