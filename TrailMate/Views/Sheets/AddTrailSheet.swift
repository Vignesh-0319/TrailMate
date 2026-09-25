//
//  AddTrailSheet.swift
//  TrailMate
//
//  Created by SUPER CHARGE on 25/09/26.
//

import SwiftUI

struct AddTrailSheet: View {
    @Environment(TrailStore.self) private var store
    @Environment(\.dismiss) private var dismiss
    
    @State private var name = ""
    @State private var region: Region = .north
    @State private var difficulty: Difficulty = .easy
    @State private var distance = 5
    let formatter = TrailFormatter()
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Trail name", text: $name)
                    Picker("Region", selection: $region) {
                        ForEach(Region.allCases, id: \.self) { option in
                            Text(formatter.regionTitle(for: option)).tag(option)
                        }
                    }
                    Picker("Difficulty", selection: $difficulty) {
                        ForEach(Difficulty.allCases, id: \.self) { option in
                            Text(formatter.difficultyTitle(for: option)).tag(option)
                        }
                    }
                    Picker("Distance", selection: $distance) {
                        ForEach(1...30, id: \.self) { km in
                            Text("\(km) km").tag(km)
                        }
                    }
                } header: {
                    Text("New Trail")
                }
            }
            .navigationTitle("Add a Trail")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        store.addTrail(name: name,
                                       region: region,
                                       difficulty: difficulty,
                                       distanceKm: Double(distance))
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddTrailSheet()
        .environment(TrailStore())
}
