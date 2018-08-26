//
//  Author.swift
//
//  Created by ToKoRo on 2018-08-27.
//

import Foundation

struct Author {
    let name: Name
    let imageName: String?
}

// MARK: - Extension

extension Author {
    enum Name {
        case simple(String?, String?)
        case components(PersonNameComponents)
    }
}
