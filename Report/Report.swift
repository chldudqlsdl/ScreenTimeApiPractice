//
//  Report.swift
//  Report
//
//  Created by Youngbin Choi on 2023/07/12.
//

import DeviceActivity
import SwiftUI

@main
struct Report: DeviceActivityReportExtension {
    var body: some DeviceActivityReportScene {
        // Create a report for each DeviceActivityReport.Context that your app supports.
        TotalActivityReport { totalActivity in
            TotalActivityView(totalActivity: totalActivity)
        }
        // Add more reports here...
        DogamReport { totalActivity in
            DogamView(totalActivity: totalActivity)
        }
    }
}
