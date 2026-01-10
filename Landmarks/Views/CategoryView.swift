//
//  CategoryView.swift
//  Landmarks
//

import SwiftUI

struct CategoryView: View {
    let category: Category
    var landmarks: [Landmark] = Landmark.sampleData

    var body: some View {
        List(filteredLandmarks) { landmark in
            NavigationLink(screen: .landmarks(.detail(landmark))) {
                LandmarkRow(landmark: landmark)
            }
        }
        .navigationTitle(category.rawValue)
        .toolbar(.hidden, for: .tabBar)
    }

    private var filteredLandmarks: [Landmark] {
        landmarks.filter { $0.category == category }
    }
}

#Preview {
    NavigationStack {
        CategoryView(category: .mountains)
    }
}
