//
//  ViewController.swift
//  kadaiProduct
//
//  Created by あーきち on 2020/02/17.
//  Copyright © 2020 あーきち. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate, UITableViewDelegate{

    @IBOutlet var table: UITableView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var textArray:[String] = []
    
    var recieveVable :Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        table.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if saveData.object(forKey: "text") != nil{
            textArray = saveData.object(forKey: "text") as! [String]
        }
        
        table.reloadData()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = textArray[indexPath.row]
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        return true
    }

    //削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            textArray.remove(at: indexPath.row)
            table.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }
        saveData.set(textArray, forKey: "text")
    }
    
    //セルタップ時
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)が選択されました")
        //値わたし
        recieveVable = indexPath.row
        //画面遷移
        performSegue(withIdentifier: "toNextViewController", sender: nil)
        //セル選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
      }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "toNextViewController" {
            let nextVC: inputViewController = (segue.destination as? inputViewController)!
            nextVC.recieveVable = recieveVable
        }
    }

}

