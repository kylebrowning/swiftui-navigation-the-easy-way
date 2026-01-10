//
//  Landmark.swift
//  Landmarks
//

import Foundation

public struct Landmark: Identifiable, Hashable, Codable {
    public let id: UUID
    public let name: String
    public let location: String
    public let description: String
    public let imageName: String
    public let isFeatured: Bool
    public let category: Category

    init(
        id: UUID = UUID(),
        name: String,
        location: String,
        description: String,
        imageName: String,
        isFeatured: Bool = false,
        category: Category
    ) {
        self.id = id
        self.name = name
        self.location = location
        self.description = description
        self.imageName = imageName
        self.isFeatured = isFeatured
        self.category = category
    }
}

extension Landmark {
    static let sampleData: [Landmark] = [
        Landmark(
            name: "Golden Gate Bridge",
            location: "San Francisco, CA",
            description: "An iconic suspension bridge spanning the Golden Gate strait. The bridge's signature International Orange color was chosen to complement its natural surroundings and enhance visibility in fog.",
            imageName: "bridge",
            isFeatured: true,
            category: .bridges
        ),
        Landmark(
            name: "Yosemite Valley",
            location: "Yosemite National Park, CA",
            description: "A glacial valley known for its granite cliffs, waterfalls, and giant sequoia groves. El Capitan and Half Dome are among its most famous formations.",
            imageName: "mountain",
            isFeatured: true,
            category: .mountains
        ),
        Landmark(
            name: "Lake Tahoe",
            location: "Sierra Nevada, CA/NV",
            description: "A large freshwater lake in the Sierra Nevada mountains, known for its clarity, blue color, and surrounding ski resorts and beaches.",
            imageName: "lake",
            isFeatured: false,
            category: .lakes
        ),
        Landmark(
            name: "Brooklyn Bridge",
            location: "New York, NY",
            description: "A hybrid cable-stayed/suspension bridge connecting Manhattan and Brooklyn. Completed in 1883, it was the first steel-wire suspension bridge.",
            imageName: "bridge",
            isFeatured: false,
            category: .bridges
        ),
        Landmark(
            name: "Mount Rainier",
            location: "Washington",
            description: "An active stratovolcano and the most glaciated peak in the contiguous United States. It stands as an icon of the Pacific Northwest.",
            imageName: "mountain",
            isFeatured: true,
            category: .mountains
        ),
        Landmark(
            name: "Crater Lake",
            location: "Oregon",
            description: "The deepest lake in the United States, formed by the collapse of volcano Mount Mazama. Known for its deep blue color and water clarity.",
            imageName: "lake",
            isFeatured: false,
            category: .lakes
        )
    ]
}
