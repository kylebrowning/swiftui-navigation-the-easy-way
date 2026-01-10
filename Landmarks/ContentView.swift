//
//  ContentView.swift
//  Landmarks
//

import SwiftUI

struct ContentView: View {
    @State private var navigator = Navigator()
    @State private var favorites: Set<UUID> = []

    var body: some View {
        @Bindable var navigator = navigator

        TabView(selection: $navigator.selectedTab) {
            NavigationStack(path: $navigator.landmarksPath) {
                LandmarkListView(landmarks: Landmark.sampleData)
                    .screenDestination(path: $navigator.landmarksPath)
            }
            .tabItem { Label("Landmarks", systemImage: "map") }
            .tag(Navigator.Tab.landmarks)

            NavigationStack(path: $navigator.favoritesPath) {
                FavoritesView(
                    favorites: $favorites,
                    landmarks: Landmark.sampleData
                )
                .screenDestination(path: $navigator.favoritesPath)
            }
            .tabItem { Label("Favorites", systemImage: "heart") }
            .tag(Navigator.Tab.favorites)

            NavigationStack(path: $navigator.deepLinksPath) {
                DeepLinksView()
                    .screenDestination(path: $navigator.deepLinksPath)
            }
            .tabItem { Label("Deep Links", systemImage: "link") }
            .tag(Navigator.Tab.deepLinks)
        }
        .environment(navigator)
        .environment(\.toggleFavorite, toggleFavorite)
        .environment(\.isFavorite, isFavorite)
        // Handle incoming deep links from the system
        .onOpenURL { url in
            navigator.handleDeepLink(url)
        }
        // Restore navigation state when app launches
        .onAppear {
            navigator.loadState()
        }
        // Save navigation state when app goes to background
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            navigator.saveState()
        }
    }

    private func toggleFavorite(_ id: UUID) {
        if favorites.contains(id) {
            favorites.remove(id)
        } else {
            favorites.insert(id)
        }
    }

    private func isFavorite(_ id: UUID) -> Bool {
        favorites.contains(id)
    }
}

// MARK: - Environment Keys for Favorites

private struct ToggleFavoriteKey: EnvironmentKey {
    static let defaultValue: (UUID) -> Void = { _ in }
}

private struct IsFavoriteKey: EnvironmentKey {
    static let defaultValue: (UUID) -> Bool = { _ in false }
}

extension EnvironmentValues {
    var toggleFavorite: (UUID) -> Void {
        get { self[ToggleFavoriteKey.self] }
        set { self[ToggleFavoriteKey.self] = newValue }
    }

    var isFavorite: (UUID) -> Bool {
        get { self[IsFavoriteKey.self] }
        set { self[IsFavoriteKey.self] = newValue }
    }
}

#Preview {
    ContentView()
}
