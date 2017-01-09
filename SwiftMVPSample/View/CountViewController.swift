//
//  CountView.swift
//  SwiftMVPSample
//
//  Created by Hayashi Tsubasa on 2017/01/09.
//  Copyright © 2017年 Tsubasa Hayashi. All rights reserved.
//

import UIKit

// 「CountView」だとUIViewのサブクラスかわからなくなるので「CountViewProtcol」にする
protocol CountViewProtcol {
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
    
    private func initialize() {
        countModel = CountModel()
        countPresenter = CountPresenter.init(view: self, model: countModel)
        countPresenter?.initCount()
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

extension CountViewController: CountViewProtcol {
    
    internal func onCountChange(num: Int) {
        countLabel.text = String(num)
    }
    
}
