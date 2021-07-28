//
//  AddEventViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/26/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController {
    
    let stackView = UIStackView()
    let eventTypeSegmentedControl = UISegmentedControl(items: ["Assignment", "Class Period", "Assessment"])
    let titleLabel = TitleLabel(font: .preferredFont(forTextStyle: .title2))
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
        configureViewController()
        configureStackView()
        configureUIElements()
        layoutUI()
        configureStackView()
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .center
        
        stackView.addArrangedSubview(eventTypeSegmentedControl)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(titleTextField)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(datePickerView)
        stackView.addArrangedSubview(subjectLabel)
        stackView.addArrangedSubview(subjectPickerView)
    }
    
    private func configureUIElements() {
        eventTypeSegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        
        titleLabel.text = "Title:"
        titleTextField.placeholder = "Enter title here"
        titleTextField.font = .preferredFont(forTextStyle: .title3)
        titleTextField.borderStyle = .roundedRect
        
        dateLabel.text = "Date:" // can change
        datePickerView.datePickerMode = .dateAndTime
        
        subjectLabel.text = "Subject:"
        subjectPickerView.dataSource = self
        subjectPickerView.delegate = self
    }
    
    private func layoutUI() {
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 15),
            
            titleLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            titleTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            dateLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            subjectLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }
    
    @objc func segmentedControlValueChanged() {
        // todo
    }
}

extension AddEventViewController: UIPickerViewDataSource, UIPickerViewDelegate {
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
