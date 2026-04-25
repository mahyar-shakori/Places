//
//  LoadingView.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview("Loading") {
    LoadingView()
}
