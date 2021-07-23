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

}
