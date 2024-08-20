//
//  AddSubjectViewController.swift
//  StudentCalendar
//
//  Created by Ahava Morse on 8/20/24.
//  Copyright © 2024 ahavamorse. All rights reserved.
//

import UIKit

class AddSubjectViewController: UIViewController {
    
    let stackView = UIStackView()
    let titleLabel = TitleLabel(font: .preferredFont(forTextStyle: .title2))
    let titleTextField = UITextField()
    let colorLabel = TitleLabel(font: .preferredFont(forTextStyle: .title2))
    let colorPickerView = UIPickerView()
    
    var subjectController: SubjectController
    
    init(subjectController: SubjectController) {
        self.subjectController = subjectController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViewController()
        createTapGestureRecognizer()
        configureStackView()
        configureUIElements()
        layoutUI()
    }
    
    private func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "New Subject"
    }
    
    private func createTapGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(doneEnteringTitle))
        view.addGestureRecognizer(tap)
    }
    
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .center
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(titleTextField)
        stackView.addArrangedSubview(colorLabel)
        stackView.addArrangedSubview(colorPickerView)
    }
    
    private func configureUIElements() {
        titleLabel.text = "Title:"
        titleTextField.placeholder = "Enter title here"
        titleTextField.font = .preferredFont(forTextStyle: .title3)
        titleTextField.borderStyle = .roundedRect
        titleTextField.addTarget(self, action: #selector(doneEnteringTitle), for: .primaryActionTriggered)
        
        colorLabel.text = "Color:"
        colorPickerView.dataSource = self
        colorPickerView.delegate = self
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
            colorLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }
    
    @objc func doneEnteringTitle() {
        titleTextField.resignFirstResponder()
    }
    
    @objc func doneButtonTapped() {
        if let title = titleTextField.text, !title.isEmpty {
            let colorIndex = colorPickerView.selectedRow(inComponent: 0)
            let colors = SubjectColor.colors.sorted { $0.key < $1.key }
            subjectController.add([Subject(title: title, colorName: colors[colorIndex].key)])
            navigationController?.popViewController(animated: true)
        } else {
            let alert = UIAlertController(title: "Missing Title", message: "Please enter a title before trying to save.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
            present(alert, animated: true)
        }
    }
}

extension AddSubjectViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return SubjectColor.colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let colors = SubjectColor.colors.sorted { $0.key < $1.key }
        let color = colors[row]
        
        let view = view as? SubjectColorView ?? SubjectColorView()
        view.set(colorName: color.key, color: color.value)
        return view
    }
}
