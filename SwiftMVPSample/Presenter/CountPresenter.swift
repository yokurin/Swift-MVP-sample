//
//  CountPresenter.swift
//  SwiftMVPSample
//
//  Created by Hayashi Tsubasa on 2017/01/09.
//  Copyright © 2017年 Tsubasa Hayashi. All rights reserved.
//

import Foundation

//protocol CountPresenter: class {
//    init(view: CountViewController)
//    
//    func onCountUp()
//    func onCountDown()
//}
//
//
//class CountPresenterImpl: CountPresenter{
// ここはPresenterの使い方にもよると思うのですが、似たようなPresenterをたくさん作らないのであれば、プロトコルにして抽象的にする必要はないかなと思ったのですがどうです？

class CountPresenter {

    // private let view: CountViewController
    // ここは CountViewProtcol にするとちがう画面(ViewController)からもカウントアップしたいときにこのPresenterを呼びだせないですかね？
    private let view: CountViewProtcol
    private var model: CountModel
    
    
    required init(view: CountViewController) {
        self.view = view
        self.model = CountModel()
    }

    func onCountUp(){
//        model.num += 1
//        基本モデルの値の変更はモデル内でやります？というのも他からもCountModelを変更できる場合に探しやすくなるかなと思ったので
        model.countUp()
        view.onCountChange(num: model.num)
    }
    func onCountDown(){
//        model.num -= 1
        model.countDown()
        view.onCountChange(num: model.num)
    }
}
