//
//  ContentView.swift
//  Pptest
//
//  Created by Youngbin Choi on 2023/07/12.
//

import SwiftUI
import FamilyControls
import DeviceActivity

extension DeviceActivityReport.Context {
    static let totalActivity = Self("Total Activity")
}

struct ContentView: View {
    let center = AuthorizationCenter.shared
    @State private var context: DeviceActivityReport.Context = .totalActivity
    
    var body: some View {
        VStack {
            Text("오늘의 스크린타임")
                .fontWeight(.heavy )
                .font(.custom("DOSSaemmul", size: 18))
            DeviceActivityReport(context)
//                .frame(width: 100, height: 100, alignment: .center)
        }
        .padding()
        .onAppear {
            Task {
                do {
                    try await center.requestAuthorization(for: .individual)
                } catch {
                    print("Failed to enroll Aniyah with error: \(error)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
