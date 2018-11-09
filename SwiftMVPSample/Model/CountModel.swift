//
//  File.swift
//  SwiftMVPSample
//
//  Created by Hayashi Tsubasa on 2017/01/09.
//  Copyright © 2017年 Tsubasa Hayashi. All rights reserved.
//

import Foundation
// Not import UIKit

final class CountModel {
    var num: Int
    
    init(_ num: Int = 0) {
        self.num = num
    }
    
    func countUp() {
        num += 1
    }
    
    func countDown() {
        num -= 1
    }

}
