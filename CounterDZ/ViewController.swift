//
//  ViewController.swift
//  CounterDZ
//
//  Created by Дмитрий Зайцев on 15.05.23.
//

import UIKit

class ViewController: UIViewController {
    
    private var countInt = 0
    private var textForHistoryTextView = "История изменений:"
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var eraseButton: UIButton!
    @IBOutlet private weak var historyTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      countLabel.text = "Значение счётчика: 0"
        historyTextView.text = textForHistoryTextView
    }
    
    private func makeDateString() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd HH:mm:ss"
        return dateFormatter.string(from: date)
    }
    
    private func scrollToBottom() {
        let range = NSRange(location: historyTextView.text.count - 1, length: 0)
        historyTextView.scrollRangeToVisible(range)
    }
    
    @IBAction private func plusButtonDidTap() {
        countInt += 1
        countLabel.text = "Значение счётчика: \(countInt)"
        textForHistoryTextView.append("\n\(makeDateString()): значение изменено на +1")
        historyTextView.text = textForHistoryTextView
        scrollToBottom()
    }

    @IBAction private func minusButtonDidTap() {
        if countInt > 0 {
            countInt -= 1
            countLabel.text = "Значение счётчика: \(countInt)"
            textForHistoryTextView.append("\n\(makeDateString()): значение изменено на -1")
            historyTextView.text = textForHistoryTextView
            scrollToBottom()
        } else {
            textForHistoryTextView.append("\n\(makeDateString()): попытка уменьшить значение счётчика ниже 0")
            historyTextView.text = textForHistoryTextView
            scrollToBottom()
        }
    }
    
    @IBAction private func eraseButtonDidTap() {
        countInt = 0
        countLabel.text = "Значение счётчика: \(countInt)"
        textForHistoryTextView.append("\n\(makeDateString()): значение сброшено")
        historyTextView.text = textForHistoryTextView
        scrollToBottom()
    }
}

