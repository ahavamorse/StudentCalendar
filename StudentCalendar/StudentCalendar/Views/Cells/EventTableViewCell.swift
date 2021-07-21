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
    let subjectColorImageView = UIImageView()
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(event: Event) {
        subjectColorImageView.image = UIImage(systemName: "circle.fill")?.withTintColor(UIColor(named: event.subject.color.rawValue)!)
        titleLabel.text = event.title
    }
    
    private func configure() {
        addSubview(subjectColorImageView)
        addSubview(titleLabel)
        accessoryType = .disclosureIndicator
        let padding: CGFloat = 12 // customize
        
        NSLayoutConstraint.activate([
            subjectColorImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            subjectColorImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            subjectColorImageView.heightAnchor.constraint(equalToConstant: 60), // customize
            subjectColorImageView.widthAnchor.constraint(equalToConstant: 60), // customize
            
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: subjectColorImageView.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 40) // customize
        ])
    }
}
