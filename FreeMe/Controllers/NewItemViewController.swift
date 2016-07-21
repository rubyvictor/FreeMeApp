//
//  NewItemViewController.swift
//  FreeMe
//
//  Created by Victor Lee on 14/7/16.
//  Copyright © 2016 VictorLee. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var listNameLabel: UILabel!
    
    var arrayOfCategories: [NSDictionary] = []
    
    var list: List?
    
    var selectedCategory: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameTextField.attributedPlaceholder = NSAttributedString(string:"item name",
                                                               attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        listNameLabel.text = list?.title
        
        let dict1 = NSMutableDictionary()
        dict1["categoryNum"] = NSNumber(integer: 1)
        dict1["categoryName"] = "Beverages"
        dict1["imageUrl"] = "https://"
        dict1["imageFilename"] = "beverage"
        dict1["highlightedImageFilename"] = "highlightedBeverage"
        arrayOfCategories.append(dict1)
        
        let dict2 = NSMutableDictionary()
        dict2["categoryNum"] = NSNumber(integer: 2)
        dict2["categoryName"] = "Grains"
        dict2["imageFilename"] = "grains"
        arrayOfCategories.append(dict2)
        
        let dict3 = NSMutableDictionary()
        dict3["categoryNum"] = NSNumber(integer: 3)
        dict3["categoryName"] = "Vegetables"
        dict3["imageFilename"] = "vegetables"
        arrayOfCategories.append(dict3)
        
        let dict4 = NSMutableDictionary()
        dict4["categoryNum"] = NSNumber(integer: 4)
        dict4["categoryName"] = "CannedFood"
        dict4["imageFilename"] = "cannedfood"
        arrayOfCategories.append(dict4)
        
        let dict5 = NSMutableDictionary()
        dict5["categoryNum"] = NSNumber(integer: 5)
        dict5["categoryName"] = "Dairy"
        dict5["imageFilename"] = "dairy"
        arrayOfCategories.append(dict5)
        
        let dict6 = NSMutableDictionary()
        dict6["categoryNum"] = NSNumber(integer: 6)
        dict6["categoryName"] = "Baking"
        dict6["imageFilename"] = "baking"
        arrayOfCategories.append(dict6)
        
        let dict7 = NSMutableDictionary()
        dict7["categoryNum"] = NSNumber(integer: 7)
        dict7["categoryName"] = "FrozenFood"
        dict7["imageFilename"] = "frozenfood"
        arrayOfCategories.append(dict7)
        
        let dict8 = NSMutableDictionary()
        dict8["categoryNum"] = NSNumber(integer: 8)
        dict8["categoryName"] = "Meat"
        dict8["imageFilename"] = "meat"
        arrayOfCategories.append(dict8)
        
        let dict9 = NSMutableDictionary()
        dict9["categoryNum"] = NSNumber(integer: 9)
        dict9["categoryName"] = "Fruits"
        dict9["imageFilename"] = "fruits"
        arrayOfCategories.append(dict9)
        
        let dict10 = NSMutableDictionary()
        dict10["categoryNum"] = NSNumber(integer: 10)
        dict10["categoryName"] = "Toiletries"
        dict10["imageFilename"] = "toiletries"
        arrayOfCategories.append(dict10)
        
        let dict11 = NSMutableDictionary()
        dict11["categoryNum"] = NSNumber(integer: 11)
        dict11["categoryName"] = "Seafood"
        dict11["imageFilename"] = "seafood"
        arrayOfCategories.append(dict11)
        
        let dict12 = NSMutableDictionary()
        dict12["categoryNum"] = NSNumber(integer: 12)
        dict12["categoryName"] = "DryFoods"
        dict12["imageFilename"] = "dryfoods"
        arrayOfCategories.append(dict12)
        
        let dict13 = NSMutableDictionary()
        dict13["categoryNum"] = NSNumber(integer: 13)
        dict13["categoryName"] = "Cleaning"
        dict13["imageFilename"] = "cleaning"
        arrayOfCategories.append(dict13)
        
        let dict14 = NSMutableDictionary()
        dict14["categoryNum"] = NSNumber(integer: 14)
        dict14["categoryName"] = "BabyCare"
        dict14["imageFilename"] = "babycare"
        arrayOfCategories.append(dict14)
        
        let dict15 = NSMutableDictionary()
        dict15["categoryNum"] = NSNumber(integer: 15)
        dict15["categoryName"] = "Auto"
        dict15["imageFilename"] = "auto"
        arrayOfCategories.append(dict15)
        
        let dict16 = NSMutableDictionary()
        dict16["categoryNum"] = NSNumber(integer: 16)
        dict16["categoryName"] = "Pets"
        dict16["imageFilename"] = "pets"
        arrayOfCategories.append(dict16)
        
        categoryCollectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }

    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrayOfCategories.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("categoryIdentifier", forIndexPath: indexPath) as! CategoryCVCell
        
        let category = arrayOfCategories[indexPath.item]
        
        let imageName = category["imageFilename"] as! String
        
        cell.imageView.image = UIImage(named: imageName)
//        cell.imageView.highlightedImage = UIImage(named: "highlightedBeverage")
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        selectedCategory = indexPath.item + 1
        
    }
    

    @IBAction func saveAction() {
        //Check for item name text field whether blank
        if isTextFieldBlank(nameTextField) || selectedCategory == nil {
            errorLabel.text = "Enter item name and click category"
            errorLabel.textColor = UIColor(red: 90.0/255.0, green: 200.0/255.0, blue: 250.0/255.0, alpha: 1)
        return
        }
        
    
        //save to array
        
        let newItem = Item(name: nameTextField.text!, itemState: false, itemCategory: Category(rawValue: selectedCategory)!, count: Int())
        
        list?.arrayOfItems.append(newItem)
        
        //go back to previous screen
        
        self.navigationController?.popViewControllerAnimated(true)
    }

    //add new function to validate newItem input here
    func isTextFieldBlank(textField: UITextField) -> Bool {
        
        let text = textField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        if text == "" {
            
            return true
        }
        
        return false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
