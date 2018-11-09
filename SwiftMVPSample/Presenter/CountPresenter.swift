//
//  CountPresenter.swift
//  SwiftMVPSample
//
//  Created by Hayashi Tsubasa on 2017/01/09.
//  Copyright © 2017年 Tsubasa Hayashi. All rights reserved.
//

import Foundation
// Not import UIKit

protocol CountPresenter {

}

final class CountPresenter {

    private weak var view: CountViewDelegate!
    private var model: CountModel

    init(view: CountViewDelegate, model: CountModel) {
        self.view = view
        self.model = model
    }

    func onCountUp(){
        model.num += 1
        view.onCountChange(num: model.num)
    }
    
    func onCountDown(){
        model.num -= 1
        view.onCountChange(num: model.num)
    }
    
    func initCountLabel() {
        view.onCountChange(num: model.num)
    }
}
