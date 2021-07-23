//
//  CheckboxButton.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/23/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class CheckboxButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(target: Any, action: Selector) {
        self.init(frame: .zero)
        self.addTarget(target, action: action, for: .touchUpInside)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func check() {
        setImage(CheckboxImage.checked, for: .normal)
    }
    
    func uncheck() {
        setImage(CheckboxImage.unchecked, for: .normal)
    }
}
