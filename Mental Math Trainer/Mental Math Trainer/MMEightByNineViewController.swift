//
//  MMEightByNineViewController.swift
//  Mental Math Trainer
//
//  Created by Fabricio Machado on 6/3/17.
//  Copyright © 2017 Fabricio Machado. All rights reserved.
//

import UIKit

class MMEightByNineViewController: MMBaseProblemViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var multTableCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellView =  UINib(nibName: "MMMultTableCollectionViewCell", bundle: nil)

        self.multTableCollectionView.register(cellView, forCellWithReuseIdentifier: "multTableCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func checkYourAnswer(_ sender: UIButton) {
    }

    @IBAction func moveToNextProblem(_ sender: UIButton) {
        if let parentVC = self.parent as? MMProblemContainerViewController {
            parentVC.generateNextProblemAndRefresh()
        }
    }
    
    @IBAction func showTipSheetForThisProblemSet(_ sender: UIButton) {
        if let parentVC = self.parent as? MMProblemContainerViewController, let tipText = self.currentProblem?.tipSheetText {
            parentVC.showTipSheet(tipVerbiage: tipText)
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
            if (indexPath.row == 0 && indexPath.section >= 1) {
                multTableCell.multResultLabel.text = "\(indexPath.section + 10)"
            }
            if (indexPath.section == 0 && indexPath.row >= 1) {
                multTableCell.multResultLabel.text = "\(indexPath.row + 1)"
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("FABRIZIO selected \(indexPath)")
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("FABRIZIO deselected \(indexPath)")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var itemSize = CGSize()

        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            itemSize = CGSize()
            return itemSize
        }
        
        // subtract section left/ right insets mentioned in xib view
        
        let widthAvailbleForAllItems =  (collectionView.frame.width /*- flowLayout.sectionInset.left - flowLayout.sectionInset.right*/)
        
        let widthForOneItem = flowLayout.itemSize.width //widthAvailbleForAllItems / 8 - flowLayout.minimumInteritemSpacing
        let heightForOneItem = widthForOneItem
        
        // here height is mentioned in xib file or storyboard
        itemSize = CGSize(width: CGFloat(widthForOneItem), height: (flowLayout.itemSize.height))
        print("FABRIZIO CELL SIZE \(itemSize)")
        return itemSize
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }   
}
