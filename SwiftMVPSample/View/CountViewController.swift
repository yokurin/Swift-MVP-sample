//
//  CountView.swift
//  SwiftMVPSample
//
//  Created by Hayashi Tsubasa on 2017/01/09.
//  Copyright © 2017年 Tsubasa Hayashi. All rights reserved.
//

import UIKit

// ~ViewDelegate にする (UIView のサブクラスと区別するため)
protocol CountViewDelegate: class {
    func onCountChange(num: Int)
}

class CountViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countDownButton: UIButton!
    @IBOutlet weak var countUpButton: UIButton!
    
    var countPresenter: CountPresenter?
    var countModel: CountModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        countPresenter?.initCountLabel()
    }
    
    private func initialize() {
        countModel = CountModel()
        countPresenter = CountPresenter.init(view: self, model: countModel)
        
    }
    
    @IBAction func onCountUpButton(_ sender: UIButton) {
        countPresenter?.onCountUp()
    }
    
    @IBAction func onCountDownButton(_ sender: UIButton) {
        countPresenter?.onCountDown()
    }
    
    // 遷移先のモデルの今使ってるモデルをわたす
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let countVC2 = segue.destination as? CountViewController2 {
            countVC2.countModel = self.countModel
        }
    }
    
}

extension CountViewController: CountViewDelegate {
    
    internal func onCountChange(num: Int) {
        countLabel.text = String(num)
    }
    
}
