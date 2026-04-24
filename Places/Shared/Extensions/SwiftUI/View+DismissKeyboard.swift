//
//  View+DismissKeyboard.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import SwiftUI

extension View {
    func dismissKeyboard(focus: FocusState<Bool>.Binding) -> some View {
        self
            .contentShape(Rectangle())
            .onTapGesture {
                focus.wrappedValue = false
            }
    }
}
