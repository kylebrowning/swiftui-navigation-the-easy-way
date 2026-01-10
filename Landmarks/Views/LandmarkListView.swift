//
//  LandmarkListView.swift
//  Landmarks
//

import SwiftUI

struct LandmarkListView: View {
    let landmarks: [Landmark]

    var body: some View {
        List {
            // Featured Section
            if !featuredLandmarks.isEmpty {
                Section("Featured") {
                    ForEach(featuredLandmarks) { landmark in
                        NavigationLink(screen: .landmarks(.detail(landmark))) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }

            // Categories Section
            Section("Categories") {
                ForEach(Category.allCases) { category in
                    NavigationLink(screen: .landmarks(.category(category))) {
                        Label(category.rawValue, systemImage: category.systemImage)
                    }
                }
            }

            // All Landmarks Section
            Section("All Landmarks") {
                ForEach(landmarks) { landmark in
                    NavigationLink(screen: .landmarks(.detail(landmark))) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .navigationTitle("Landmarks")
    }

    private var featuredLandmarks: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
}

#Preview {
    NavigationStack {
        LandmarkListView(landmarks: Landmark.sampleData)
    }
}
