//
//  SampleAuthors.swift
//
//  Created by ToKoRo on 2018-08-27.
//

import Foundation

class SampleAuthors {
    static let shared = SampleAuthors()

    let samples: [Author] = [
        Author(name: .simple("Yuta Tokoro", "Spinners"), imageName: "tokorom"),
    ]
}
