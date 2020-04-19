//
//  ViewController.swift
//  DemoCore
//
//  Created by JOHN DARK on 19/04/20.
//  Copyright © 2020 Joynal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var student = [Student]()
    
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textAddress: UITextField!
    @IBOutlet weak var textCity: UITextField!
    @IBOutlet weak var textPhone: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        student = DatabaseHelper.shareInstance.getStudentData()
    }

    @IBAction func saveAction(_ sender: Any) {
        let dict = ["name":textName.text,"address":textAddress.text,"city":textCity.text,"mobile":textPhone.text]
        
        DatabaseHelper.shareInstance.save(object: dict as! [String : String])
    }
    @IBAction func detailsAction(_ sender: Any) {
        for student in student{
            print("Name: \(String(describing: student.name!))" )
            print("Address: \(String(describing: student.address!))" )
            print("City: \(String(describing: student.city!))" )
            print("Mobile: \(String(describing: student.mobile!))" )
        }
//        print("Name: \(String(describing: student[0].name!))" )
//        print("Address: \(String(describing: student[0].address!))" )
//        print("City: \(String(describing: student[0].city!))" )
//        print("Mobile: \(String(describing: student[0].mobile!))" )
    }
    
}

