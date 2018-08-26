//
//  TVCaptionButtonViewSampleController.swift
//
//  Created by ToKoRo on 2018-08-25.
//

import UIKit
import TVUIKit

class TVCaptionButtonViewSampleController: UIViewController {
    @IBOutlet weak var stackView: UIStackView?

    lazy var samples: [ButtonObject] = SampleButtonObjects.shared.samples

    override func viewDidLoad() {
        super.viewDidLoad()

        addSamples()
    }

    private func addSamples() {
        for buttonObject in samples {
            addCaptionButton(with: buttonObject)
        }
    }

    private func addCaptionButton(with buttonObject: ButtonObject) {
        let captionButton = TVCaptionButtonView()

        switch buttonObject.content {
        case .text(let text):
            captionButton.contentText = text
        case .image(let imageName):
            captionButton.contentImage = UIImage(named: imageName)
        }

        captionButton.title = buttonObject.title
        captionButton.subtitle = buttonObject.subtitle

        stackView?.addArrangedSubview(captionButton)

        DispatchQueue.main.async {
            print(captionButton)
        }
    }
}
