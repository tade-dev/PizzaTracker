//
//  PizzaTrackerWidgetBundle.swift
//  PizzaTrackerWidget
//
//  Created by BSTAR on 23/05/2026.
//

import WidgetKit
import SwiftUI

@main
struct PizzaTrackerWidgetBundle: WidgetBundle {
    var body: some Widget {
        PizzaTrackerWidget()
        PizzaTrackerWidgetControl()
        PizzaTrackerWidgetLiveActivity()
    }
}
