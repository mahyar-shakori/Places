//
//  View+Alert.swift
//  Places
//
//  Created by Mahyar on 25/04/2026.
//

import SwiftUI

extension View {
    func basicAlert(
        isPresented: Binding<Bool>,
        title: String = Localization.Wikipedia.notInstalledTitle,
        message: String = Localization.Wikipedia.notInstalledMessage,
        buttonTitle: String = Localization.Common.okButton
    ) -> some View {
        alert(title, isPresented: isPresented) {
            Button(buttonTitle, role: .cancel) { }
        } message: {
            Text(message)
        }
    }
}
