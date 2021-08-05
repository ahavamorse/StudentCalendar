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
    let titleLabel = TitleLabel(font: .preferredFont(forTextStyle: .title2))
    let titleTextField = UITextField()
    let subjectLabel = TitleLabel(font: .preferredFont(forTextStyle: .title2))
    let subjectPickerView = UIPickerView()
    let dateLabel = TitleLabel(font: .preferredFont(forTextStyle: .title2))
    let datePickerView = UIDatePicker()
    
    weak var delegate: EventsViewControllerProtocol?
    var subjects: [Subject] = []
    var eventType: EventType
    var titleString: String
    
    init(title: String, dateLabelText: String = "Date:", type: EventType) {
        self.titleString = title
        self.dateLabel.text = dateLabelText
        self.eventType = type
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViewController()
        createTabGestureRecognizer()
        configureStackView()
        configureUIElements()
        configureStackView()
        layoutUI()
    }
    
    private func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        title = titleString
    }
    
    private func createTabGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(doneEnteringTitle))
        view.addGestureRecognizer(tap)
    }
    
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .center
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(titleTextField)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(datePickerView)
        stackView.addArrangedSubview(subjectLabel)
        stackView.addArrangedSubview(subjectPickerView)
    }
    
    private func configureUIElements() {
        titleLabel.text = "Title:"
        titleTextField.placeholder = "Enter title here"
        titleTextField.font = .preferredFont(forTextStyle: .title3)
        titleTextField.borderStyle = .roundedRect
        titleTextField.addTarget(self, action: #selector(doneEnteringTitle), for: .primaryActionTriggered)
        
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
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            
            titleLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            titleTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            dateLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            subjectLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }
    
    @objc func doneEnteringTitle() {
        titleTextField.resignFirstResponder()
    }
    
    @objc func doneButtonTapped() {
        if let title = titleTextField.text, !title.isEmpty {
            if eventType == .assignment {
                if let delegate = self.delegate as? AssignmentsViewController {
                    
                    delegate.assignmentController.add([Assignment(title: title, subject: subjects[subjectPickerView.selectedRow(inComponent: 0)], status: .notStarted, date: datePickerView.date)])
                }
            } else if eventType == .classPeriod {
                if let delegate = self.delegate as? ClassesViewController {
                    delegate.classController.add([Class(title: title, subject: subjects[subjectPickerView.selectedRow(inComponent: 0)], date: datePickerView.date)])
                }
            } else {
//                if let delegate = self.delegate as? AssessmentsViewController {
//                    delegate.assessmentController.add([Assessment(title: title, subject: subjects[subjectPickerView.selectedRow(inComponent: 0)], date: datePickerView.date)])
//                }
            }
            navigationController?.popViewController(animated: true)
        } else {
            let alert = UIAlertController(title: "Missing Title", message: "Please enter a title before trying to save.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
            present(alert, animated: true)
        }
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
