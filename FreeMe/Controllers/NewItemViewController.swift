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
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var arrayOfCategories: [NSDictionary] = []
    
    var list: List?
    
    var selectedCategory: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        let dict1 = NSMutableDictionary()
        dict1["categoryNum"] = NSNumber(integer: 1)
        dict1["imageFilename"] = "beverage"
        arrayOfCategories.append(dict1)
        
        let dict2 = NSMutableDictionary()
        dict2["categoryNum"] = NSNumber(integer: 2)
        dict2["imageFilename"] = "bakery"
        arrayOfCategories.append(dict2)
        
        let dict3 = NSMutableDictionary()
        dict3["categoryNum"] = NSNumber(integer: 3)
        dict3["imageFilename"] = "cannedgoods"
        arrayOfCategories.append(dict3)
        
        let dict4 = NSMutableDictionary()
        dict4["categoryNum"] = NSNumber(integer: 4)
        dict4["imageFilename"] = "dairy"
        arrayOfCategories.append(dict4)
        
        let dict5 = NSMutableDictionary()
        dict5["categoryNum"] = NSNumber(integer: 5)
        dict5["imageFilename"] = "bakinggoods"
        arrayOfCategories.append(dict5)
        
        let dict6 = NSMutableDictionary()
        dict6["categoryNum"] = NSNumber(integer: 6)
        dict6["imageFilename"] = "frozenfood"
        arrayOfCategories.append(dict6)
        
        let dict7 = NSMutableDictionary()
        dict7["categoryNum"] = NSNumber(integer: 7)
        dict7["imageFilename"] = "meat"
        arrayOfCategories.append(dict7)
        
        let dict8 = NSMutableDictionary()
        dict8["categoryNum"] = NSNumber(integer: 8)
        dict8["imageFilename"] = "produce"
        arrayOfCategories.append(dict8)
        
        let dict9 = NSMutableDictionary()
        dict9["categoryNum"] = NSNumber(integer: 9)
        dict9["imageFilename"] = "cleaning"
        arrayOfCategories.append(dict9)
        
        let dict10 = NSMutableDictionary()
        dict10["categoryNum"] = NSNumber(integer: 10)
        dict10["imageFilename"] = "papergoods"
        arrayOfCategories.append(dict10)
        
        let dict11 = NSMutableDictionary()
        dict11["categoryNum"] = NSNumber(integer: 11)
        dict11["imageFilename"] = "personalcare"
        arrayOfCategories.append(dict11)
        
        let dict12 = NSMutableDictionary()
        dict12["categoryNum"] = NSNumber(integer: 12)
        dict12["imageFilename"] = "babycare"
        arrayOfCategories.append(dict12)
        
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
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        selectedCategory = indexPath.item + 1
    }
    
    @IBAction func saveAction() {
        
        //save to array
        
//        let newItem = Item(name: nameTextField.text!, itemState: false, itemCategory: Category(rawValue: selectedCategory)!, quantity: Int(quantityTextField.text!)!)
        
        let newItem = Item(name: nameTextField.text!, itemState: false, itemCategory: Category(rawValue: selectedCategory)!, count: Int())
        
        list?.arrayOfItems.append(newItem)
        
        //go back to previous screen
        
        self.navigationController?.popViewControllerAnimated(true)
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
