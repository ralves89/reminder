//
//  ViewController.swift
//  Reminder
//
//  Created by Renee Alves on 20/02/17.
//  Copyright © 2017 Renee Alves. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var tasks: [String] = []
    
    let waterSegue = "waterSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTasksArray()
        
        self.tableView.separatorColor = UIColor.clear
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func loadTasksArray () {
        
        self.tasks = ["Beber água", "Pagar conta", "Tomar remédio"]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = ""
        var imageName = ""
        
        if indexPath.row == 0 {
            
            cellIdentifier = "waterCell"
            imageName = "water"
            
        } else if indexPath.row == 1 {
            
            cellIdentifier = "paymentCell"
            imageName = "barcode-scan"
            
        } else {
            
            cellIdentifier = "medicineCell"
            imageName = "pill"
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: "Arial", size: 20)
        cell.textLabel?.text = self.tasks[indexPath.row]
        cell.imageView?.image = UIImage(named: imageName)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell != nil {
            
            if cell?.textLabel?.text == "Beber água" {
                
                //self.performSegue(withIdentifier: self.waterSegue, sender: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == self.waterSegue {
            
            
        }
    }

}

