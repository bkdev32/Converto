//
//  ConverterBrain.swift
//  Converto
//
//  Created by Burhan Kaynak on 23/01/2021.
//

import Foundation

struct ConverterBrain {
    let currencies = ["TRY","AUD","BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
//    let baseUrl = "http://data.fixer.io/api/latest?access_key="
//    let apiKey = "383b13de0b36da01d09faf27f0443583"
    
    func fetchData() {
        let urlString = "http://data.fixer.io/api/latest?access_key=383b13de0b36da01d09faf27f0443583"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Error unable to fetch data")
                } else {
                    if let safeData = data {
                        self.parseData(safeData)
                    }
                }
            }
            task.resume()
        }
    }

    func parseData(_ toParse: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CurrencyData.self, from: toParse)
            
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    
}
