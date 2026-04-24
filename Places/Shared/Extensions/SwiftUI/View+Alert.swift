//
//  View+Alert.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

import SwiftUI

extension View {
    func wikipediaNotInstalledAlert(
        isPresented: Binding<Bool>
    ) -> some View {
        alert(L10n.Wikipedia.notInstalledTitle, isPresented: isPresented) {
            Button(L10n.Wikipedia.okButton, role: .cancel) { }
        } message: {
            Text(L10n.Wikipedia.notInstalledMessage)
        }
    }
}
