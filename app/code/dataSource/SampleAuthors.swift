//
//  SampleAuthors.swift
//
//  Created by ToKoRo on 2018-08-27.
//

import Foundation

class SampleAuthors {
    static let shared = SampleAuthors()

    let samples: [Author] = [
        Author(name: .simple("所 友太", "Spinners"), imageName: "tokoro"),
        Author(name: .simple("堤 修一", "Fyusion"), imageName: "tsusumi"),
        Author(name: .simple("吉田 悠一", "デンソーアイティーラボラトリ"), imageName: "yoshida"),
        Author(name: .simple("加藤 尋樹", "はてな"), imageName: "kato"),
        Author(name: .simple("池田 翔", "はてな"), imageName: "ikeda"),
    ]
}
