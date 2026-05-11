//
//  AppRootView.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import SwiftUI

struct AppRootView: View {
    @Environment(AppContainer.self) private var container
    
    var body: some View {
        TabView {
            LocationsView(
                viewModel: container.makeLocationsViewModel()
            )
            .tabItem {
                Label(
                    Localization.Common.placesTitle,
                    systemImage: Style.Icon.placesTab
                )
            }
            
            CustomLocationView(
                viewModel: container.makeCustomLocationViewModel()
            )
            .tabItem {
                Label(
                    Localization.Common.customLocationTitle,
                    systemImage: Style.Icon.customTab
                )
            }
        }
    }
}

#Preview {
    AppRootView()
        .environment(AppContainer())
}
