//
//  AssignmentTableViewCell.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/23/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class AssignmentTableViewCell: UITableViewCell {
    
    static let reuseID = "AssignmentTableViewCell"
    
    let subjectColorImageView = SubjectIndicatorImageView()
    let titleLabel = TitleLabel(font: .preferredFont(forTextStyle: .title1))
    let dueDateLabel = SecondaryTitleLabel(font: .preferredFont(forTextStyle: .title2))
    lazy var checkboxButton = CheckboxButton(target: self, action: #selector(changeCheckbox))
    
    var assignment: Assignment?
    weak var delegate: AssignmentsViewController?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(assignment: Assignment) {
        self.assignment = assignment
        subjectColorImageView.set(color: assignment.subject.color)
        
        titleLabel.text = "\(assignment.subject.title):  \(assignment.title)"
        dueDateLabel.text = "Due Date:  \(assignment.dayString)"
        
        if assignment.status == .completed {
            checkboxButton.check()
        } else {
            checkboxButton.uncheck()
        }
    }
    
    @objc private func changeCheckbox() {
        if assignment?.status == .completed {
            assignment?.status = .notStarted
            checkboxButton.uncheck()
        } else {
            assignment?.status = .completed
            checkboxButton.check()
        }
        delegate?.assignmentController.changeStatus(assignment!)
        delegate?.updateUI()
    }
    
    private func configure() {
        addSubviews(subjectColorImageView, titleLabel, dueDateLabel)
        contentView.addSubview(checkboxButton)
        
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            subjectColorImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            subjectColorImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            subjectColorImageView.heightAnchor.constraint(equalToConstant: 20),
            subjectColorImageView.widthAnchor.constraint(equalToConstant: 20),
            
            checkboxButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkboxButton.heightAnchor.constraint(equalToConstant: 40),
            checkboxButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            checkboxButton.widthAnchor.constraint(equalToConstant: 40),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20 + (2 * padding)),
            titleLabel.trailingAnchor.constraint(equalTo: checkboxButton.leadingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            dueDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding / 2),
            dueDateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dueDateLabel.trailingAnchor.constraint(equalTo: checkboxButton.leadingAnchor, constant: -padding),
            dueDateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding)
        ])
    }
}
