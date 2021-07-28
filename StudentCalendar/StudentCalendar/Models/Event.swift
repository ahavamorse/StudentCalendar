//
//  Event.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/21/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import Foundation

protocol Event {
    var title: String { get set }
    var date: Date { get set }
    var subject: Subject { get set }
    var dayString: String { get }
    var timeString: String { get }
    var eventType: EventType { get set }
}
