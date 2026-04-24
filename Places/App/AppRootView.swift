//
//  AppRootView.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import SwiftUI

struct AppRootView: View {
    let container: AppContainer
    
    var body: some View {
        TabView {
            LocationsView(
                viewModel: container.makeLocationsViewModel()
            )
            .tabItem {
                Label(
                    L10n.Common.placesTitle,
                    systemImage: Style.Icon.placesTab
                )
            }
            
            CustomLocationView(
                viewModel: container.makeCustomLocationViewModel()
            )
            .tabItem {
                Label(
                    L10n.Common.customLocationTitle,
                    systemImage: Style.Icon.customTab
                )
            }
        }
    }
}

#Preview {
    AppRootView(
        container: AppContainer()
    )
}
