//
//  ViewController.swift
//  DiabetesTracker
//
//  Created by User on 2/10/21.
//

import UIKit
import SQLite

class ViewController: UIViewController {

    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var addDataButton: UIButton!
    @IBOutlet weak var chosenDateLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet weak var dataInput: UITextField!
    var date: Date!
    
    @IBOutlet weak var txtDatePicker: UITextField!
      let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataInput.keyboardType = UIKeyboardType.numberPad
        addDoneButtonOnKeyboard()
        inputLabel.text = "Blood Sugar"
        
        date = Date()
        updateDateText()
        
        segmentedControl.addTarget(self, action:
                        #selector(ViewController.dataTypeChanged(sender:)), for: .valueChanged)
        
        showDatePicker()
    }
    
    @IBAction func addData(sender: UIButton?) {
        
        let value = dataInput.text
        let creationTime = String(txtDatePicker.text!)
        print(value)
        print(creationTime)
        if segmentedControl.selectedSegmentIndex == 0 {
            
        }
        else if segmentedControl.selectedSegmentIndex == 1 {
            
        }
        else if segmentedControl.selectedSegmentIndex == 2 {
            
        }
        
    }

    @IBAction func dataTypeChanged(sender: UISegmentedControl?) {
        
        if sender?.selectedSegmentIndex == 0 {
            inputLabel.text = "Blood Sugar:"
            addDataButton.setTitle("Add Blood Sugar", for: .normal)
        }
        else if sender?.selectedSegmentIndex == 1 {
            inputLabel.text = "Insulin:"
            addDataButton.setTitle("Add Insulin", for: .normal)
            
        }
        else if sender?.selectedSegmentIndex == 2 {
            inputLabel.text = "Carbs:"
            addDataButton.setTitle("Add Carbs", for: .normal)
            
        }
        
    }
    
    @IBAction func incrementDate(sender: UIButton) {
        let modifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: date)!
        date = modifiedDate
        updateDateText()
    }
    
    @IBAction func decrementDate(sender: UIButton) {
        let modifiedDate = Calendar.current.date(byAdding: .day, value: -1, to: date)!
        date = modifiedDate
        updateDateText()
    }
    
    func updateDateText() {
        let formatter = DateFormatter()
        formatter.dateFormat = "M/d/yy"

        let dateString = formatter.string(from: date)
        chosenDateLabel.text = dateString
        
    }
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)

        txtDatePicker.inputAccessoryView = toolbar
        txtDatePicker.inputView = datePicker

    }

    @objc func doneDatePicker(){

      let formatter = DateFormatter()
      formatter.dateFormat = "h:mm a"
      txtDatePicker.text = formatter.string(from: datePicker.date)
      self.view.endEditing(true)
    }

    @objc func cancelDatePicker(){
       self.view.endEditing(true)
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        dataInput.inputAccessoryView = doneToolbar
        
    }
      
    @objc func doneButtonAction()
    {
        dataInput.resignFirstResponder()
    }
}

