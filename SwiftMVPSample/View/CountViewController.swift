//
//  CountView.swift
//  SwiftMVPSample
//
//  Created by Hayashi Tsubasa on 2017/01/09.
//  Copyright © 2017年 Tsubasa Hayashi. All rights reserved.
//

import UIKit

protocol CountViewDelegate: class {
    func onCountChange(num: Int)
}

final class CountViewController: UIViewController {
    
    @IBOutlet private weak var countLabel: UILabel!
    
    private var presenter: CountPresenter?
    private var countModel: CountModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.initCountLabel()
    }
    
    private func initialize() {
        countModel = CountModel()
        presenter = CountPresenter(view: self, model: countModel)
    }
    
    @IBAction func onCountUpButton(_ sender: UIButton) {
        presenter?.onCountUp()
    }
    
    @IBAction func onCountDownButton(_ sender: UIButton) {
        presenter?.onCountDown()
    }
    
    // present model data to countVC2
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let countVC2 = segue.destination as? CountViewController2 {
            countVC2.countModel = countModel
        }
    }
    
}

// MARK: CountViewDelegate
extension CountViewController: CountViewDelegate {
    internal func onCountChange(num: Int) {
        countLabel.text = String(num)
    }
}
