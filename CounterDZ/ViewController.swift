//
//  ViewController.swift
//  CounterDZ
//
//  Created by Дмитрий Зайцев on 15.05.23.
//

import UIKit

class ViewController: UIViewController {
    
    private var countInt = 0
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var plusButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countLabel.text = "0"
    }
    
    @IBAction private func plusButtonDidTap() {
        countInt += 1
        countLabel.text = String(countInt)
    }

}

