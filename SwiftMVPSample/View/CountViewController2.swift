//
//  CountViewController2.swift
//  SwiftMVPSample
//
//  Created by Hayashi Tsubasa on 1/9/17.
//  Copyright © 2017 Tsubasa Hayashi. All rights reserved.
//

import UIKit

class CountViewController2: UIViewController {
    
    @IBOutlet weak var countLabel2: UILabel!
    
    var presenter: CountPresenter?
    var countModel: CountModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.initCountLabel()
    }
    
    private func initialize() {
        presenter = .init(view: self, model: countModel)
    }
    
    @IBAction func onCountUpButton2(_ sender: UIButton) {
        presenter?.onCountUp()
    }
    
    @IBAction func onCountDownButton2(_ sender: UIButton) {
        presenter?.onCountDown()
    }
    
}

extension CountViewController2: CountViewDelegate {
    internal func onCountChange(num: Int) {
        countLabel2.text = String(num)
    }
}
