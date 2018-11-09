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
    
    var presenter: CountPresenter!
    var countModel: CountModel!
    
    override func viewWillAppear(_ animated: Bool) {
        countPresenter?.initCountLabel()
    }

    static func configure() -> CountViewController {
        let view = CountViewController()
        view.countModel = CountModel()
        view.presenter = CountPresenter(view: self, model: countModel)
    }
    
    @IBAction func onCountUpButton(_ sender: UIButton) {
        countPresenter?.onCountUp()
    }
    
    @IBAction func onCountDownButton(_ sender: UIButton) {
        countPresenter?.onCountDown()
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
