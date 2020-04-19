//
//  DatabaseHelper.swift
//  DemoCore
//
//  Created by JOHN DARK on 19/04/20.
//  Copyright © 2020 Joynal. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class DatabaseHelper {
    
   static var shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    func save(object: [String:String]) {
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        student.name = object["name"]
        student.address = object["address"]
        student.city = object["city"]
        student.mobile = object["mobile"]
        
        do {
            try context?.save()
        }catch{
            print("data is not save")
        }
    }
    
    func getStudentData() -> [Student] {
        var student = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do {
            student = try context?.fetch(fetchRequest) as! [Student]
        }catch{
            print("can not get data")
        }
        return student
    }
}
