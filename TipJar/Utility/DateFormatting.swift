//
//  DateFormatting.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/7/22.
//

import Foundation

fileprivate extension DateFormatter {
    static func withFormat(_ format: String) -> DateFormatter {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = format
        return formatter
    }

    /// <2021 January 31>
    static let `default` = DateFormatter.withFormat("yyyy MMM dd")
}

public extension Date {

    /// <2021 January 31>
    var `default`: String {
        DateFormatter.default.string(from: self)
    }
}
