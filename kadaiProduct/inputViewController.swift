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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textArray = saveData.object(forKey: "text")as! [String]
    }
    
    @IBAction func save(){
        textArray.append(textField.text!)
        saveData.set(textArray, forKey: "text")
        dismiss(animated: true, completion: nil)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
