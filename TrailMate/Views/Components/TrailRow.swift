//
//  TrailRow.swift
//  TrailMate
//
//  Created by SUPER CHARGE on 25/09/26.
//

import SwiftUI

struct TrailRow: View {
    let trail: Trail
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: trail.difficultySymbol)
                .frame(width: 28)
            VStack(alignment: .leading, spacing: 2) {
                Text(trail.name)
                    .font(.headline)
                Text(trail.regionTitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text(trail.distanceText)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    TrailRow(trail: Trail(name: "Triund Ridge",
                          region: .north,
                          difficulty: .moderate,
                          distanceKm: 9.0))
        .padding()
}
