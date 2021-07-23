//
//  TaskTableViewCell.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/23/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    static let reuseID = "TaskTableViewCell"
    let subjectColorImageView = UIImageView()
    let titleLabel = TitleLabel(font: .preferredFont(forTextStyle: .title1))
    let dueDateLabel = SecondaryTitleLabel(font: .preferredFont(forTextStyle: .title2))
    let checkBoxButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubviews(subjectColorImageView, titleLabel, dueDateLabel, checkBoxButton)
        subjectColorImageView.translatesAutoresizingMaskIntoConstraints = false
        checkBoxButton.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            subjectColorImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            subjectColorImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            subjectColorImageView.heightAnchor.constraint(equalToConstant: 20),
            subjectColorImageView.widthAnchor.constraint(equalToConstant: 20),
            
            checkBoxButton.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            checkBoxButton.heightAnchor.constraint(equalToConstant: 40),
            checkBoxButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            checkBoxButton.widthAnchor.constraint(equalToConstant: 40),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: subjectColorImageView.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: checkBoxButton.leadingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            dueDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            dueDateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dueDateLabel.trailingAnchor.constraint(equalTo: checkBoxButton.leadingAnchor, constant: -padding),
            dueDateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding)
        ])
    }
}
