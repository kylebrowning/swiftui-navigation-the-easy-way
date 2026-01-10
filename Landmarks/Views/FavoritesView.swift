//
//  FavoritesView.swift
//  Landmarks
//

import SwiftUI

struct FavoritesView: View {
    @Binding var favorites: Set<UUID>
    let landmarks: [Landmark]

    var body: some View {
        Group {
            if favoriteLandmarks.isEmpty {
                ContentUnavailableView(
                    "No Favorites",
                    systemImage: "heart.slash",
                    description: Text("Landmarks you favorite will appear here.")
                )
            } else {
                List(favoriteLandmarks) { landmark in
                    NavigationLink(screen: .favorites(.detail(landmark))) {
                        LandmarkRow(landmark: landmark)
                    }
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            favorites.remove(landmark.id)
                        } label: {
                            Label("Remove", systemImage: "heart.slash")
                        }
                    }
                }
            }
        }
        .navigationTitle("Favorites")
    }

    private var favoriteLandmarks: [Landmark] {
        landmarks.filter { favorites.contains($0.id) }
    }
}

#Preview {
    @Previewable @State var favorites: Set<UUID> = [Landmark.sampleData[0].id]

    NavigationStack {
        FavoritesView(
            favorites: $favorites,
            landmarks: Landmark.sampleData
        )
    }
}
