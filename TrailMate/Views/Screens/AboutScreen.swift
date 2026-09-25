//
//  AboutScreen.swift
//  TrailMate
//
//  Created by SUPER CHARGE on 25/09/26.
//

import SwiftUI

struct AboutScreen: View {
    var body: some View {
        List {
            Section {
                Text("TrailMate is a practice app for the iOS Student Developer Program.")
                Text("Trail data is sample data and is not for real navigation.")
            } header: {
                Text("About")
            }
        }
        .navigationTitle("About TrailMate")
    }
}

#Preview {
    NavigationStack {
        AboutScreen()
    }
}
