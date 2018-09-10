//
//  TVLockupViewSampleController.swift
//
//  Created by ToKoRo on 2018-08-27.
//

import UIKit
import TVUIKit

class TVLockupViewSampleController: UIViewController {
    private enum Sample: Int, CaseIterable {
        case coloredFrame
        case coloredFrameWithFocusSizeIncrease
        case coloredFrameWithContentViewInsets
        case simple
        case mimickedMonogramView
        case customizedCaptionButton
    }

    private func addSampleView(to view: UIView, for indexPath: IndexPath) {
        // サンプルをシンプルにするためセルの再利用をきちんと考慮していない
        clearAllSubviews(from: view)

        guard let sample = Sample(rawValue: indexPath.item) else {
            return
        }

        switch sample {
        case .coloredFrame:
            addColoredFrame(to: view)
        case .coloredFrameWithFocusSizeIncrease:
            addColoredFrameWithFocusSizeIncrease(to: view)
        case .coloredFrameWithContentViewInsets:
            addColoredFrameWithContentViewInsets(to: view)
        case .simple:
            addSimple(to: view)
        case .mimickedMonogramView:
            addMimickedMonogramView(to: view)
        case .customizedCaptionButton:
            addCustomizedCaptionButton(to: view)
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
        lockupView.focusSizeIncrease = NSDirectionalEdgeInsets(top: -14, leading: -14, bottom: -14, trailing: -14)

        guard let faceView: FaceView = UINib.load() else {
            assertionFailure()
            return
        }

        faceView.frame = CGRect(origin: .zero, size: imageSize)

        faceView.image = UIImage(named: "tokoro")
        lockupView.contentView.addSubview(faceView)

        let footerView = TVLockupHeaderFooterView()
        // footerView.showsOnlyWhenAncestorFocused = true
        footerView.titleLabel?.text = "所 友太"
        footerView.subtitleLabel?.text = "Spinners"

        lockupView.footerView = footerView
        lockupView.sizeToFit()
        view.addSubview(lockupView)

        // サンプルをシンプルにするためにこういう書き方にする
        // shadowもアニメーションさせるには別途CABasicAnimationなど使うこと
        faceView.animationsForNormal = {
            faceView.transform = CGAffineTransform.identity

            faceView.layer.shadowOpacity = 0.1
            faceView.layer.shadowRadius = 3
            faceView.layer.shadowOffset = CGSize(width: 0, height: 4)

            footerView.titleLabel?.textColor = UIColor.black
            footerView.titleLabel?.layer.shadowOpacity = 0
            footerView.subtitleLabel?.textColor = UIColor.black
            footerView.subtitleLabel?.layer.shadowOpacity = 0
        }

        // サンプルをシンプルにするためにこういう書き方にする
        // shadowもアニメーションさせるには別途CABasicAnimationなど使うこと
        faceView.animationsForFocused = {
            faceView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)

            faceView.layer.shadowOpacity = 0.3
            faceView.layer.shadowRadius = 30
            faceView.layer.shadowOffset = CGSize(width: 0, height: 20)

            footerView.titleLabel?.textColor = UIColor.white
            footerView.titleLabel?.layer.shadowOpacity = 0.3
            footerView.titleLabel?.layer.shadowOffset = CGSize(width: 0, height: 4)
            footerView.subtitleLabel?.textColor = UIColor.white
            footerView.subtitleLabel?.layer.shadowOpacity = 0.3
            footerView.subtitleLabel?.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
    }

    private func addCustomizedCaptionButton(to view: UIView) {
        let captionButton = TVCaptionButtonView()

        captionButton.contentText = "$5.99"
        captionButton.title = "Footer"

        let headerView = TVLockupHeaderFooterView()
        headerView.showsOnlyWhenAncestorFocused = true
        headerView.titleLabel?.text = "Header"
        captionButton.headerView = headerView

        captionButton.sizeToFit()
        view.addSubview(captionButton)
    }

    private func addColoredFrame(to view: UIView, optionalLogic: ((TVLockupView) -> Void)? = nil) {
        let lockupView = TVLockupView()
        lockupView.frame = view.bounds
        lockupView.contentSize = CGSize(width: 200, height: 200)

        optionalLogic?(lockupView)

        lockupView.backgroundColor = UIColor.red
        lockupView.contentView.backgroundColor = UIColor.blue

        lockupView.headerView = {
            let view = TVLockupHeaderFooterView()
            view.titleLabel?.text = "Header"
            return view
        }()
        lockupView.footerView = {
            let view = TVLockupHeaderFooterView()
            view.titleLabel?.text = "Footer"
            return view
        }()

        lockupView.headerView?.backgroundColor = UIColor.green
        lockupView.footerView?.backgroundColor = UIColor.green

        lockupView.sizeToFit()

        view.addSubview(lockupView)

        /*
        DispatchQueue.main.async {
            print(lockupView)
            print(lockupView.contentView)
        }
        */
    }

    private func addColoredFrameWithFocusSizeIncrease(to view: UIView) {
        addColoredFrame(to: view) { lockupView in
            lockupView.focusSizeIncrease = NSDirectionalEdgeInsets(top: -23, leading: -23, bottom: -23, trailing: -23)
        }
    }

    private func addColoredFrameWithContentViewInsets(to view: UIView) {
        addColoredFrame(to: view) { lockupView in
            lockupView.focusSizeIncrease = NSDirectionalEdgeInsets(top: -23, leading: -23, bottom: -23, trailing: -23)
            lockupView.contentViewInsets = NSDirectionalEdgeInsets(top: -23, leading: -23, bottom: -23, trailing: -23)
        }
    }

    private func addSimple(to view: UIView) {
        let lockupView = TVLockupView()
        lockupView.frame = view.bounds
        lockupView.contentSize = CGSize(width: 200, height: 200)

        let imageView = UIImageView(image: UIImage(named: "tokoro"))
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        lockupView.contentView.addSubview(imageView)

        lockupView.sizeToFit()

        view.addSubview(lockupView)

        lockupView.backgroundColor = UIColor.red
        lockupView.contentView.backgroundColor = UIColor.blue

        /*
        DispatchQueue.main.async {
            print(lockupView)
            print(lockupView.contentView)
        }
        */
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
