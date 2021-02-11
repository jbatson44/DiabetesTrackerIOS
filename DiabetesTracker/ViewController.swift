//
//  ViewController.swift
//  DiabetesTracker
//
//  Created by User on 2/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var addDataButton: UIButton!
    @IBOutlet weak var chosenDateLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet weak var dataInput: UITextField!
    @IBOutlet weak var timeInput: UILabel!
    var date: Date!
    
    @IBOutlet weak var txtDatePicker: UITextField!
      let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataInput.keyboardType = UIKeyboardType.numberPad
        inputLabel.text = "Blood Sugar"
        
        date = Date()
        updateDateText()
        
        setTimeFormat()
        segmentedControl.addTarget(self, action:
                        #selector(ViewController.dataTypeChanged(sender:)), for: .valueChanged)
        
        showDatePicker()
        
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
    
    func setTimeFormat() {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"

        let timeString = formatter.string(from: date)
        timeInput.text = timeString
        
    }
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .time

        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

        txtDatePicker.inputAccessoryView = toolbar
        txtDatePicker.inputView = datePicker

    }

     @objc func donedatePicker(){

      let formatter = DateFormatter()
      formatter.dateFormat = "h:mm a"
      txtDatePicker.text = formatter.string(from: datePicker.date)
      self.view.endEditing(true)
    }

    @objc func cancelDatePicker(){
       self.view.endEditing(true)
     }}

