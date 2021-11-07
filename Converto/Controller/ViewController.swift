//
//  ViewController.swift
//  Converto
//
//  Created by Burhan Kaynak on 23/01/2021.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, ConverterBrainDelegeate {
    @IBOutlet weak var currencyImage: UIImageView!
    @IBOutlet weak var currencylabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    private var converter = ConverterBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        converter.delegate = self
        pickerView.dataSource = self
        pickerView.delegate = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return converter.currencies.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return converter.currencies[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedRow = converter.currencies[row]
        converter.fetchData(currency: selectedRow)
    }
    func didFetchWithNoErrors(label: DataModel) {
        DispatchQueue.main.async {
            self.currencylabel.text = label.rateString
            self.currencyImage.image = UIImage(systemName: label.currencyLabel)
        }
    }
    func didFailWithError(error: Error) {
        let alert = UIAlertController(title: "Opps!", message: "Looks like there was a problem, please try again!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
