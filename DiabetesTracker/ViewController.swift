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
    var date: Date!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputLabel.text = "Blood Sugar"
        date = Date()
        updateDateText()
        segmentedControl.addTarget(self, action:
                        #selector(ViewController.dataTypeChanged(sender:)), for: .valueChanged)
        
    }

    @IBAction func dataTypeChanged(sender: UISegmentedControl?) {
        print("lskdjaflsk")
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

}

