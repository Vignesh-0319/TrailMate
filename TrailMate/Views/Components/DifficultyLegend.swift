//
//  DifficultyLegend.swift
//  TrailMate
//
//  Created by SUPER CHARGE on 25/09/26.
//

import SwiftUI

struct DifficultyLegend: View {
    let formatter = TrailFormatter()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Difficulty")
                .font(.headline)
            ForEach(Difficulty.allCases, id: \.self) { level in
                HStack(spacing: 8) {
                    Image(systemName: formatter.difficultySymbol(for: level))
                        .frame(width: 24)
                    Text(formatter.difficultyTitle(for: level))
                }
            }
        }
        .padding()
        .frame(minWidth: 220)
    }
}

#Preview {
    DifficultyLegend()
}
