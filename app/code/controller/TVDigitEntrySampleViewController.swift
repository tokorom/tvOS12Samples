//
//  TVDigitEntrySampleViewController.swift
//
//  Created by ToKoRo on 2018-08-27.
//

import UIKit
import TVUIKit

class TVDigitEntrySampleViewController: UITableViewController {
    private enum Row: Int {
        case inputOneTimeCode
    }

    private func showInputOneTimeCodeSample() {
        let digitEntry = TVDigitEntryViewController()

        digitEntry.numberOfDigits = 6
        digitEntry.titleText = "ワンタイム・パスコード"
        digitEntry.promptText = "あなたのSMS番号に送信された６桁の数字を入力してください"

        digitEntry.entryCompletionHandler = { [unowned self] entry in
            self.handleEntry(entry)
        }

        present(digitEntry, animated: true)
    }

    private func handleEntry(_ entry: String) {
        dismiss(animated: true) { [unowned self] () in
            let alert = UIAlertController(title: "入力されたワンタイム・パスコード", message: entry, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
}

// MARK: - UITableViewDelegate

extension TVDigitEntrySampleViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }

        guard let row = Row(rawValue: indexPath.row) else {
            return
        }

        switch row {
        case .inputOneTimeCode:
            showInputOneTimeCodeSample()
        }
    }
}
