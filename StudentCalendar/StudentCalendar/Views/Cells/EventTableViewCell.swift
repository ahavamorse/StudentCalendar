//
//  EventTableViewCell.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/21/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    static let reuseID = "EventTableViewCell"
    
    let subjectColorImageView = SubjectIndicatorImageView()
    let titleLabel = TitleLabel(font: .preferredFont(forTextStyle: .title1))
    let timeLabel = SecondaryTitleLabel(textAlignment: .right, font: .preferredFont(forTextStyle: .title2))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(event: Event) {
        subjectColorImageView.set(color: event.subject.color)
        titleLabel.text = event.title
        timeLabel.text = event.timeString
    }
    
    private func configure() {
        addSubviews(subjectColorImageView, titleLabel, timeLabel)
        
//        accessoryType = .disclosureIndicator
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            subjectColorImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            subjectColorImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            subjectColorImageView.heightAnchor.constraint(equalToConstant: 20),
            subjectColorImageView.widthAnchor.constraint(equalToConstant: 20),
            
            timeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30 - padding), // for with disclosure indicator
            timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            timeLabel.heightAnchor.constraint(equalToConstant: 40),
            
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: subjectColorImageView.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: timeLabel.leadingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
