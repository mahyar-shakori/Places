//
//  String+Localization.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
