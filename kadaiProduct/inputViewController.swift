//
//  inputViewController.swift
//  kadaiProduct
//
//  Created by あーきち on 2020/02/17.
//  Copyright © 2020 あーきち. All rights reserved.
//

import UIKit

class inputViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textField: UITextField!
    
    var textArray:[String] = []
    
    var saveData: UserDefaults = UserDefaults.standard

    var recieveVable : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textArray = saveData.object(forKey: "text")as! [String]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if recieveVable != nil {
            textArray = saveData.object(forKey: "text") as! [String]
            textField.text = textArray[recieveVable!]
            //nilじゃない時＝タップした時
        }
        
    }
    
    @IBAction func save(){
        
        if recieveVable != nil{
            //編集した時
            textArray[recieveVable!] = textField.text!
        }else{
            //新規追加した時
            textArray.append(textField.text!)
        }
        
        saveData.set(textArray, forKey: "text")
        dismiss(animated: true, completion: nil)
        
    }

    //閉じるやつ
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}
