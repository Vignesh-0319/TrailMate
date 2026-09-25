//
//  TrailDetailScreen.swift
//  TrailMate
//
//  Created by SUPER CHARGE on 25/09/26.
//

import SwiftUI

struct TrailDetailScreen: View {
    let trail: Trail
    @Binding var path: NavigationPath
    @Environment(TrailStore.self) private var store
    @State private var showNoteSheet = false
    @State private var showRemoveAlert = false
    
    var body: some View {
        List {
            Section {
                DetailRow(label: "Region", value: trail.regionTitle)
                DetailRow(label: "Difficulty", value: trail.difficultyTitle)
                DetailRow(label: "Distance", value: trail.distanceText)
            } header: {
                Text("Trail Details")
            }
            
            Section {
                Button {
                    store.toggleFavorite(trail)
                } label: {
                    Text(store.isFavorite(trail) ? "Remove from favourites" : "Add to favourites")
                }
                Button("Write a note") {
                    showNoteSheet = true
                }
            } header: {
                Text("Actions")
            }
            
            Section {
                Button("Show all in \(trail.regionTitle)") {
                    path.append(trail.region)
                }
                Button("Go back one screen") {
                    if !path.isEmpty {
                        path.removeLast()
                    }
                }
                Button("Back to Start") {
                    path = NavigationPath()
                }
            } header: {
                Text("Navigation")
            } footer: {
                Text("You are \(path.count) screens deep.")
            }
            
            Section {
                Button("Remove this trail", role: .destructive) {
                    showRemoveAlert = true
                }
            } header: {
                Text("Danger Zone")
            }
        }
        .navigationTitle(trail.name)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showNoteSheet) {
            NoteSheet(trailName: trail.name)
                .presentationDetents([.fraction(0.3), .large])
        }
        .alert("Remove \(trail.name)?", isPresented: $showRemoveAlert) {
            Button("Remove", role: .destructive) {
                store.removeTrail(trail)
                path.removeLast()
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("This trail will be deleted from your list. You cannot undo this.")
        }
    }
}

#Preview {
    @Previewable @State var path = NavigationPath()
    return NavigationStack {
        TrailDetailScreen(trail: TrailStore().trails[0], path: $path)
    }
    .environment(TrailStore())
}
