//
//  ConverterBrain.swift
//  Converto
//
//  Created by Burhan Kaynak on 23/01/2021.
//

import Foundation

protocol ConverterBrainDelegeate {
    func didFetchWithNoErrors(label: DataModel)
    func didFailWithError(error: Error)
}

struct ConverterBrain {
    var delegate: ConverterBrainDelegeate?
    let currencies = ["AUD","BRL","CAD","CNY","CUP","EUR","GBP","HKD","ILS","INR","JPY","KPW","KRW","MXN","NGN","NZD","RUB","SGD","TRY","UAH","USD","VND"]
    
    func fetchData(currency: String) {
        let urlString = "http://data.fixer.io/api/latest?access_key=\(apiKey)"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    if let safeData = data {
                        if let updatedData = self.parseData(safeData, currency) {
                            self.delegate?.didFetchWithNoErrors(label: updatedData)
                        }
                    }
                }
            }
            task.resume()
        }
    }

    func parseData(_ toParse: Data, _ currency: String) -> DataModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CurrencyData.self, from: toParse)
            if let decodedRate = decodedData.rates[currency] {
                let result = DataModel(rate: decodedRate, currency: currency)
                return result
            }
        } catch {
            delegate?.didFailWithError(error: error)
        }
        return nil
    }
}
