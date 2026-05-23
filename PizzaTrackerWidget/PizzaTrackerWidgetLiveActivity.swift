//
//  PizzaTrackerWidgetLiveActivity.swift
//  PizzaTrackerWidget
//
//  Created by BSTAR on 23/05/2026.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct PizzaTrackerWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct PizzaTrackerWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PizzaTrackerWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension PizzaTrackerWidgetAttributes {
    fileprivate static var preview: PizzaTrackerWidgetAttributes {
        PizzaTrackerWidgetAttributes(name: "World")
    }
}

extension PizzaTrackerWidgetAttributes.ContentState {
    fileprivate static var smiley: PizzaTrackerWidgetAttributes.ContentState {
        PizzaTrackerWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: PizzaTrackerWidgetAttributes.ContentState {
         PizzaTrackerWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: PizzaTrackerWidgetAttributes.preview) {
   PizzaTrackerWidgetLiveActivity()
} contentStates: {
    PizzaTrackerWidgetAttributes.ContentState.smiley
    PizzaTrackerWidgetAttributes.ContentState.starEyes
}
