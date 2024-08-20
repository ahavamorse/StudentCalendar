//
//  SubjectIndicatorImageView.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/26/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class SubjectIndicatorImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    private func configure() {
        image = UIImage(systemName: "circle.fill")
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(color: UIColor) {
        tintColor = color
    }
}
