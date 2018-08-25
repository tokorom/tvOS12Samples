//
//  TVPosterViewSampleController.swift
//
//  Created by ToKoRo on 2018-08-25.
//

import UIKit
import TVUIKit

class TVPosterViewSampleController: UIViewController {
    func adoptSubview(to cell: UICollectionViewCell, for indexPath: IndexPath) {
        let posterView: TVPosterView = {
            if let posterView = cell.contentView.searchSubview(for: TVPosterView.self) {
                return posterView
            }
            let posterView = TVPosterView(image: nil)
            print("### posterView: \(posterView)")
            cell.contentView.addSubview(posterView)
            return posterView
        }()

        posterView.title = "TITLE"
        posterView.subtitle = "SUBTITLE----------------END"
    }
}

// MARK: - UICollectionViewDataSource

extension TVPosterViewSampleController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        adoptSubview(to: cell, for: indexPath)
        return cell
    }
}
