//
//  ViewController.swift
//  Eeny
//
//  Created by Cory Avra on 10/1/16.
//  Copyright © 2016 Cory and Eileen. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate, UITextFieldDelegate {

    // Outlets
    @IBOutlet weak var optionCollectionView: UICollectionView!
    @IBOutlet weak var addOptionView: UIView!
    @IBOutlet weak var choiceTextField: UITextField!
    @IBOutlet weak var choiceLabel: UILabel!
   
    // Variables
    var optionsArray: [String] = []
    var colorsArray: [UIColor] = []
    var currentIndex: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        optionCollectionView.dataSource = self
        optionCollectionView.delegate = self
        choiceTextField.delegate = self

        addOptionView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        let dim = (collectionView.frame.width / 2) - 12
       
        return CGSize(width: dim, height: dim)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (optionsArray.count > 0) {
            return optionsArray.count + 1
        }
        else {
            return 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = optionCollectionView.dequeueReusableCell(withReuseIdentifier: "OptionCell", for: indexPath) as! OptionCollectionViewCell
        
        if (optionsArray.count > 0 && optionsArray.count != indexPath.row) {
            cell.inputLabel.text = optionsArray[indexPath.row]
            cell.backgroundColor = colorsArray[indexPath.row]
        }
        else {
            cell.backgroundColor = UIColor.gray
            cell.inputLabel.text = "Tap to add a choice!"
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        addOptionView.isHidden = false
        choiceLabel.text = "Choice \(indexPath[1]+1)"
        currentIndex = indexPath.row
        self.choiceTextField.becomeFirstResponder()
    }
    
    func dismissKeyboardOnTap(_ sender: UITapGestureRecognizer? = nil) {
        if (self.choiceTextField.text == "") {
            if(currentIndex == optionsArray.count){
                self.optionsArray.insert("Failure", at: currentIndex)
                self.colorsArray.insert(getRandomColor(), at: currentIndex)
            }
            else{
                self.optionsArray[currentIndex] = "Failure"
            }
        }
        else{
            if(currentIndex == optionsArray.count){
                self.optionsArray.insert(choiceTextField.text!, at: currentIndex)
                self.colorsArray.insert(getRandomColor(), at: currentIndex)
            }
            else{
                self.optionsArray[currentIndex] = choiceTextField.text!
            }
        }
        
        view.endEditing(true)
        addOptionView.isHidden = true
        choiceTextField.text = ""
        self.optionCollectionView.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboardOnTap()
        return false
    }
  
    func getRandomColor() -> UIColor{
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "resultSegue"){
            let viewController:ResultViewController = segue.destination as! ResultViewController
            
            if (optionsArray.count == 0){
                viewController.results = "Enter some values!"
            }
            else {
                let rand = Int(arc4random_uniform(UInt32(optionsArray.count)))
                viewController.results = optionsArray[rand]
                viewController.color = colorsArray[rand]
            }
        }
    }
}

