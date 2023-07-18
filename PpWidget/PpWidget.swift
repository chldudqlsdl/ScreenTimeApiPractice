//
//  PpWidget.swift
//  PpWidget
//
//  Created by Youngbin Choi on 2023/07/17.
//

import WidgetKit
import SwiftUI
import FamilyControls
import DeviceActivity

extension DeviceActivityReport.Context {
    static let pieChart = Self("Total Activity")
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct PpWidgetEntryView : View {
    @State private var context: DeviceActivityReport.Context = .pieChart
   
    
    var entry: Provider.Entry

    var body: some View {
        Text(Date(), style: .timer)
    }
}

struct PpWidget: Widget {
    let kind: String = "PpWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            PpWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct PpWidget_Previews: PreviewProvider {
    static var previews: some View {
        PpWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
