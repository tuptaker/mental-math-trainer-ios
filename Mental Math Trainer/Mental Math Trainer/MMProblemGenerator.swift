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
            problem = self.generateLecture1Problem()
        case .lecture1:
            problem = self.generateLecture1Problem()
        case .lecture2:
            problem = self.generateLecture2Problem()
            /*
             case .lecture3:
             problem = self.generateLecture3Problem()
             case .lecture4:
             problem = self.generateLecture4Problem()
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
            "Solve the following mental addition problems by calculating from left to right. To add 3-digit numbers,  rst add the 100s, then the 10s, then the 1s. For 314 + 159,  first add 314 + 100 = 414. The problem is now simpler, 414 + 59; keep the 400 in mind and focus on 14 + 59. Add 14 + 50 = 64, then add 9 to get 73. The answer to the original problem is 473. For an added challenge, look away from the numbers after reading the problem.",
            "Do these 2-digit addition problems in two ways; make sure the second way involves subtraction. Use complements to do this. For example, 28 + 74 can be thought of instead as 30 + 74, which is 104, but then subtract 2, which is 102. This way, a carry is avoided.",
            "Again, calculate from left to right with these 3-digit numbers. For the harder problems, it may be helpful to say the problem out loud before starting the calculation. Do them in two ways; make sure the second way uses subtraction.",
            "Do the following subtraction problems from left to right.",
            "Determine the complements of the following numbers, that is, their distance from 100.",
            "Use complements to solve these problems. For example, try 835 – 467. We  first subtract 500 (835 – 500 = 335), but then we need to add back something. How far is 467 from 500, or how far is 67 from 100? Find the complement of 67 (33) and add it to 335: 335 + 33 = 368.",
            "Determine the complements of these 3-digit numbers, that is, their distance from 1000.",
            "Use complements to determine the correct amount of change."
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
            print("ten or twenty \(randomlyChooseTenOrTwenty)")
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
        default:
            /*
             1. "Solve the following mental addition problems by calculating from left to right. To add 3-digit numbers,  rst add the 100s, then the 10s, then the 1s. For 314 + 159,  first add 314 + 100 = 414. The problem is now simpler, 414 + 59; keep the 400 in mind and focus on 14 + 59. Add 14 + 50 = 64, then add 9 to get 73. The answer to the original problem is 473. For an added challenge, look away from the numbers after reading the problem."
             */
            let twoDigitOperandA = arc4random_uniform(99) + 1
            let twoDigitOperandB = arc4random_uniform(99) + 1
            
            let result = twoDigitOperandA + twoDigitOperandB
            let expression = "\(twoDigitOperandA) + \(twoDigitOperandB)"
            
            problem = MMProblem(expressionText: expression, solution: Float(result), tipSheetText: tipSheet[Int(lecture2ProblemType) - 1], problemType: "standard")
        }
        return problem
    }
    /*
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
