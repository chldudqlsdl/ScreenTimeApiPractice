//
//  DogamView.swift
//  Report
//
//  Created by Youngbin Choi on 2023/07/18.
//

import SwiftUI

struct DogamView: View {
    let totalActivity: String
    @State var selectedHour: Int = 4
    @State var selectedMinute: Int = 0
    var hours = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    var minutes = [0, 10, 20, 30, 40, 50]
    @State var name: String = ""
    
    var body: some View {

        VStack {
            Text("안녕하세요")
            Text(totalActivity)
            HStack {
                Picker("a", selection: $selectedHour) {
                    ForEach(hours, id: \.self) { hour in
                        Text("\(hour)")
                    }
                }
                .pickerStyle(.wheel)
                
                Picker("b", selection: $selectedMinute) {
                    ForEach(minutes, id: \.self) { minute in
                        Text("\(minute)")
                    }
                }
                .pickerStyle(.wheel)
            }
            Button {
                UserDefaults.standard.set(hours[hours.firstIndex(of: selectedHour)!], forKey: "settedHour")
                UserDefaults.standard.set(minutes[minutes.firstIndex(of: selectedMinute)!], forKey: "settedMinute")
            } label: {
                Rectangle()
                    .buttonStyle(.bordered)
                    .background(.blue)
            }

        }
        
    }
}

// In order to support previews for your extension's custom views, make sure its source files are
// members of your app's Xcode target as well as members of your extension's target. You can use
// Xcode's File Inspector to modify a file's Target Membership.
struct DogamView_Previews: PreviewProvider {
    static var previews: some View {
        TotalActivityView(totalActivity: "1h 23m")
    }
}
