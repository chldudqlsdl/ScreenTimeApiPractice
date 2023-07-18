//
//  DogamView.swift
//  Report
//
//  Created by Youngbin Choi on 2023/07/18.
//

import SwiftUI

struct DogamView: View {
    let totalActivity: String
    
    var body: some View {
        Text("저는 도감뷰 입니다")
        Text(totalActivity)
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
