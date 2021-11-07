//
//  CurrencyData.swift
//  Converto
//
//  Created by Burhan Kaynak on 23/01/2021.
//

import Foundation

struct CurrencyData: Codable {
    var rates: [String: Double]
    var success: Bool
    var base: String
}
