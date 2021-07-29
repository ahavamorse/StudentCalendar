//
//  ClassTableViewCell.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/29/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class ClassTableViewCell: UITableViewCell {

    static let reuseID = "ClassTableViewCell"
    let subjectColorImageView = SubjectIndicatorImageView()
    let titleLabel = TitleLabel(font: .preferredFont(forTextStyle: .title1))
    let dueDateLabel = SecondaryTitleLabel(font: .preferredFont(forTextStyle: .title2))
    lazy var checkboxButton = CheckboxButton(target: self, action: #selector(changeCheckbox))
    
    var cellClass: Class?
    weak var delegate: ClassesViewController?
}
