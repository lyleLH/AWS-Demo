//
//  RandomString.swift
//  AWS
//
//  Created by Tom.Liu on 2021/5/19.
//

import Foundation
/// 随机字符串生成
class RandomString {
    let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    func getRandomStringOfLength(length: Int) -> String {
        var ranStr = ""
        for _ in 0..<length {
            let index = Int(arc4random_uniform(UInt32(characters.count)))
            let start = characters.index(characters.startIndex, offsetBy: index)
            let end = characters.index(characters.startIndex, offsetBy: index)
            ranStr.append(contentsOf: characters[start...end])
        }
        return ranStr
    }
    private init() {
    }
    static let sharedInstance = RandomString()
}
