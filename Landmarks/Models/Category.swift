//
//  Category.swift
//  Landmarks
//

import Foundation

public enum Category: String, CaseIterable, Hashable, Identifiable, Codable {
    case mountains = "Mountains"
    case lakes = "Lakes"
    case bridges = "Bridges"

    public var id: String { rawValue }

    public var systemImage: String {
        switch self {
        case .mountains: return "mountain.2"
        case .lakes: return "water.waves"
        case .bridges: return "road.lanes"
        }
    }
}
