//
//  ViewController.swift
//  Counter
//
//  Created by Maksim on 22.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    var counter = 0
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var historyText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterLabel()
        updateHistory(with: "История изменений")
        // Do any additional setup after loading the view.
    }
    
    func updateCounterLabel() {
        counterLabel.text = "\(counter)"
    }
    @IBAction func plusDidTap(_ sender: Any) {
        counter += 1
        updateCounterLabel()
        updateHistory(with: "[\(getCurrentDateTime())]: значение изменено на +1")
    }
    
    @IBAction func minusDidTap(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            updateCounterLabel()
            updateHistory(with: "[\(getCurrentDateTime())]:значение изменено на -1")
        } else {
            updateHistory(with: "[\(getCurrentDateTime())]:попытка уменьшить значение счётчика ниже 0 ")
        }
    }
    
    @IBAction func resetDidTap(_ sender: Any) {
        counter = 0
        updateCounterLabel()
        updateHistory(with: "\(getCurrentDateTime())]:значение сброшено")
    }
    func updateHistory(with message: String) {
        historyText.text = "\(historyText.text ?? "")\n\(message)"
        let range = NSMakeRange(historyText.text.count - 1, 1)
        historyText.scrollRangeToVisible(range)
    }
    
    
    func getCurrentDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter.string(from: Date())
    }
}
