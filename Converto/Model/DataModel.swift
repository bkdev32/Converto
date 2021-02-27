//
//  DataModel.swift
//  Converto
//
//  Created by Burhan Kaynak on 23/01/2021.
//

import Foundation

struct DataModel {
    let rate: Double
    let currency: String
    
    var rateString: String {
        return String(format: "%.2f", rate)
    }
    
    var currencyLabel: String {
        switch currency {
        case "AUD":
            return "dollarsign.circle"
        case "BRL":
            return "brazilianrealsign.circle"
        case "CAD":
            return "dollarsign.circle"
        case "CNY":
            return "yensign.circle"
        case "CUP":
            return "pesosign.circle"
        case "EUR":
            return "eurosign.circle"
        case "GBP":
            return "sterlingsign.circle"
        case "HKD":
            return "dollarsign.circle"
        case "ILS":
            return "shekelsign.circle"
        case "INR":
            return "indianrupeesign.circle"
        case "JPY":
            return "yensign.circle"
        case "KPW":
            return "wonsign.circle"
        case "KRW":
            return "wonsign.circle"
        case "MXN":
            return "pesosign.circle"
        case "NGN":
            return "nairasign.circle"
        case "NZD":
            return "dollarsign.circle"
        case "RUB":
            return "rublesign.circle"
        case "SGD":
            return "dollarsign.circle"
        case "TRY":
            return "turkishlirasign.circle"
        case "UAH":
            return "hryvniasign.circle"
        case "USD":
            return "dollarsign.circle"
        case "VND":
            return "dongsign.circle"
        default:
            return "dollarsign.circle"
        }
    }
}
