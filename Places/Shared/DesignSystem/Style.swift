//
//  Style.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import SwiftUI

enum Style {
    enum Spacing {
        static let xSmall: CGFloat = 2
        static let small: CGFloat = 8
        static let medium: CGFloat = 12
        static let large: CGFloat = 16
    }
    
    enum CornerRadius {
        static let medium: CGFloat = 12
        static let large: CGFloat = 24
    }

    enum Opacity {
        static let disabledContent: CGFloat = 0.35
        static let subtleBorder: CGFloat = 0.35
        static let iconBackground: CGFloat = 0.12
    }

    enum LineWidth {
        static let thin: CGFloat = 1
    }

    enum LineSpacing {
        static let body: CGFloat = 4
    }

    enum Colors {
        static let screenBackground = Color(.systemGroupedBackground)
        static let cardBackground = Color(.systemBackground)

        static let primaryAction = Color.blue
        static let disabledAction = Color.gray.opacity(Style.Opacity.disabledContent)

        static let fieldBackground = Color(.tertiarySystemBackground)
        static let fieldBorder = Color.gray.opacity(Style.Opacity.subtleBorder)
    }

    enum Fonts {
        static let sectionTitle = Font.caption.weight(.bold)
        static let fieldLabel = Font.subheadline.weight(.semibold)
        static let fieldValue = Font.title3.weight(.semibold)
        static let rowTitle = Font.body.weight(.medium)
        static let rowSubtitle = Font.caption
        static let buttonTitle = Font.headline
        static let body = Font.body
    }

    enum Icon {
        static let placesTab = "location.circle"
        static let customTab = "plus.square"
        static let chevron = "chevron.right"
        static let globe = "globe"
        static let error = "exclamationmark.triangle"
    }
}
