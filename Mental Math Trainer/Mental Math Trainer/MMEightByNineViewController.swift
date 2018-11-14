//
//  MMEightByNineViewController.swift
//  Mental Math Trainer
//
//  Created by Fabricio Machado on 6/3/17.
//  Copyright © 2017 Fabricio Machado. All rights reserved.
//

import UIKit

class MMEightByNineViewController: MMBaseProblemViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellView =  UINib(nibName: "MMMultTableCollectionViewCell", bundle: nil)
        self.multTableCollectionView.register(cellView, forCellWithReuseIdentifier: "multTableCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateVisualizationForCurrentAnswers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func checkYourAnswer(_ sender: UIButton) {
        self.updateVisualizationForCurrentAnswers()
    }
    
    
    @IBAction func moveToNextProblem(_ sender: UIButton) {
        if let parentVC = self.parent as? MMProblemContainerViewController {
            parentVC.generateNextProblemAndRefresh()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let multTableCell = collectionView.dequeueReusableCell(withReuseIdentifier: "multTableCell", for: indexPath)
        return multTableCell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let multTableCell = cell as? MMMultTableCollectionViewCell, let _ = multTableCell.multResultLabel {
            multTableCell.multResultLabel.text = "?"
            multTableCell.backgroundColor = UIColor.white
            multTableCell.multResultLabel.textColor = UIColor.black
            if (indexPath.row == 0 && indexPath.section == 0) {
                multTableCell.multResultLabel.text = ""
            }
            if (indexPath.row == 0 && indexPath.section >= 1) {
                multTableCell.multResultLabel.text = "\(indexPath.section + 10)"
                multTableCell.backgroundColor = UIColor.white
                multTableCell.multResultLabel.textColor = UIColor.black
            }
            if (indexPath.section == 0 && indexPath.row >= 1) {
                multTableCell.multResultLabel.text = "\(indexPath.row + 1)"
                multTableCell.backgroundColor = UIColor.white
                multTableCell.multResultLabel.textColor = UIColor.black
            }
            if (indexPath.section >= 1 && indexPath.row >= 1) {
                multTableCell.backgroundColor = self.mmBlueColor
                multTableCell.multResultLabel.textColor = UIColor.white
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.section >= 1 && indexPath.row >= 1) {
            self.currentlySelectedIndexPath = indexPath
            self.performSegue(withIdentifier: "showAnswerSubmitDialog", sender: self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var itemSize = CGSize()
        
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            itemSize = CGSize()
            return itemSize
        }
        
        let widthForOneItem = flowLayout.itemSize.width
        let heightForOneItem = widthForOneItem
        itemSize = CGSize(width: CGFloat(widthForOneItem), height: heightForOneItem)
        
        return itemSize
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? MMAnswerSubmitDialogViewController, let selectedIndexPath = self.currentlySelectedIndexPath {
            destinationVC.selectedIndexPath = selectedIndexPath
            destinationVC.parentVC = self
        }
    }
    
    override func dismissAndUpdateCellWithAnswer(answer: Int, for path: IndexPath) {
        self.dismiss(animated: true) {
            if let answerCell = self.multTableCollectionView.cellForItem(at: path) as? MMMultTableCollectionViewCell {
                answerCell.multResultLabel.text = "\(answer)"
                self.updateVisualizationForCurrentAnswers()
            }
        }
    }
    
    override func dismissAnswerDialog() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func updateVisualizationForCurrentAnswers() {
        self.rightAnswers = 0
        self.wrongAnswers = 0
        for section in 1..<self.multTableCollectionView.numberOfSections {
            for currItemIdx in 1..<self.multTableCollectionView.numberOfItems(inSection: section) {
                let currIndexPath = IndexPath(item: currItemIdx, section: section)
                if let currCell = self.multTableCollectionView.cellForItem(at: currIndexPath) as? MMMultTableCollectionViewCell, let answerText = currCell.multResultLabel.text {
                    
                    let answer = Int(answerText)
                    var isCorrect = false
                    if (answer == nil) {
                        currCell.backgroundColor = self.mmBlueColor
                    }
                    if (answer == (currItemIdx + 1) * (section + 10)) {
                        self.rightAnswers += 1
                        currCell.backgroundColor = self.mmGreenColor
                        isCorrect = true
                    }
                    if (answer != nil && isCorrect != true) {
                        self.wrongAnswers += 1
                        currCell.backgroundColor = self.mmRedColor
                    }
                }
            }
        }
    }
    
}
