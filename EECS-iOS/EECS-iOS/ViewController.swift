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

    //MARK: properties
    
    @IBOutlet weak var deptList: UIPickerView!
    var deptData: [String] = [String]()


    @IBOutlet weak var classList: UIPickerView!
    var classData: [String] = [String]()
 
    
    @IBOutlet weak var gradeList: UIPickerView!
    var gradeData: [String] = [String]()
    
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
        let fileURLProject = Bundle.main.path(forResource: "dept", ofType: "txt")
        var deptText = ""
        do {
            deptText = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
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
        return gradeData[row]
    }
    
    
    
    
    
    //MARK: actions
    
    
    
    
    
    
    
    
    
    


}

