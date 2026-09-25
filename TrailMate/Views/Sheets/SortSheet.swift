//
//  SortSheet.swift
//  TrailMate
//
//  Created by SUPER CHARGE on 25/09/26.
//

import SwiftUI

struct SortSheet: View {
    @Bindable var store: TrailStore
    @Environment(\.dismiss) private var dismiss
    let formatter = TrailFormatter()
    
    var body: some View {
        List {
            Section {
                Picker("Sort by", selection: $store.sortOption) {
                    ForEach(SortOption.allCases, id: \.self) { option in
                        Text(formatter.sortTitle(for: option)).tag(option)
                    }
                }
                .pickerStyle(.inline)
                
                Button("Done") {
                    dismiss()
                }
            } header: {
                Text("Sort Trails")
            }
        }
    }
}

#Preview {
    SortSheet(store: TrailStore())
}
