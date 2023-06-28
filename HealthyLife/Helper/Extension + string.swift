//
//  Extension + string.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 28.06.2023.
//

import Foundation

extension String {
    func localized() -> String {
        NSLocalizedString(self, comment: "")
    }
}
