//
//  TrailStore.swift
//  TrailMate
//
//  Created by SUPER CHARGE on 25/09/26.
//

import Foundation
import Observation

@Observable
final class TrailStore {
    var trails: [Trail] = [
        Trail(name: "Triund Ridge", region: .north, difficulty: .moderate, distanceKm: 9.0, isFavorite: true),
        Trail(name: "Kheerganga Trek", region: .north, difficulty: .hard, distanceKm: 12.0),
        Trail(name: "Nandi Hills Loop", region: .south, difficulty: .easy, distanceKm: 4.5),
        Trail(name: "Kumara Parvatha", region: .south, difficulty: .hard, distanceKm: 22.0),
        Trail(name: "Rajmachi Trail", region: .west, difficulty: .moderate, distanceKm: 15.0),
        Trail(name: "Sinhagad Steps", region: .west, difficulty: .easy, distanceKm: 3.0)
    ]
    
    var favoritesOnly: Bool = false
    var sortOption: SortOption = .name
    
    var totalTrails: Int {
        trails.count
    }
    
    var favoriteCount: Int {
        trails.filter { $0.isFavorite }.count
    }
    
    var summaryText: String {
        "\(totalTrails) trails · \(favoriteCount) favourites"
    }
    
    var displayedTrails: [Trail] {
        var result = trails
        if favoritesOnly {
            result = result.filter { $0.isFavorite }
        }
        switch sortOption {
        case .name:
            return result.sorted { $0.name < $1.name }
        case .distance:
            return result.sorted { $0.distanceKm < $1.distanceKm }
        }
    }
    
    func isFavorite(_ trail: Trail) -> Bool {
        if let index = trails.firstIndex(where: { $0.id == trail.id }) {
            return trails[index].isFavorite
        }
        return false
    }
    
    func toggleFavorite(_ trail: Trail) {
        if let index = trails.firstIndex(where: { $0.id == trail.id }) {
            trails[index].isFavorite.toggle()
        }
    }
    
    func removeTrail(_ trail: Trail) {
        if let index = trails.firstIndex(where: { $0.id == trail.id }) {
            trails.remove(at: index)
        }
    }
    
    func clearFavorites() {
        for index in trails.indices {
            trails[index].isFavorite = false
        }
    }
    
    func trails(in region: Region) -> [Trail] {
        return trails.filter { $0.region == region }
    }
    
    func randomTrail() -> Trail? {
        return trails.randomElement()
    }
    
    func addTrail(name: String, region: Region, difficulty: Difficulty, distanceKm: Double) {
        let trimmedName = name.trimmingCharacters(in: .whitespaces)
        if trimmedName.isEmpty {
            return
        }
        trails.append(
            Trail(name: trimmedName,
                  region: region,
                  difficulty: difficulty,
                  distanceKm: distanceKm)
        )
    }
}
