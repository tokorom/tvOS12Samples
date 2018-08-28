//
//  TVLockupViewSampleController.swift
//
//  Created by ToKoRo on 2018-08-27.
//

import UIKit
import TVUIKit

class TVLockupViewSampleController: UIViewController {
    private enum Sample: Int, CaseIterable {
        case mimickedMonogramView
        case additional
    }

    private func addSampleView(to view: UIView, for indexPath: IndexPath) {
        clearAllSubviews(from: view)

        guard let sample = Sample(rawValue: indexPath.item) else {
            return
        }

        switch sample {
        case .mimickedMonogramView:
            addMimickedMonogramView(to: view)
        case .additional:
            addMimickedMonogramView(to: view)
        }
    }

    private func clearAllSubviews(from view: UIView) {
        view.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }

    private func addMimickedMonogramView(to view: UIView) {
        let lockupView = TVLockupView()

        let imageSize = CGSize(width: 200, height: 200)

        lockupView.contentSize = imageSize
        lockupView.focusSizeIncrease = NSDirectionalEdgeInsets(top: -40, leading: -40, bottom: -40, trailing: -40)

        let baseView = UIView()
        let imageView = UIImageView(image: UIImage(named: "tokoro"))
        baseView.frame = CGRect(origin: .zero, size: imageSize)
        imageView.frame = CGRect(origin: .zero, size: imageSize)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageSize.width / 2
        imageView.clipsToBounds = true
        baseView.addSubview(imageView)

        baseView.layer.cornerRadius = imageSize.width / 2
        baseView.layer.shadowOpacity = 0.1
        baseView.layer.shadowOffset = CGSize(width: 0, height: 4)

        lockupView.contentView.addSubview(baseView)

        let footerView = TVLockupHeaderFooterView()
        footerView.showsOnlyWhenAncestorFocused = true
        footerView.titleLabel?.text = "所 友太"
        footerView.subtitleLabel?.text = "Spinners"

        lockupView.footerView = footerView

        lockupView.sizeToFit()

        print("### \(lockupView)")
        print("### \(lockupView.contentView)")
        print("### \(imageView)")

        view.addSubview(lockupView)
    }
}

// MARK: - UICollectionViewDataSource

extension TVLockupViewSampleController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Sample.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        addSampleView(to: cell.contentView, for: indexPath)
        return cell
    }
}
