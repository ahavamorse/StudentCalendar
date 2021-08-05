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
    
}
