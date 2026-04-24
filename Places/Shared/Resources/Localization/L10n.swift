//
//  L10n.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation

enum L10n {
    enum NetworkError {
        static var invalidURL: String {
            "invalid.url".localized
        }
        
        static var invalidResponse: String {
            "invalid.response".localized
        }
        
        static var unacceptableStatusCode: String {
            "unacceptable.status.code".localized
        }
        
        static var decodingFailed: String {
            "decoding.failed".localized
        }
    }
}
