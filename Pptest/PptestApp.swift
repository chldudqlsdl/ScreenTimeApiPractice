//
//  PptestApp.swift
//  Pptest
//
//  Created by Youngbin Choi on 2023/07/12.
//

import SwiftUI
import FamilyControls
import DeviceActivity

@main
struct PptestApp: App {
    
    var body: some Scene {
        
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Text("스크린타임")
                    }
                DogView()
                    .tabItem {
                        Text("도감")
                    }
            }
        }
    }
}
