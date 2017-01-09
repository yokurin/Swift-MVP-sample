//
//  CountPresenter.swift
//  SwiftMVPSample
//
//  Created by Hayashi Tsubasa on 2017/01/09.
//  Copyright © 2017年 Tsubasa Hayashi. All rights reserved.
//

import Foundation

class CountPresenter {

    // CountViewProtcol にするとちがう画面(ViewController)からもカウントアップしたいときにこのPresenterを呼びだせる
    private let view: CountViewProtcol
    private let model: CountModel
        
    required init(view: CountViewProtcol, model: CountModel) {
        self.view = view
        self.model = model
    }

    func onCountUp(){
        //基本モデルの値の変更はモデル内でやる (他のPresenterからもCountModelを変更する場合がある)
        model.countUp()
        view.onCountChange(num: model.num)
    }
    
    func onCountDown(){
        model.countDown()
        view.onCountChange(num: model.num)
    }
    
    func initCountLabel() {
        view.onCountChange(num: model.num)
    }
}
