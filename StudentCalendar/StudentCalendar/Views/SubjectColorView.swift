//
//  SubjectColorView.swift
//  StudentCalendar
//
//  Created by Ahava Morse on 8/20/24.
//  Copyright © 2024 ahavamorse. All rights reserved.
//

import UIKit

class SubjectColorView: UIView {

    let subjectColorImageView = SubjectIndicatorImageView()
    let titleLabel = TitleLabel(font: .preferredFont(forTextStyle: .title1))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(colorName: String, color: UIColor) {
        subjectColorImageView.set(color: color)
        titleLabel.text = colorName
    }
    
    private func configure() {
        addSubviews(subjectColorImageView, titleLabel)
        
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            subjectColorImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            subjectColorImageView.heightAnchor.constraint(equalToConstant: 20),
            subjectColorImageView.widthAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: subjectColorImageView.trailingAnchor, constant: padding),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
