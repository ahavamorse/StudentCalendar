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
        
        view.addSubviews(eventTypeSegmentedControl, titleTextField, subjectLabel, subjectPickerView, dateLabel, datePickerView)
        
        eventTypeSegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        
        titleTextField.placeholder = "Title"
        titleTextField.font = .preferredFont(forTextStyle: .title3)
        subjectLabel.text = "Subject:"
        subjectPickerView.dataSource = self
        dateLabel.text = "Date:" // can change
        datePickerView.datePickerMode = .dateAndTime
        
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            eventTypeSegmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            eventTypeSegmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            eventTypeSegmentedControl.widthAnchor.constraint(equalToConstant: 50),
            
            titleTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            titleTextField.heightAnchor.constraint(equalToConstant: 22),
            
            subjectLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: padding),
            subjectLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            subjectLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            subjectLabel.heightAnchor.constraint(equalToConstant: 25),
            
            subjectPickerView.topAnchor.constraint(equalTo: subjectLabel.bottomAnchor, constant: padding),
            subjectPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            subjectPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            dateLabel.topAnchor.constraint(equalTo: subjectPickerView.bottomAnchor, constant: padding),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 25),
            
            datePickerView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: padding),
            datePickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            datePickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
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
