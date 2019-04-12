//
//  MMProblemContainerViewController.swift
//  Mental Math Trainer
//
//  Created by Fabricio Machado on 5/30/17.
//  Copyright © 2017 Fabricio Machado. All rights reserved.
//

import UIKit
var standardProblemSetSegueID = "embedStandardProblems"
var tenByTenMultTableSegueID = "embedTenByTenTable"
var eightByNineTableSegueID = "embedEightByNineTable"
var elevenToNineteenTableSegueID = "embedElevenToNineteenTable"
var trueOrFalseSegueID = "embedTrueOrFalse"

class MMProblemContainerViewController: UIViewController {
    var currentSegueIdentifier = standardProblemSetSegueID
    var tipSheetText = ""
    var currentCategory = Category(rawValue: 0)
    var currentProblem: MMProblem?
    var problemGenerator = MMProblemGenerator.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.generateNextProblemAndRefresh()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showTipSheet(tipVerbiage: String) {
        self.tipSheetText = tipVerbiage
        self.performSegue(withIdentifier: "showTipSheet", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tipSheetVC = segue.destination as? MMTipSheetViewController {
            tipSheetVC.tipSheetText = self.tipSheetText
        }
        if let destinationVC = segue.destination as? MMBaseProblemViewController {
            destinationVC.currentProblem = self.currentProblem
        }
        switch segue.identifier! {
        case standardProblemSetSegueID:
            if (self.children.count > 0) {
                self.switchToViewController(destination: segue.destination, origin: self.children[0])
            } else {
                self.addChild(segue.destination)
                segue.destination.view.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height))
                self.view.addSubview(segue.destination.view)
                segue.destination.didMove(toParent: self)
            }
            break
        case tenByTenMultTableSegueID:
            if (self.children.count > 0) {
                self.switchToViewController(destination: segue.destination, origin: self.children[0])
            } else {
                self.addChild(segue.destination)
                segue.destination.view.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height))
                self.view.addSubview(segue.destination.view)
                segue.destination.didMove(toParent: self)
            }
            break
        case eightByNineTableSegueID:
            if (self.children.count > 0) {
                self.switchToViewController(destination: segue.destination, origin: self.children[0])
            } else {
                self.addChild(segue.destination)
                segue.destination.view.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height))
                self.view.addSubview(segue.destination.view)
                segue.destination.didMove(toParent: self)
            }
            break
        case elevenToNineteenTableSegueID:
            if (self.children.count > 0) {
                self.switchToViewController(destination: segue.destination, origin: self.children[0])
            } else {
                self.addChild(segue.destination)
                segue.destination.view.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height))
                self.view.addSubview(segue.destination.view)
                segue.destination.didMove(toParent: self)
            }
            break
        case trueOrFalseSegueID:
            if (self.children.count > 0) {
                self.switchToViewController(destination: segue.destination, origin: self.children[0])
            } else {
                self.addChild(segue.destination)
                segue.destination.view.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height))
                self.view.addSubview(segue.destination.view)
                segue.destination.didMove(toParent: self)
            }
            break
        default:
            break
        }
    }
    
    func switchToViewController(destination: UIViewController, origin: UIViewController) {
        destination.view.frame =  CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height))
        origin.willMove(toParent: nil)
        self.addChild(destination)
        self.transition(from: origin, to: destination, duration: 0.25, options: .transitionCrossDissolve, animations: nil) { (isFinished) in
            origin.removeFromParent()
            destination.didMove(toParent: self)
            
        }
    }
    
    func loadViewForProblem(problem: MMProblem) {
        switch problem.problemType {
        case "standard":
            self.currentSegueIdentifier = standardProblemSetSegueID
        case "tenByTenTable":
            self.currentSegueIdentifier = tenByTenMultTableSegueID
        case "eightByNineTable":
            self.currentSegueIdentifier = eightByNineTableSegueID
        case "elevenToNineteenTable":
            self.currentSegueIdentifier = elevenToNineteenTableSegueID
        case "trueOrFalse":
            self.currentSegueIdentifier = trueOrFalseSegueID
        default:
            self.currentSegueIdentifier = standardProblemSetSegueID
        }
        self.performSegue(withIdentifier: self.currentSegueIdentifier, sender: self)
    }
    
    func generateNextProblem() -> MMProblem {
        return problemGenerator.generateFor(problemCategory: self.currentCategory!)
    }
    
    func generateNextProblemAndRefresh() {
        self.currentProblem = self.generateNextProblem()
        if let problem = self.currentProblem {
            self.loadViewForProblem(problem: problem)
        }
    }
    
}
