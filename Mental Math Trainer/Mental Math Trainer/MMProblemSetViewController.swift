//
//  MMProblemSetViewController.swift
//  Mental Math Trainer
//
//  Created by Fabricio Machado on 5/28/17.
//  Copyright © 2017 Fabricio Machado. All rights reserved.
//

import UIKit

class MMProblemSetViewController: MMBaseProblemViewController,SLTWSingleLineWidgetDelegate {
    @IBOutlet weak var problemLabel: UILabel!
    @IBOutlet weak var solutionField: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var handwrittenTextField: SLTWSingleLineWidget!
    var isMSCertRegistered: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addDoneButtonOnKeyboard()
        self.addDashedBorderToHandwritingField()
        if self.isMSCertRegistered == false {
            let cert = NSData(bytes: myCertificate.bytes, length: myCertificate.length)
            self.isMSCertRegistered = self.handwrittenTextField.registerCertificate(cert as Data!)
            let registrationLogMsg = self.isMSCertRegistered ? "ATK registered" : "ATK not registered"
            print(registrationLogMsg)
        }

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateProblemLabels()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let bundle = Bundle.main
        if let path = bundle.path(forResource: "resources", ofType: "bundle") as String? {
            var bundlePathURL = URL(fileURLWithPath: path)
            bundlePathURL = bundlePathURL.appendingPathComponent("conf")
            self.handwrittenTextField.addSearchDir(bundlePathURL.path)
            self.handwrittenTextField.configure(withBundle: "en_US", andConfig: "cur_text")
            self.handwrittenTextField.delegate = self
            self.handwrittenTextField.inkColor = UIColor.black
            self.handwrittenTextField.autoScrollEnabled = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tipSheetVC = segue.destination as? MMTipSheetViewController,
            let tipSheetText = self.currentProblem?.tipSheetText {
            tipSheetVC.tipSheetText = tipSheetText
        }
    }
    
    @IBAction func checkYourAnswer(_ sender: UIButton) {
        self.doneButtonAction()
        
        let correctAnswer = Int((self.currentProblem?.solution)!)
        
        if let typedAnswer = self.solutionField.text, let typedAnswerInt = Int(typedAnswer), typedAnswerInt == correctAnswer {
            self.answerLabel.text = "Correct! Answer is \(correctAnswer)."
            self.answerLabel.textColor = UIColor.blue
        } else {
            self.answerLabel.text = "Incorrect! Answer is \(correctAnswer)."
            self.answerLabel.textColor = UIColor.red
        }
        
        self.answerLabel.alpha = 1
    }
    
