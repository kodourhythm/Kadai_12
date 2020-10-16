//
//  ViewController.swift
//  Kadai_12
//
//  Created by kodou on 2020/10/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var inputMoneyTextField: UITextField!
    @IBOutlet private weak var inputTaxTextField: UITextField!
    @IBOutlet private weak var resultCalcLabel: UILabel!
    
    private var resultCalcMoney = 0
    private var resultCalcTax = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        resultCalcLabel.text = String(resultCalcMoney)
        
        // 保存した消費税率を取得
        let saveTax = UserDefaults.standard.string(forKey: "tax")
        inputTaxTextField.text = saveTax ?? ""
        // Do any additional setup after loading the view.
    }

    @IBAction func pushCalcButton(_ sender: Any) {
        // 消費税計算
        let inputMoney = Int(inputMoneyTextField.text ?? "") ?? 0
        let inputTax = Double(inputTaxTextField.text ?? "") ?? 0
        resultCalcTax = Double(inputMoney) * inputTax / 100
        resultCalcMoney = inputMoney + Int(resultCalcTax)
        resultCalcLabel.text = String(resultCalcMoney)
        
        // 消費税率保存
        UserDefaults.standard.set(inputTaxTextField.text, forKey: "tax")
    }
    
}

