//
//  TrailFormatter.swift
//  TrailMate
//
//  Created by SUPER CHARGE on 25/09/26.
//

import Foundation

struct TrailFormatter {
    func difficultyTitle(for difficulty: Difficulty) -> String {
        switch difficulty {
        case .easy:
            return "Easy"
        case .moderate:
            return "Moderate"
        case .hard:
            return "Hard"
        }
    }
    
    func difficultySymbol(for difficulty: Difficulty) -> String {
        switch difficulty {
        case .easy:
            return "figure.walk"
        case .moderate:
            return "figure.hiking"
        case .hard:
            return "mountain.2.fill"
        }
    }
    
    func regionTitle(for region: Region) -> String {
        switch region {
        case .north:
            return "North India"
        case .west:
            return "West India"
        case .south:
            return "South India"
        case .east:
            return "East India"
        }
    }
    
    func regionAdvice(for region: Region) -> String {
        switch region {
        case .north:
            return "Best from March to June."
        case .west:
            return "Best just after the monsoon."
        case .south:
            return "Pleasant all year round."
        case .east:
            return "Carry rain gear in summer."
        }
    }
    
    func sortTitle(for option: SortOption) -> String {
        switch option {
        case .name:
            return "Name (A-Z)"
        case .distance:
            return "Distance (shortest first)"
        }
    }
}
