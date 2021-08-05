//
//  SubjectTableViewCell.swift
//  StudentCalendar
//
//  Created by HapiDani on 8/5/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {
    
    static let reuseID = "SubjectTableViewCell"
    
    let subjectColorImageView = SubjectIndicatorImageView()
    let titleLabel = TitleLabel(font: .preferredFont(forTextStyle: .title1))
    
    func set(subject: Subject) {
        
    }
}
