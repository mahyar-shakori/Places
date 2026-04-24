//
//  AppUI.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import SwiftUI

enum AppUI {
    enum Spacing {
        static let xSmall: CGFloat = 2
        static let small: CGFloat = 8
        static let medium: CGFloat = 12
        static let large: CGFloat = 16
    }

    enum Size {
        static let rowIcon: CGFloat = 32
    }

    enum CornerRadius {
        static let medium: CGFloat = 12
        static let large: CGFloat = 24
    }

    enum Opacity {
        static let disabled: CGFloat = 0.35
        static let border: CGFloat = 0.35
        static let iconBackground: CGFloat = 0.12
    }

    enum LineWidth {
        static let thin: CGFloat = 1
    }

    enum LineSpacing {
        static let body: CGFloat = 4
    }

    enum Color {
        static let screenBackground = SwiftUI.Color(.systemGroupedBackground)
        static let cardBackground = SwiftUI.Color(.systemBackground)

        static let primaryAction = SwiftUI.Color.blue
        static let disabledAction = SwiftUI.Color.gray.opacity(AppUI.Opacity.disabled)

        static let fieldBackground = SwiftUI.Color(.tertiarySystemBackground)
        static let fieldBorder = SwiftUI.Color.gray.opacity(AppUI.Opacity.border)

        static let iconForeground = SwiftUI.Color.blue
        static let iconBackground = SwiftUI.Color.blue.opacity(AppUI.Opacity.iconBackground)
    }

    enum Font {
        static let sectionTitle = SwiftUI.Font.caption.weight(.bold)
        static let fieldLabel = SwiftUI.Font.subheadline.weight(.semibold)
        static let fieldValue = SwiftUI.Font.title3.weight(.semibold)
        static let rowTitle = SwiftUI.Font.body.weight(.medium)
        static let rowSubtitle = SwiftUI.Font.caption
        static let buttonTitle = SwiftUI.Font.headline
        static let body = SwiftUI.Font.body
    }

    enum Icon {
        static let location = "mappin.circle.fill"
        static let placesTab = "location.circle"
        static let customTab = "plus.square"
        static let chevron = "chevron.right"
        static let globe = "globe"
        static let error = "exclamationmark.triangle"
    }
}
