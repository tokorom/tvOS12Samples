//
//  TVPosterViewSampleController.swift
//
//  Created by ToKoRo on 2018-08-25.
//

import UIKit
import TVUIKit

class TVPosterViewSampleController: UIViewController {
    lazy var books: [Book] = SampleBooks.shared.books

    func book(for indexPath: IndexPath) -> Book? {
        let index = indexPath.item
        guard let book = books.indices.contains(index) ? books[index] : nil else {
            return nil
        }
        return book
    }

    func adoptSubview(to cell: UICollectionViewCell, for indexPath: IndexPath) {
        let posterView: TVPosterView = {
            let contentView = cell.contentView
            if let posterView = contentView.searchSubview(for: TVPosterView.self) {
                return posterView
            }
            let posterView = TVPosterView(image: nil)
            posterView.frame = contentView.bounds
            contentView.addSubview(posterView)
            return posterView
        }()

        guard let book = book(for: indexPath) else {
            return
        }

        posterView.title = book.title
        posterView.subtitle = book.subtitle
        posterView.image = UIImage(named: book.imageName)
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
