//
//  SampleButtonObjects.swift
//
//  Created by ToKoRo on 2018-08-26.
//

import Foundation

class SampleButtonObjects {
    static let shared = SampleButtonObjects()

    let samples: [ButtonObject] = [
        ButtonObject(content: ButtonObject.Content.text("Preview"), title: "Preview", subtitle: nil),
        ButtonObject(content: ButtonObject.Content.text("$19.99"), title: "Buy", subtitle: "With iTunes Extras"),
        ButtonObject(content: ButtonObject.Content.text("$5.99"), title: "Rent", subtitle: nil),
        ButtonObject(content: ButtonObject.Content.text("Wish List"), title: "Wish List", subtitle: nil),
        ButtonObject(content: ButtonObject.Content.text("No Title"), title: nil, subtitle: nil),
    ]
}