    @IBAction func moveToNextProblem(_ sender: UIButton) {
        self.doneButtonAction()
        self.solutionField.text = ""
        self.answerLabel.text = ""
        self.answerLabel.alpha  = 0
        if let parentVC = self.parent as? MMProblemContainerViewController {
            parentVC.generateNextProblemAndRefresh()
        }
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(MMProblemSetViewController.doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.solutionField.inputAccessoryView = doneToolbar
    }
    
    func doneButtonAction() {
        self.solutionField.resignFirstResponder()
    }
    
    func updateProblemLabels() {
        self.problemLabel.text = self.currentProblem?.expressionText
    }
    
    func addDashedBorderToHandwritingField() {
        var dashedBorder = CAShapeLayer()
        dashedBorder.strokeColor = UIColor.black.cgColor
        dashedBorder.lineWidth = 3
        dashedBorder.lineDashPattern = [4, 4]
        dashedBorder.frame = self.handwrittenTextField.bounds
        dashedBorder.fillColor = nil
        dashedBorder.path = UIBezierPath(roundedRect: self.handwrittenTextField.bounds, cornerRadius: 8.0).cgPath
        self.handwrittenTextField.layer.addSublayer(dashedBorder)
    }
    
    @IBAction func clearAnswer(_ sender: UIButton) {
        self.solutionField.text = ""
        self.handwrittenTextField.clear()
    }
    
    // MARK: SLTWSingleLineWidgetDelegate
    // - (void)singleLineWidget:(SLTWSingleLineWidget *)sender didChangeText:(NSString*)text intermediate:(BOOL)intermediate {
    
    func singleLineWidget(_ sender: SLTWSingleLineWidget!, didChangeText text: String!, intermediate: Bool) {
        print("Widget did change text: \(text)")
        self.solutionField.text = text
//        self.handwrittenTextField.clear()
    }
    
    // - (void)singleLineWidget:(SLTWSingleLineWidget *)sender didDetectSingleTapAtIndex:(int)index {
    func singleLineWidget(_ sender: SLTWSingleLineWidget!, didDetectSingleTapAt index: Int32) {
        print("Widget did detect single tap")
    }
    
    // - (void)singleLineWidget:(SLTWSingleLineWidget *)sender didDetectLongPressAtIndex:(int)index {
    func singleLineWidget(_ sender: SLTWSingleLineWidget!, didDetectLongPressAt index: Int32) {
        print("Widget did detect long press")
    }
    
    // - (void)singleLineWidget:(SLTWSingleLineWidget *)sender didDetectOverwriteStart:(int)start end:(int)end {
    func singleLineWidget(_ sender: SLTWSingleLineWidget!, didDetectOverwriteStart start: Int32, end: Int32) {
        print("Widget did detect overwrite start")
    }

    // - (void)singleLineWidget:(SLTWSingleLineWidget *)sender didDetectReturnGestureAtIndex:(int)index {
    func singleLineWidget(_ sender: SLTWSingleLineWidget!, didDetectReturnGestureAt index: Int32) {
        print("Widget did detect return gesture")
    }
    
    // - (void)singleLineWidget:(SLTWSingleLineWidget *)sender didDetectEraseGestureStart:(int)start end:(int)end {
    func singleLineWidget(_ sender: SLTWSingleLineWidget!, didDetectEraseGestureStart start: Int32, end: Int32) {
        print("Widget did detect erase gesture")
    }
    
    // - (void)singleLineWidget:(SLTWSingleLineWidget *)sender didDetectSelectGestureStart:(int)start end:(int)end {
    func singleLineWidget(_ sender: SLTWSingleLineWidget!, didDetectSelectGestureStart start: Int32, end: Int32) {
        print("Widget did detect select gesture")
    }
    
    // - (void)singleLineWidget:(SLTWSingleLineWidget *)sender didDetectUnderlineGestureStart:(int)start end:(int)end {
    func singleLineWidget(_ sender: SLTWSingleLineWidget!, didDetectUnderlineGestureStart start: Int32, end: Int32) {
        print("Widget did detect underline geseture")
    }
    
    // - (void)singleLineWidget:(SLTWSingleLineWidget *)sender didDetectJoinGestureStart:(int)start end:(int)end {
    func singleLineWidget(_ sender: SLTWSingleLineWidget!, didDetectJoinGestureStart start: Int32, end: Int32) {
        print("Widget did detect join gesture")
    }
    
    // - (void)singleLineWidget:(SLTWSingleLineWidget *)sender didDetectInsertGestureAtIndex:(int)index {
    func singleLineWidget(_ sender: SLTWSingleLineWidget!, didDetectInsertGestureAt index: Int32) {
        print("Widget did detect insert gesture")
    }
    
    // - (void)singleLineWidgetPenDown:(SLTWSingleLineWidget *)sender didCaptureInfo:(IMCaptureInfo *)captureInfo {
    func singleLineWidgetPenDown(_ sender: SLTWSingleLineWidget!, didCaptureInfo captureInfo: IMCaptureInfo!) {
        print("Widget did detect pen down")
    }
    
    // - (void)singleLineWidgetPenUp:(SLTWSingleLineWidget *)sender didCaptureInfo:(IMCaptureInfo *)captureInfo {
    func singleLineWidgetPenUp(_ sender: SLTWSingleLineWidget!, didCaptureInfo captureInfo: IMCaptureInfo!) {
        print("Widget did detect pen up")
    }
    
    // - (void)singleLineWidgetPenMove:(SLTWSingleLineWidget  *)sender didCaptureInfo:(IMCaptureInfo *)captureInfo {
    func singleLineWidgetPenMove(_ sender: SLTWSingleLineWidget!, didCaptureInfo captureInfo: IMCaptureInfo!) {
        print("Widget did detect pen move")
    }
    
    // - (void)singleLineWidgetPenAbort:(SLTWSingleLineWidget  *)sender {
    func singleLineWidgetPenAbort(_ sender: SLTWSingleLineWidget!) {
        print("Widget did detect pen abort")
    }
    
    // - (void)singleLineWidget:(SLTWSingleLineWidget *)sender didConfigureWithSuccess:(BOOL)success {
    func singleLineWidget(_ sender: SLTWSingleLineWidget!, didConfigureWithSuccess success: Bool) {
        print("Widget did configure successfully")
    }

    // - (void)singleLineWidgetUserScrollBegin:(SLTWSingleLineWidget*)sender {
    func singleLineWidgetUserScrollBegin(_ sender: SLTWSingleLineWidget!) {
        print("Widget scrolling started")
    }
    
    // - (void)singleLineWidgetUserScrollEnd:(SLTWSingleLineWidget*)sender {
    func singleLineWidgetUserScrollEnd(_ sender: SLTWSingleLineWidget!) {
        print("Widget scrolling ended")
    }
    
    // - (void)singleLineWidgetUserScroll:(SLTWSingleLineWidget*)sender {
    func singleLineWidgetUserScroll(_ sender: SLTWSingleLineWidget!) {
        print("Widget scrolling event occured")
    }
    

    
}
