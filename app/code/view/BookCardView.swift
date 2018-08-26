//
//  BookCardView.swift
//
//  Created by ToKoRo on 2018-08-26.
//

import UIKit

class BookCardView: UIView {
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var subtitleLabel: UILabel?
    @IBOutlet weak var imageView: UIImageView?

    var title: String? {
        get {
            return titleLabel?.text
        }
        set(value) {
            titleLabel?.text = value
        }
    }

    var subtitle: String? {
        get {
            return subtitleLabel?.text
        }
        set(value) {
            subtitleLabel?.text = value
        }
    }

    var image: UIImage? {
        get {
            return imageView?.image
        }
        set(value) {
            imageView?.image = value
        }
    }
}
