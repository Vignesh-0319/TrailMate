//
//  HomeScreen.swift
//  TrailMate
//
//  Created by SUPER CHARGE on 25/09/26.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(TrailStore.self) private var store
    @State private var path = NavigationPath()
    @State private var showAddSheet = false
    @State private var showSortSheet = false
    @State private var showClearAlert = false
    @State private var showLegend = false
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section {
                    ForEach(store.displayedTrails) { trail in
                        NavigationLink(value: trail) {
                            TrailRow(trail: trail)
                        }
                    }
                } header: {
                    Text("All Trails")
                } footer: {
                    Text(store.summaryText)
                }
                
                Section {
                    Text("Start early and carry at least two litres of water.")
                    Text("Tell someone your route before you leave.")
                    Text("Turn back if the light starts to fade.")
                } header: {
                    Text("Safety Basics")
                }
                
                Section {
                    NavigationLink {
                        AboutScreen()
                    } label: {
                        Text("About this app")
                    }
                } header: {
                    Text("More")
                }
            }
            .navigationTitle("TrailMate")
            .navigationDestination(for: Trail.self) { trail in
                TrailDetailScreen(trail: trail, path: $path)
            }
            .navigationDestination(for: Region.self) { region in
                RegionScreen(region: region, path: $path)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        store.favoritesOnly.toggle()
                    } label: {
                        Image(systemName: store.favoritesOnly ? "star.fill" : "star")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showLegend = true
                    } label: {
                        Image(systemName: "info.circle")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Clear") {
                        showClearAlert = true
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Text(store.summaryText)
                        .font(.caption)
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("Favourites only") {
                        store.favoritesOnly.toggle()
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("Surprise Me") {
                        if let trail = store.randomTrail() {
                            path.append(trail)
                        }
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("Sort") {
                        showSortSheet = true
                    }
                }
            }
            .toolbarBackground(.visible, for: .bottomBar)
            .sheet(isPresented: $showAddSheet) {
                AddTrailSheet()
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
            .sheet(isPresented: $showSortSheet) {
                SortSheet(store: store)
                    .presentationDetents([.height(260)])
            }
            .alert("Clear all favourites?", isPresented: $showClearAlert) {
                Button("Clear All", role: .destructive) {
                    store.clearFavorites()
                }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("\(store.favoriteCount) trails will lose their favourite star.")
            }
            .popover(isPresented: $showLegend) {
                DifficultyLegend()
                    .presentationCompactAdaptation(.popover)
            }
        }
    }
}

#Preview {
    HomeScreen()
        .environment(TrailStore())
}
