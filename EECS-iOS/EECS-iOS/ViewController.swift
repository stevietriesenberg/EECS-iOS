//
//  ViewController.swift
//  EECS-iOS
//
//  Created by Stevie Triesenberg on 12/21/17.
//  Copyright © 2017 University of Michigan. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var deptList: UIPickerView!
    var deptData: [String] = [String]()
    var dept = ""


    @IBOutlet weak var classList: UIPickerView!
    var classData: [String] = [String]()
    var code = ""
 
    
    @IBOutlet weak var gradeList: UIPickerView!
    var gradeData: [String] = [String]()
    var grade = ""
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // input grade data
        
        self.gradeList.delegate = self
        self.gradeList.dataSource = self
        self.deptList.delegate = self
        self.deptList.dataSource = self
        self.classList.delegate = self
        self.classList.dataSource = self
        
        // gradeData
        gradeData = ["A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D+", "D", "D-", "E", "PASS"]
        
        // open dept listing file, add to deptData
        let fileURLDept = Bundle.main.path(forResource: "dept", ofType: "txt")
        var deptText = ""
        do {
            deptText = try String(contentsOfFile: fileURLDept!, encoding: String.Encoding.utf8)
        }
        catch {
            print("dept file error")
        }
        deptData = deptText.components(separatedBy: "\n")
        // classData is set according to deptList choice
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // number of columns for grades
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // number of rows of data
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == gradeList) {
            return gradeData.count
        }
        if (pickerView == deptList) {
            return deptData.count
        }
        if (pickerView == classList) {
            return classData.count
        }
        // if (pickerView = classList)
        return 1
    }
    
    // returns the right component
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == gradeList) {
            return gradeData[row]
        }
        if (pickerView == deptList) {
            return deptData[row]
        }
        if (pickerView == classList) {
            if (classData.count > 0) {
                return classData[row]
            }
        }
        return gradeData[row]
    }
    
    
    // Catpure the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == deptList) {
            // get selected class code
            let selected = deptData[row]
            classData.removeAll()
            
            // open corresopnding file
            let fileURLClass = Bundle.main.path(forResource: selected, ofType: "txt")
            var deptText = ""
            
            // get contents
            do {
                deptText = try String(contentsOfFile: fileURLClass!, encoding: String.Encoding.utf8)
            }
            catch {
                print("class file error")
            }
            
            // split contents
            let classRawData = deptText.components(separatedBy: "\n")
            
            for object in classRawData {
                if (object != "") {
                    let rawArr = object.characters.split(separator: " ").map(String.init)
                    classData.append(rawArr[0]);
                }
            }
            
            // update deptList values
            self.classList.dataSource = self;
            self.classList.delegate = self;
            
            // set department for "add class" button
            dept = selected
        } // if (deptList)
        if (pickerView == classList) {
            code = classData[row]
        } // if (classList)
        if (pickerView == gradeList) {
            grade = gradeData[row]
        } // if (gradeList)
    } // pickerview()
    
    

}

