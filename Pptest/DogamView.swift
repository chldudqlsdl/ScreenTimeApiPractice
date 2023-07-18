//
//  DogamView.swift
//  Pptest
//
//  Created by Youngbin Choi on 2023/07/18.
//

import SwiftUI
import FamilyControls
import DeviceActivity

extension DeviceActivityReport.Context {
    static let dogamActivity = Self("Dogam Activity")
}

struct DogamView: View {
    @State private var context: DeviceActivityReport.Context = .dogamActivity
    
    var body: some View {
        DeviceActivityReport(context)
    }
}

struct DogamView_Previews: PreviewProvider {
    static var previews: some View {
        DogamView()
    }
}
