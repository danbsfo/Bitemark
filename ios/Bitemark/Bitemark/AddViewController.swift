//
//  AddViewController.swift
//  Bitemark
//
//  Created by Dan on 2/22/19.
//  Copyright © 2019 Bitemark. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func finishAddingBitemark() {
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        let bitemark = NSEntityDescription.insertNewObject(forEntityName: "Bitemark", into: delegate.persistentContainer.viewContext) as! BitemarkMO
        bitemark.name = "Dan"
        bitemark.price = 2.50
        bitemark.lat = 0.0
        bitemark.lon = 0.0
        
        delegate.saveContext()
    }

}
