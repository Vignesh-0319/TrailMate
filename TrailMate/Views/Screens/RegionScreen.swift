//
//  RegionScreen.swift
//  TrailMate
//
//  Created by SUPER CHARGE on 25/09/26.
//

import SwiftUI

struct RegionScreen: View {
    let region: Region
    @Binding var path: NavigationPath
    @Environment(TrailStore.self) private var store
    let formatter = TrailFormatter()
    
    var body: some View {
        List {
            Section {
                if store.trails(in: region).isEmpty {
                    Text("No trails here yet.")
                        .foregroundStyle(.secondary)
                }
                ForEach(store.trails(in: region)) { trail in
                    NavigationLink(value: trail) {
                        TrailRow(trail: trail)
                    }
                }
            } header: {
                Text("Trails")
            } footer: {
                Text(formatter.regionAdvice(for: region))
            }
            
            Section {
                Text("You are \(path.count) screens deep.")
                Button("Back to Start") {
                    path = NavigationPath()
                }
            } header: {
                Text("Navigation")
            }
        }
        .navigationTitle(formatter.regionTitle(for: region))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    @Previewable @State var path = NavigationPath()
    return NavigationStack {
        RegionScreen(region: .north, path: $path)
    }
    .environment(TrailStore())
}
