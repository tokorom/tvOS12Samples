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
        for index in samples.indices {
            let buttonObject = samples[index]
            addCaptionButton(with: buttonObject, at: index)
        }
    }

    private func addCaptionButton(with buttonObject: ButtonObject, at index: Int) {
        let captionButton = TVCaptionButtonView()
        captionButton.tag = index

        switch buttonObject.content {
        case .text(let text):
            captionButton.contentText = text
        case .image(let imageName):
            captionButton.contentImage = UIImage(named: imageName)
        }

        captionButton.title = buttonObject.title
        captionButton.subtitle = buttonObject.subtitle

        captionButton.addTarget(self, action: #selector(self.captionButtonDidTouch(captionButton:)), for: .primaryActionTriggered)

        stackView?.addArrangedSubview(captionButton)
    }

    @IBAction func captionButtonDidTouch(captionButton: TVCaptionButtonView) {
        print("captionButtonDidTouch: \(captionButton.tag)")
    }
}
