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
    var problemType: String
}

class MMProblemGenerator {
    static let sharedInstance = MMProblemGenerator()
    private init() {} //This prevents others from using the default '()' initializer for this class.
    
    func generateFor(problemCategory: Category) -> MMProblem {
        var problem = MMProblem(expressionText: "", solution: 0.0, tipSheetText: "", problemType: "")
        switch problemCategory {
        case .allLectures:
            // randomly choose a lecture from the 4 (that are currently implemented)
            let randomLectureNumber = Category(rawValue:Int(arc4random_uniform(3) + 1))!
            switch randomLectureNumber {
            case .lecture1:
                problem = self.generateLecture1Problem()
                break
            case .lecture2:
                problem = self.generateLecture2Problem()
                break
            case .lecture3:
                problem = self.generateLecture3Problem()
                break
            case.lecture4:
                problem = self.generateLecture4Problem()
                break
            default:
                problem = self.generateLecture1Problem()
                break
            }
        case .lecture1:
            problem = self.generateLecture1Problem()
            break
        case .lecture2:
            problem = self.generateLecture2Problem()
            break
        case .lecture3:
            problem = self.generateLecture3Problem()
            break
        case .lecture4:
            problem = self.generateLecture4Problem()
            break
            /*
             case .lecture5:
             problem = self.generateLecture5Problem()
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
        default:
            problem = self.generateLecture1Problem()
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
            "To multiply two numbers that are both between 10 and 20, add the  first number and the last digit of the second number, multiply the result by 10, then add that result to the product of the last digits in both numbers of the original problem. Example: 13 × 14   13 + 4 = 17, 17 × 10 = 170, 3 × 4 = 12, 170 + 12 = 182; answer: 182.",
            "Fill out the standard 10-by-10 multiplication table as quickly as you can. It’s probably easiest to  ll it out one row at a time by counting.",
            "Create an 8-by-9 multiplication table in which the rows represent the numbers from 2 to 9 and the columns represent the numbers from 11 to 19. For an extra challenge,  ll out the squares in random order.",
            "Create the multiplication table in which the rows and columns represent the numbers from 11 to 19. For an extra challenge,  ll out the rows in random order. Be sure to use the shortcuts we learned in this lecture, including those for multiplying by 11."
        ]
        
        var problem = MMProblem(expressionText: "", solution: 0.0, tipSheetText: "", problemType: "standard")
        let lecture1ProblemType = arc4random_uniform(9) + 1
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
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture1ProblemType) - 1], problemType: "standard")
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
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture1ProblemType) - 1], problemType: "standard")
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
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture1ProblemType) - 1], problemType: "standard")
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
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture1ProblemType) - 1], problemType: "standard")
        case 5:
            /*
             5. To multiply a number between 10 and 20 by a 1-digit number, multiply the 1-digit number by 10, then multiply it by the second digit in the 2-digit number, and add the products. Example: 13 × 6   (6 × 10) + (6 × 3) = 60 + 18; answer: 78.
             */
            let firstOperand = Int(arc4random_uniform(9) + 1) + 10
            let secondOperand = Int(arc4random_uniform(9))
            let result = firstOperand * secondOperand
            let expression = "\(firstOperand) × \(secondOperand)"
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture1ProblemType) - 1], problemType: "standard")
        case 6:
            /*
             6. To multiply two numbers that are both between 10 and 20, add the  first number and the last digit of the second number, multiply the result by 10, then add that result to the product of the last digits in both numbers of the original problem. Example: 13 × 14   13 + 4 = 17, 17 × 10 = 170, 3 × 4 = 12, 170 + 12 = 182; answer: 182.
             */
            let firstOperand = Int(arc4random_uniform(9) + 1) + 10
            let secondOperand = Int(arc4random_uniform(9) + 1) + 10
            let result = firstOperand * secondOperand
            let expression = "\(firstOperand) × \(secondOperand)"
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture1ProblemType) - 1], problemType: "standard")
        case 7:
            /*
             Fill out the standard 10-by-10 multiplication table as quickly as you can. It’s probably easiest to  ll it out one row at a time by counting.
             */
            problem = MMProblem(expressionText: "", solution: 0.0, tipSheetText: tipSheet[Int(lecture1ProblemType) - 1], problemType: "tenByTenTable")
        case 8:
            /*
             Create an 8-by-9 multiplication table in which the rows represent the numbers from 2 to 9 and the columns represent the numbers from 11 to 19. For an extra challenge,  ll out the squares in random order.
             */
            problem = MMProblem(expressionText: "", solution: 0.0, tipSheetText: tipSheet[Int(lecture1ProblemType) - 1], problemType: "eightByNineTable")
        case 9:
            /*
             Create the multiplication table in which the rows and columns represent the numbers from 11 to 19. For an extra challenge,  ll out the rows in random order. Be sure to use the shortcuts we learned in this lecture, including those for multiplying by 11.
             */
            problem = MMProblem(expressionText: "", solution: 0.0, tipSheetText: tipSheet[Int(lecture1ProblemType) - 1], problemType: "elevenToNineteenTable")
        default:
            let threeDigitOperand = arc4random_uniform(999) + 1
            let result = 11 * threeDigitOperand;
            let elevenFirstInOrderSequence = arc4random_uniform(2)
            var expression = "11 × \(threeDigitOperand)"
            if (elevenFirstInOrderSequence == 1) {
                expression = "\(threeDigitOperand) × 11"
            }
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture1ProblemType) - 1], problemType: "standard")
        }
        return problem
    }
    
    private func generateLecture2Problem() -> MMProblem {
        // There are 6 types of problem in Lecture 1, so we have to randomely generate one of the 6 problems.
        var tipSheet = [
            "Solve the following mental addition problems by calculating from left to right. To add 3-digit numbers,  First add the 100s, then the 10s, then the 1s. For 314 + 159,  first add 314 + 100 = 414. The problem is now simpler, 414 + 59; keep the 400 in mind and focus on 14 + 59. Add 14 + 50 = 64, then add 9 to get 73. The answer to the original problem is 473. For an added challenge, look away from the numbers after reading the problem.",
            "Do these 2-digit addition problems in two ways; make sure the second way involves subtraction. Use complements to do this. For example, 28 + 74 can be thought of instead as 30 + 74, which is 104, but then subtract 2, which is 102. This way, a carry is avoided.",
            "Again, calculate from left to right with these 3-digit numbers. For the harder problems, it may be helpful to say the problem out loud before starting the calculation. Do them in two ways; make sure the second way uses subtraction.",
            "Do the following subtraction problems from left to right.",
            "Determine the complements of the following numbers, that is, their distance from 100.",
            "Use complements to solve these problems. For example, try 835 – 467. We  first subtract 500 (835 – 500 = 335), but then we need to add back something. How far is 467 from 500, or how far is 67 from 100? Find the complement of 67 (33) and add it to 335: 335 + 33 = 368.",
            "Determine the complements of these 3-digit numbers, that is, their distance from 1000.",
            "Use complements to determine the correct amount of change.",
            "Work from left to right, one digit at a time, and look for opportunities to use complements to turn hard addition problems into simple subtraction problems, and vice versa."
        ]
        
        let lecture2ProblemType = arc4random_uniform(8) + 1
        var problem = MMProblem(expressionText: "", solution: 0.0, tipSheetText: "", problemType: "standard")
        
        problem = MMProblem(expressionText: "expression", solution: Float(0.0), tipSheetText: tipSheet[Int(lecture2ProblemType) - 1], problemType: "standard")
        switch lecture2ProblemType {
        case 1:
            /*
             1. "Solve the following mental addition problems by calculating from left to right. To add 3-digit numbers,  rst add the 100s, then the 10s, then the 1s. For 314 + 159,  first add 314 + 100 = 414. The problem is now simpler, 414 + 59; keep the 400 in mind and focus on 14 + 59. Add 14 + 50 = 64, then add 9 to get 73. The answer to the original problem is 473. For an added challenge, look away from the numbers after reading the problem."
             */
            let twoDigitOperandA = arc4random_uniform(99) + 1
            let twoDigitOperandB = arc4random_uniform(99) + 1
            
            let result = twoDigitOperandA + twoDigitOperandB
            let expression = "\(twoDigitOperandA) + \(twoDigitOperandB)"
            
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture2ProblemType) - 1], problemType: "standard")
        case 2:
            /*
             2. "Do these 2-digit addition problems in two ways; make sure the second way involves subtraction. Use complements to do this. For example, 28 + 74 can be thought of instead as 30 + 74, which is 104, but then subtract 2, which is 102. This way, a carry is avoided."
             */
            var twoDigitOperandA = Int32(-1)
            var twoDigitOperandB = Int32(-1)
            var criteriaNotSatisfied = true
            repeat {
                twoDigitOperandA = Int32(arc4random_uniform(99)) + 1
                twoDigitOperandB = Int32(arc4random_uniform(99)) + 1
                if (twoDigitOperandA > 10 && twoDigitOperandB > 10 && (twoDigitOperandA % 10 > 0) && (twoDigitOperandB % 10 > 0)) {
                    criteriaNotSatisfied = false
                }
            } while (criteriaNotSatisfied)
            
            let result = twoDigitOperandA + twoDigitOperandB
            let expression = "\(twoDigitOperandA) + \(twoDigitOperandB)"
            
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture2ProblemType) - 1], problemType: "standard")
        case 3:
            /*
             3. "Again, calculate from left to right with these 3-digit numbers. For the harder problems, it may be helpful to say the problem out loud before starting the calculation. Do them in two ways; make sure the second way uses subtraction."
             */
            var threeDigitOperandA = Int32(-1)
            var threeDigitOperandB = Int32(-1)
            var criteriaNotSatisfied = true
            repeat {
                threeDigitOperandA = Int32(arc4random_uniform(999)) + 1
                threeDigitOperandB = Int32(arc4random_uniform(999)) + 1
                if (threeDigitOperandA > 100 && threeDigitOperandB > 100 && (threeDigitOperandA % 100 > 0) && (threeDigitOperandB % 100 > 0)) {
                    criteriaNotSatisfied = false
                }
            } while (criteriaNotSatisfied)
            
            let result = threeDigitOperandA + threeDigitOperandB
            let expression = "\(threeDigitOperandA) + \(threeDigitOperandB)"
            
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture2ProblemType) - 1], problemType: "standard")
        case 4:
            /*
             4. "Do the following subtraction problems from left to right. pp16-17"
             */
            let twoDigitOperandA = arc4random_uniform(999) + 1
            let twoDigitOperandB = arc4random_uniform(999) + 1
            
            var result = 0
            var expression = "0"
            
            if (twoDigitOperandB > twoDigitOperandA) {
                result = Int(twoDigitOperandB) - Int(twoDigitOperandA)
                expression = "\(twoDigitOperandB) - \(twoDigitOperandA)"
            } else {
                result = Int(twoDigitOperandA) - Int(twoDigitOperandB)
                expression = "\(twoDigitOperandA) - \(twoDigitOperandB)"
            }
            
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture2ProblemType) - 1], problemType: "standard")
        case 5:
            /*
             Determine the complements of the following numbers, that is, their distance from 100.
             */
            let twoDigitOperandA = arc4random_uniform(99) + 1
            let expression = "Determine complement of \(twoDigitOperandA)"
            problem = MMProblem(expressionText: expression, solution: Float(100 - twoDigitOperandA), tipSheetText: tipSheet[Int(lecture2ProblemType) - 1], problemType: "standard")
        case 6:
            /*
             "Use complements to solve these problems. For example, try 835 – 467. We  first subtract 500 (835 – 500 = 335), but then we need to add back something. How far is 467 from 500, or how far is 67 from 100? Find the complement of 67 (33) and add it to 335: 335 + 33 = 368."
             */
            var threeDigitOperandA = Int32(-1)
            var threeDigitOperandB = Int32(-1)
            var criteriaNotSatisfied = true
            repeat {
                threeDigitOperandA = Int32(arc4random_uniform(999)) + 1
                threeDigitOperandB = Int32(arc4random_uniform(999)) + 1
                if (threeDigitOperandA > 100 && threeDigitOperandB > 100 && (threeDigitOperandA % 100 > 0) && (threeDigitOperandB % 100 > 0)) {
                    criteriaNotSatisfied = false
                }
            } while (criteriaNotSatisfied)
            
            var result = 0
            var expression = "0"
            if (threeDigitOperandA < threeDigitOperandB) {
                result = Int(threeDigitOperandB) - Int(threeDigitOperandA)
                expression = "\(threeDigitOperandB) - \(threeDigitOperandA)"
            } else {
                result = Int(threeDigitOperandA) - Int(threeDigitOperandB)
                expression = "\(threeDigitOperandA) - \(threeDigitOperandB)"
            }
            
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture2ProblemType) - 1], problemType: "standard")
        case 7:
            /*
             Determine the complements of these 3-digit numbers, that is, their distance from 1000.
             */
            var threeDigitOperandA = Int32(arc4random_uniform(999) + 1)
            var criteriaNotSatisfied = true
            repeat {
                if (threeDigitOperandA > 100) {
                    criteriaNotSatisfied = false
                } else {
                    threeDigitOperandA = Int32(arc4random_uniform(99) + 1)
                }
            } while (criteriaNotSatisfied)
            
            let expression = "Determine complement of \(threeDigitOperandA)"
            problem = MMProblem(expressionText: expression, solution: Float(1000 - threeDigitOperandA), tipSheetText: tipSheet[Int(lecture2ProblemType) - 1], problemType: "standard")
        case 8:
            /* Use complements to determine the correct amount of change. */
            let randomlyChooseThreeOrFourDigitNum = arc4random_uniform(2)
            var cashDue: Float = 0
            
            /* Give equal weight to occurence 3 and 4 digit numbers */
            if (randomlyChooseThreeOrFourDigitNum == 0) {
                cashDue = Float(arc4random_uniform(999)) + 100.00
            } else {
                cashDue = Float(arc4random_uniform(9999)) + 100.00
            }
            
            var cashToChange: Float = 0
            let randomlyChooseTenOrTwenty = arc4random_uniform(2)
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            
            if (cashDue <= 999) {
                switch randomlyChooseTenOrTwenty {
                case 0:
                    cashToChange = 10.00
                case 1:
                    cashToChange = 20.00
                default:
                    cashToChange = 10.00
                }
            } else {
                cashToChange = 100.00
            }
            
            let cashDueIntermediate = cashDue / 100.00
            let cashDueNumber = NSNumber(value: cashDueIntermediate)
            let cashDueStr = formatter.string(from: cashDueNumber)
            let cashToChangeIntermediate = NSNumber(value: cashToChange)
            let cashToChangeStr = formatter.string(from: cashToChangeIntermediate)
            
            var expression = ""
            if let cashDueStr = cashDueStr, let cashToChangeStr = cashToChangeStr {
                expression = "$\(cashDueStr) from $\(cashToChangeStr)"
            }
            problem = MMProblem(expressionText: expression, solution: Float(cashToChange - cashDue), tipSheetText: tipSheet[Int(lecture2ProblemType) - 1], problemType: "standard")
        case 9:
            /*
             Adding and subtracting 3 and 4 digit numbers  to/from 2 and 3 digit numbers with only 1 overlapping digit.
             Examples: 1620 + 48, 6300-108, etc.
             Algorithm for generating this kind of problem:
             1. Randomly generate a 3 or 4 digit number 'A' that is divisible by 10 (hence, A % 10 = 0)
             2. If step 1 results in 3 digit number, randomly generate a 2 digit number 'B' greater than 10.
             3. If step 1 results in a 4 digit number, randomly generate a 2 digit number greater than 10 OR
             a 3 digit number divisible by 10. Call this number 'B'.
             4. Randomly generate the operation '+' or '-' and compose the problem 'A + B' or 'A - B'. DONE!!
             */
            let randomlyChooseThreeOrFourDigitOpA = arc4random_uniform(2)
            _ = arc4random_uniform(2)
            _ = Int32(-1)
            var criteriaNotSatisfied = true;
            var opA = Int32(-1)
            var opB = Int32(-1)
            var expression = ""
            let operand = (arc4random_uniform(2) == 0) ? "+" : "-"
            
            switch (randomlyChooseThreeOrFourDigitOpA) {
            case 0:
                repeat {
                    opA = Int32((arc4random_uniform(999) + 1) * 10)
                    if (opA % 100 == 0) {
                        // If opA is a multiple of 100, use 3-digit multiple of 10 for opB
                        opB = Int32((arc4random_uniform(99) + 1) * 10)
                        criteriaNotSatisfied = false
                    }
                    else {
                        // If opA is not a multiple of 100, use 2-digit number for opB
                        opB = Int32(arc4random_uniform(89) + 11)
                        criteriaNotSatisfied = false
                    }
                } while(criteriaNotSatisfied)
                break
            case 1:
                opA = Int32((arc4random_uniform(99) + 1) * 10)
                opB = Int32(arc4random_uniform(89) + 11)
                break
            default:
                break
            }
            var result = 0
            expression = "\(opA) " + operand + " \(opB)"
            if (operand == "-") {
                if (opA < opB) {
                    result = Int(opB) - Int(opA)
                } else {
                    result = Int(opA) - Int(opB)
                }
            } else {
                result = Int(opA) + Int(opB)
            }
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture2ProblemType) - 1], problemType: "standard")
        default:
            /*
             1. "Solve the following mental addition problems by calculating from left to right. To add 3-digit numbers,  First add the 100s, then the 10s, then the 1s. For 314 + 159,  first add 314 + 100 = 414. The problem is now simpler, 414 + 59; keep the 400 in mind and focus on 14 + 59. Add 14 + 50 = 64, then add 9 to get 73. The answer to the original problem is 473. For an added challenge, look away from the numbers after reading the problem."
             */
            let twoDigitOperandA = arc4random_uniform(99) + 1
            let twoDigitOperandB = arc4random_uniform(99) + 1
            
            let result = twoDigitOperandA + twoDigitOperandB
            let expression = "\(twoDigitOperandA) + \(twoDigitOperandB)"
            
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture2ProblemType) - 1], problemType: "standard")
        }
        return problem
    }
    
    private func generateLecture3Problem() -> MMProblem {
        // There are 5 types of problem in Lecture 3, so we must randomly generate one from the 5 possible types
        let lecture3ProblemType = arc4random_uniform(5) + 1
        var expression = "Undefined expression: Lecture 3"
        var result = UInt32(0)
        var tipSheet = [
            "2-by-1 multiplication problems can be calculated using the addition method or the subtraction method. To solve a multiplication problem using the addition method, you break the problem into sums of numbers. For example: 4 × 17 = (4 × 10) + (4 × 7) = 40 + 28 = 68. Another example would be 41 × 17 = (40 × 17) + (1 × 17) = 697. To solve using the subtraction method, you could consider 4 × 17 = 4 × (20 - 3) = (4 × 20) - (4 × 3) = 80 - 12 = 68. Again, with another example: 41 × 17 = 41 × (20 - 3) = (41 × 20) - (41 × 3) = 820 - 123 = 697  For a good mental workout, verify an answer by using one method first, and then trying with the other method to arrive at the same answer.",
            "When dealing with 2-by-2 problems where one operand is divisible by 10, the problem is essentially a 2-by-1 problem with a 0 attached. In this case, just use the addition and/or subtraction methods for dealing with 2-by-1 problems, then append a zero to the result. For example: 40 × 17 = (4 × 10) + (4 × 7) = 40 + 28 = 68, with a zero appended = 680. For a good mental workout, verify an answer by using one method first, and then trying with the other method to arrive at the same answer.",
            "3-by-1 multiplication problems are best done working from left to right. It helps to recite the answer as you are calculating from left to right. Either say it out loud or in your head - this will boost your memory. For example: 324 × 7 = 2100 + 140 + 28 = 2240 + 28 = 2268 or 'Twenty-one-hundred, plus one-hundred forty equals Two-thousand, two-hundred forty plus twenty-eight equals Twenty-two hundred and sixty-eight.",
            "3-by-3 multiplication problems where one operand is divisible by 100 is essentially a 3-by-1 problem where you append two zeros at the end. For example, 404 × 400 = 404 x 4 = 1600 + 16 = 1616, with two zeros appended = 161,600.",
            "When dealing with these 2-by-2 problems, use the factoring method to turn the problem into a 2-by-1 problem followed by a 2-by-1 or 3-by-1 problem. For example, 54 × 24 = 54 × 6 × 4 = (300 + 24) × 4 = 324 × 4 = 1200 + 80 + 16 = 1296."
        ]
        var problem = MMProblem(expressionText: expression, solution: Float(0.0), tipSheetText: tipSheet[Int(lecture3ProblemType) - 1], problemType: "standard")
        
        switch (lecture3ProblemType) {
            /* 2-by-1 multiplication problems to exercise the addition and subtraction methods. */
        case 1:
            var twoDigitOperandA = UInt32(0)
            var isFewerThanTwoDigits = true;
            
            repeat {
                twoDigitOperandA = arc4random_uniform(99) + 1
                isFewerThanTwoDigits = twoDigitOperandA < 10
            } while(isFewerThanTwoDigits)
            
            let oneDigitOperandB = arc4random_uniform(9) + 1
            result = twoDigitOperandA * oneDigitOperandB
            /* Randomize the order of appearance so we are comfortable working on problems regardless of how they are visualized. */
            expression = "\(twoDigitOperandA) × \(oneDigitOperandB)"
            let smallerIsFirst = arc4random_uniform(2)
            if (smallerIsFirst == 1) {
                expression = "\(oneDigitOperandB) × \(twoDigitOperandA)"
            }
            break
        case 2:
            var twoDigitOperandA = UInt32(0)
            var isFewerThanTwoDigits = true;
            
            repeat {
                twoDigitOperandA = arc4random_uniform(99) + 1
                isFewerThanTwoDigits = twoDigitOperandA < 10
            } while(isFewerThanTwoDigits)
            
            let twoDigitFactorOfTenOperandB = (arc4random_uniform(9) + 1) * 10
            result = twoDigitOperandA * twoDigitFactorOfTenOperandB
            /* Randomize the order of appearance so we are comfortable working on problems regardless of how they are visualized. */
            expression = "\(twoDigitOperandA) × \(twoDigitFactorOfTenOperandB)"
            let factorOfTenIsFirst = arc4random_uniform(2)
            if (factorOfTenIsFirst == 1) {
                expression = "\(twoDigitFactorOfTenOperandB) × \(twoDigitOperandA)"
            }
            break
        case 3:
            var threeDigitOperandA = UInt32(0)
            var isFewerThanThreeDigits = true;
            
            repeat {
                threeDigitOperandA = arc4random_uniform(999) + 1
                isFewerThanThreeDigits = threeDigitOperandA < 100
            } while(isFewerThanThreeDigits)
            
            let oneDigitOperandB = arc4random_uniform(9) + 1
            result = threeDigitOperandA * oneDigitOperandB
            /* Randomize the order of appearance so we are comfortable working on problems regardless of how they are visualized. */
            expression = "\(threeDigitOperandA) × \(oneDigitOperandB)"
            let oneDigitIsFirst = arc4random_uniform(2)
            if (oneDigitIsFirst == 1) {
                expression = "\(oneDigitOperandB) × \(threeDigitOperandA)"
            }
            break
        case 4:
            var threeDigitDivisibleByOneHundredOperandA = UInt32(0)
            
            var isFewerThanThreeDigits = true
            var isNotDivisibleByOneHundred = true
            repeat {
                threeDigitDivisibleByOneHundredOperandA = arc4random_uniform(999) + 1
                isFewerThanThreeDigits = threeDigitDivisibleByOneHundredOperandA < 100
                if (!isFewerThanThreeDigits) {
                    isNotDivisibleByOneHundred = threeDigitDivisibleByOneHundredOperandA % 100 > 0
                }
            } while(isFewerThanThreeDigits || isNotDivisibleByOneHundred)
            
            var threeDigitOperandB = arc4random_uniform(9) + 1
            
            isFewerThanThreeDigits = true
            repeat {
                threeDigitOperandB = arc4random_uniform(999) + 1
                isFewerThanThreeDigits = threeDigitOperandB < 100
            } while (isFewerThanThreeDigits)
            
            result = threeDigitDivisibleByOneHundredOperandA * threeDigitOperandB
            /* Randomize the order of appearance so we are comfortable working on problems regardless of how they are visualized. */
            expression = "\(threeDigitDivisibleByOneHundredOperandA) × \(threeDigitOperandB)"
            let operandBIsFirst = arc4random_uniform(2)
            if (operandBIsFirst == 1) {
                expression = "\(threeDigitOperandB) × \(threeDigitDivisibleByOneHundredOperandA)"
            }
            break
        case 5:
            var twoDigitOperandA = UInt32(0)
            var twoDigitOperandB = UInt32(0)
            var isLessThanTen = true
            
            repeat {
                twoDigitOperandA = arc4random_uniform(99) + 1
                isLessThanTen = twoDigitOperandA < 10
            } while(isLessThanTen)
            
            isLessThanTen = true
            repeat {
                twoDigitOperandB = arc4random_uniform(99) + 1
                isLessThanTen = twoDigitOperandB < 10
            } while(isLessThanTen)
            
            result = twoDigitOperandA * twoDigitOperandB
            expression = "\(twoDigitOperandA) × \(twoDigitOperandB)"
            break
        default:
            break
        }
        problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText:tipSheet[Int(lecture3ProblemType) - 1], problemType: "standard")
        return problem
    }
    
    private func generateLecture4Problem() -> MMProblem {
        // There are 10 types of problem in Lecture 4, so we must randomly generate one from the 5 possible types
        let lecture4ProblemType = 6 //arc4random_uniform(10) + 1
        let expression = "Undefined expression: Lecture 4"
        _ = UInt32(0)
        var tipSheet = [
            "A number is divisible by 2 only if it ends in 0, 2, 4, 6, or 8.",
            "A number is divisible by 3 if and only if the sum of its digits are divisible by 3. For example, 1234 is not a multiple of 3 since 1 + 2 + 3 + 4 = 10, which is not divisible by 3. However, 12345 is divisible by 3 since 1 + 2 + 3 + 4 + 5 = 15, which is 3 × 5.",
            "A number is divisible by 4 if the last 2 digits are 00 or a multiple of 4 other than 4. For example, 271828 is a multiple of 4 because the last 2 digits - 28 - are a multiple of 4: 4 × 7 = 28.",
            "A number is divisible by 5 only if it ends in 0 or 5.",
            "A number is divisible by 6 when it is divisible by both 2 and 3. For example, 474 is divisble by 2 since we recall the rule for determining divisibility by 2 which states that if the number ends in 0, 2, 4, 6, or 8, then it is divisible by 2. In this case, it ends in 4. The number 474 is divisible by 3 since we then recall the rule for determining divisibility by 3 which states a number is divisible by 3 if the sum of its digits are divisible by 3. In this case, 4 + 7 + 4 = 15, which is divisible by 3. Therefore, it follows that 474 is thus divisible by 6, since it is also divisible by 2 and 3.",
            "To determine if a number is divisible by 7, a few tricks can be used. One trick goes as follows: (1) remove the last digit of the number (2) double this number (3) subtract it from the rest of the number. If the result is divisible by 7, then the number itself is divisible by 7. If the result is too large to determine by quick inspection that it is divisible by 7, you can run the algorithm again. For example, is 112 divisible by 7? (1) remove 2 and (2) double it to get 4. (3) Subtract 4 from 11 to get 7. Is 7 divisible by 7? Of course it is, therefore, it follows 112 is divisible by 7. Another example: is 2345 divisible by 7? Apply the algorithm: (1) remove 5 and (2) double it to get 10. (3) Subtract 10 from 234 to get 224. Is 224 divisible by 7? We're not sure, so we run the algorithm again on this result: (1) remove the last digit 4 and (2) double it to get 8, then (3) subtract 8 from 22 to get 14. Is 14 divisible by 7? Of course it is, hence it follows that 224 is divisible by 7. Another way to determine if a number is divisible by 7 is by using the 'Create a Zero, Kill a Zero' rule, which might be easier to remember. This method works as follows: is 1234 divisible by 7? (1) subtract or add multiple of 7 that will cause the result to end in 0...14 works...1234 - 14 = 1220. (2) We created a zero here, note 122'0'. (3) Now we 'kill' the zero to get 122. (4) Now ask, is 122 divisible by 7? We're not sure, so we repeat the algorithm: (1) 28 is a multiple of 7, so add that to 122 to get 150. (2) We created a zero! 15'0'. (3) Again, 'kill' the zero to get 15. (4) Is 15 a multiple of 7? Nope. Therefore, 2345 is not divisible by 7.",
            "A number is divisible by 8 if the last 3 digits are a multiple of 8. For example, 123456 is divislbe by 8 since 456 - the last 3 digits - is a multiple of 8: 8 × 57 = 456. Conversely, if the last 2 digits are not a multiple of 4, then the number cannot be divisible by 8. Take for example, 31415926. This number is not divisible by 8 since 26 - the last 2 digits - is not a multiple of 4, therefore, 31415926 is not divisible by 8.",
            "A number is divisible by 9 if and only if the sum of its digits are divisible by 9. For example, 2358 is a multiple of 9 because 2 + 3 + 5 + 8 = 18, which is 2 × 9.",
            "A number is divisible by 10 if and only if it ends in 0",
            "A number is divisible by 11 if and only if when you alternately subtract and add the digits, you get a 0 or a multiple of 11. For example, 843689 is a multiple of 11 since 8 - 4 + 3 - 6 + 8 - 9 = 0.",
            "A number is divisible by 12 if it is divisible by both 3 and 4. For example, the number 948 is divisible by 12. By recalling the rule for determining divisibility of 3 which states that a number is divisible by 3 if the sum of its digits is divisible by 3, we determine that 948 is divisible by 3 since 9 + 4 + 8 = 21, which is 3 × 7. Thus 948 is divisible by 3. Next, we recall that the rule for determining divisibility of 4 which states that a number is divisible by 4 the last 2 digits of the number are a multiple of 4. In this case, 948 is divisible by 4 since 48 is 4 × 12. Therefore, since 948 is divisible by both 3 and 4, it follows that 948 is divisible by 12.",
            "The Create a Zero / Kill a Zero Rule for Odd Numbers not Equal to 5. Can be described in this example: is 1234 divisible by 7? (1) subtract or add multiple of 7 that will cause the result to end in 0...14 works...1234 - 14 = 1220. (2) We created a zero here, note 122'0'. (3) Now we 'kill' the zero to get 122. (4) Now ask, is 122 divisible by 7? We're not sure, so we repeat the algorithm: (1) 28 is a multiple of 7, so add that to 122 to get 150. (2) We created a zero! 15'0'. (3) Again, 'kill' the zero to get 15. (4) Is 15 a multiple of 7? Nope. Therefore, 2345 is not divisible by 7. This algorithm can be generalized and applied to odd numbers not equal to 5. Just replace 7 in the prior example with the number in question to determine divisibility for it.",
            "Divide a 3 or 4 digit number by a 1 digit number",
            "Divide a 3 or 4 digit number by a 2 digit number",
            "Using the Overshooting Technique To Divide 3 and 4 digit numbers by 1 and 2 digit numbers.",
            "6",
            "7",
            "8",
            "9",
            "10"
        ]
        var problem = MMProblem(expressionText: expression, solution: Float(0.0), tipSheetText: tipSheet[Int(lecture4ProblemType) - 1], problemType: "trueOrFalse")
        
        switch (lecture4ProblemType) {
        case 1:
            var someNumThatMightBeEven = arc4random_uniform(99999) + 1
            // randomize whether or not generated number is even
            let shouldMakeItEven = arc4random_uniform(2)
            
            /* randomly generated num is even, so make it odd by subtracting 1 */
            if (someNumThatMightBeEven % 2 == 0 && shouldMakeItEven == 0) {
                someNumThatMightBeEven = someNumThatMightBeEven - 1;
            }
            
            if (someNumThatMightBeEven % 2 != 0 && shouldMakeItEven == 1) {
                /* the generated number is not even but we want to make it even */
                someNumThatMightBeEven = someNumThatMightBeEven * 2
            }

            let expression = "Is \(someNumThatMightBeEven) divisible by 2?"
            problem.expressionText = expression
            problem.solution = Float(shouldMakeItEven)
            break
        case 2:
            var someNumThatMightBeDivBy3 = arc4random_uniform(99999) + 1
            // randomize whether or not generated number is divisible by 3
            let shouldMakeItDivBy3 = arc4random_uniform(2)
            
            /* randomly generated num is divisible by 3, so make it indivisible by 3 by subtracting 1 */
            if (someNumThatMightBeDivBy3 % 3 == 0 && shouldMakeItDivBy3 == 0) {
                someNumThatMightBeDivBy3 = someNumThatMightBeDivBy3 - 1;
            }
            
            if (someNumThatMightBeDivBy3 % 3 != 0 && shouldMakeItDivBy3 == 1) {
                /* the generated number is not divisible by 3 but we want to make it divisible by 3 */
                someNumThatMightBeDivBy3 = someNumThatMightBeDivBy3 * 3
            }
            
            let expression = "Is \(someNumThatMightBeDivBy3) divisible by 3?"
            problem.expressionText = expression
            problem.solution = Float(shouldMakeItDivBy3)
            break
        case 3:
            var someNumThatMightBeDivBy4 = arc4random_uniform(99999) + 1
            // randomize whether or not generated number is divisible by 4
            let shouldMakeItDivBy4 = arc4random_uniform(2)
            
            /* randomly generated num is divisible by 4, so make it indivisible by 4 by subtracting 1 */
            if (someNumThatMightBeDivBy4 % 4 == 0 && shouldMakeItDivBy4 == 0) {
                someNumThatMightBeDivBy4 = someNumThatMightBeDivBy4 - 1;
            }
            
            if (someNumThatMightBeDivBy4 % 4 != 0 && shouldMakeItDivBy4 == 1) {
                /* the generated number is not divisible by 4 but we want to make it divisible by 4 */
                someNumThatMightBeDivBy4 = someNumThatMightBeDivBy4 * 4
            }
            
            let expression = "Is \(someNumThatMightBeDivBy4) divisible by 4?"
            problem.expressionText = expression
            problem.solution = Float(shouldMakeItDivBy4)
            break
        case 4:
            var someNumThatMightBeDivBy5 = arc4random_uniform(99999) + 1
            // randomize whether or not generated number is divisible by 5
            let shouldMakeItDivBy5 = arc4random_uniform(2)
            
            /* randomly generated num is divisible by 5, so make it indivisible by 5 by subtracting 1 */
            if (someNumThatMightBeDivBy5 % 5 == 0 && shouldMakeItDivBy5 == 0) {
                someNumThatMightBeDivBy5 = someNumThatMightBeDivBy5 - 1;
            }
            
            if (someNumThatMightBeDivBy5 % 5 != 0 && shouldMakeItDivBy5 == 1) {
                /* the generated number is not divisible by 5 but we want to make it divisible by 5 */
                someNumThatMightBeDivBy5 = someNumThatMightBeDivBy5 * 5
            }
            
            let expression = "Is \(someNumThatMightBeDivBy5) divisible by 5?"
            problem.expressionText = expression
            problem.solution = Float(shouldMakeItDivBy5)
            break
        case 5:
            var someNumThatMightBeDivBy6 = arc4random_uniform(99999) + 1
            // randomize whether or not generated number is divisible by 4
            let shouldMakeItDivBy6 = arc4random_uniform(2)
            
            /* randomly generated num is divisible by 6, so make it indivisible by 6 by subtracting 1 */
            if (someNumThatMightBeDivBy6 % 6 == 0 && shouldMakeItDivBy6 == 0) {
                someNumThatMightBeDivBy6 = someNumThatMightBeDivBy6 - 1;
            }
            
            if (someNumThatMightBeDivBy6 % 6 != 0 && shouldMakeItDivBy6 == 1) {
                /* the generated number is not divisible by 6 but we want to make it divisible by 6 */
                someNumThatMightBeDivBy6 = someNumThatMightBeDivBy6 * 6
            }
            
            let expression = "Is \(someNumThatMightBeDivBy6) divisible by 6?"
            problem.expressionText = expression
            problem.solution = Float(shouldMakeItDivBy6)
        case 6:
            var someNumThatMightBeDivBy7 = arc4random_uniform(99999) + 1
            // randomize whether or not generated number is divisible by 7
            let shouldMakeItDivBy7 = arc4random_uniform(2)
            
            /* randomly generated num is divisible by 7, so make it indivisible by 3 by subtracting 1 */
            if (someNumThatMightBeDivBy7 % 7 == 0 && shouldMakeItDivBy7 == 0) {
                someNumThatMightBeDivBy7 = someNumThatMightBeDivBy7 - 1;
            }
            
            if (someNumThatMightBeDivBy7 % 7 != 0 && shouldMakeItDivBy7 == 1) {
                /* the generated number is not divisible by 7 but we want to make it divisible by 7 */
                someNumThatMightBeDivBy7 = someNumThatMightBeDivBy7 * 7
            }
            
            let expression = "Is \(someNumThatMightBeDivBy7) divisible by 7?"
            problem.expressionText = expression
            problem.solution = Float(shouldMakeItDivBy7)
            break
        case 7:
            break
        case 8:
            break
        case 9:
            break
        case 10:
            break
        default:
            break
        }
        return problem
    }
    /*
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
