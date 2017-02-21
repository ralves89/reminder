//
//  ScanViewController.swift
//  Reminder
//
//  Created by Renee Alves on 20/02/17.
//  Copyright © 2017 Renee Alves. All rights reserved.
//

import UIKit
import RSBarcodes

class ScanViewController: RSCodeReaderViewController {
    
    @IBOutlet var toggle: UIButton!

    
    var barcode: String = ""
    var dispatched: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: NOTE: Uncomment the following line to enable crazy mode
        // self.isCrazyMode = true
        
        self.focusMarkLayer.strokeColor = UIColor.red.cgColor
        
        self.cornersLayer.strokeColor = UIColor.yellow.cgColor
        
        self.tapHandler = { point in
            print(point)
        }
        
        // MARK: NOTE: If you want to detect specific barcode types, you should update the types
        let types = NSMutableArray(array: self.output.availableMetadataObjectTypes)
        // MARK: NOTE: Uncomment the following line remove QRCode scanning capability
        // types.removeObject(AVMetadataObjectTypeQRCode)
        self.output.metadataObjectTypes = NSArray(array: types) as [AnyObject]
        
        // MARK: NOTE: If you layout views in storyboard, you should these 3 lines
        for subview in self.view.subviews {
            self.view.bringSubview(toFront: subview)
        }
        
        self.toggle.isEnabled = self.hasTorch()
        
        self.barcodesHandler = { barcodes in
            if !self.dispatched { // triggers for only once
                self.dispatched = true
                for barcode in barcodes {
                    self.barcode = barcode.stringValue
                    print("Barcode found: type=" + barcode.type + " value=" + barcode.stringValue)
                    
                    let isValid = RSUnifiedCodeValidator.shared.isValid(barcode.stringValue, machineReadableCodeObjectType: AVMetadataObjectTypeEAN13Code)
                    
//                    DispatchQueue.main.async(execute: {
//                        self.performSegue(withIdentifier: "nextView", sender: self)
//                        
//                        // MARK: NOTE: Perform UI related actions here.
//                    })
                    
                    // MARK: NOTE: break here to only handle the first barcode object
                    break
                }
            }
        }
    }
    
    
}
