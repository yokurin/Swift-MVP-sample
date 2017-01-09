//
//  CountPresenter.swift
//  SwiftMVPSample
//
//  Created by Hayashi Tsubasa on 2017/01/09.
//  Copyright © 2017年 Tsubasa Hayashi. All rights reserved.
//

import Foundation

protocol CountPresenter: class {
    init(view: CountViewController)
    
    func onCountUp()
    func onCountDown()
}


class CountPresenterImpl: CountPresenter{
    
    private let view: CountViewController
    private var model: CountModel
    
    
    required init(view: CountViewController) {
        self.view = view
        self.model = CountModel()
    }

    func onCountUp(){
        model.num += 1
        view.onCountChange(num: model.num)
    }
    func onCountDown(){
        model.num -= 1
        view.onCountChange(num: model.num)
    }
}
