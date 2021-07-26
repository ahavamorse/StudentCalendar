//
//  AddEventViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/26/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController {
    
    let eventTypeSegmentedControl = UISegmentedControl(items: ["Assignment", "Class Period", "Assessment"])
    let titleTextField = UITextField()
    let subjectLabel = TitleLabel(font: .preferredFont(forTextStyle: .title2))
    let subjectPickerView = UIPickerView()
    let dateLabel = TitleLabel(font: .preferredFont(forTextStyle: .title2))
    let datePickerView = UIDatePicker()
    
    var eventType: EventType {
        get {
            if eventTypeSegmentedControl.tag == 0 {
                return .assignment
            } else if eventTypeSegmentedControl.tag == 1 {
                return .classPeriod
            } else {
                return .assessment
            }
        }
    }
    
    var subjects: [Subject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViewController()
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        
        view.addSubviews(/*eventTypeSegmentedControl), */titleTextField)/*, subjectLabel, subjectPickerView, dateLabel, datePickerView)*/
        
        eventTypeSegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        
        titleTextField.placeholder = "Title"
        titleTextField.font = .preferredFont(forTextStyle: .title3)
        subjectLabel.text = "Subject:"
        subjectPickerView.dataSource = self
        dateLabel.text = "Date:" // can change
        datePickerView.datePickerMode = .dateAndTime
    }
    
    @objc func segmentedControlValueChanged() {
        // todo
    }
}

extension AddEventViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return subjects.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return subjects[row].title
    }
}
