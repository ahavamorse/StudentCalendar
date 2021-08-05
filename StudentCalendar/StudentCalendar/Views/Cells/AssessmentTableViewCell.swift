//
//  AssessmentTableViewCell.swift
//  StudentCalendar
//
//  Created by HapiDani on 8/5/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class AssessmentTableViewCell: UITableViewCell {

    static let reuseID = "AssessmentTableViewCell"
    
    let subjectColorImageView = SubjectIndicatorImageView()
    let titleLabel = TitleLabel(font: .preferredFont(forTextStyle: .title1))
    let dateLabel = SecondaryTitleLabel(font: .preferredFont(forTextStyle: .title2))
    
    var assessment: Assessment?
    weak var delegate: AssessmentsViewController?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubviews(subjectColorImageView, titleLabel, dateLabel)
        
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            subjectColorImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            subjectColorImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            subjectColorImageView.widthAnchor.constraint(equalToConstant: 20),
            subjectColorImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: subjectColorImageView.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding / 2),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
        ])
    }
}
