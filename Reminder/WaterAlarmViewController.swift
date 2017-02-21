//
//  WaterAlarmViewController.swift
//  Reminder
//
//  Created by Renee Alves on 20/02/17.
//  Copyright © 2017 Renee Alves. All rights reserved.
//

import UIKit

class WaterAlarmViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        fireAlarm()
    }
    
    func fireAlarm () {
        
        if #available(iOS 10.0, *) {
            Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { (timer) in
                
                let alertController = UIAlertController(title: "Lembrete", message: "Você precisa beber água", preferredStyle: UIAlertControllerStyle.alert)
                
                let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
                
                alertController.addAction(actionOk)
                
                self.present(alertController, animated: true, completion: nil)
                
                
            }
        } else {
            // Fallback on earlier versions
        }
    }
}
