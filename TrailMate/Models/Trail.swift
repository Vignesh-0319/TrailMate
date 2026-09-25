//
//  Trail.swift
//  TrailMate
//
//  Created by SUPER CHARGE on 25/09/26.
//

import Foundation

struct Trail: Identifiable, Hashable {
    let id: UUID = UUID()
    var name: String
    var region: Region
    var difficulty: Difficulty
    var distanceKm: Double
    var isFavorite: Bool = false
    
    var difficultyTitle: String {
        let formatter = TrailFormatter()
        return formatter.difficultyTitle(for: difficulty)
    }
    
    var difficultySymbol: String {
        let formatter = TrailFormatter()
        return formatter.difficultySymbol(for: difficulty)
    }
    
    var regionTitle: String {
        let formatter = TrailFormatter()
        return formatter.regionTitle(for: region)
    }
    
    var distanceText: String {
        return String(format: "%.1f km", distanceKm)
    }
}
