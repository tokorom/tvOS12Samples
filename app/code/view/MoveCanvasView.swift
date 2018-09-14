//
//  MoveCanvasView.swift
//
//  Created by ToKoRo on 2018-09-14.
//

import UIKit

class MoveCanvasView: CanvasView {
    override func createRects() -> [Rect] {
        return [
            MoveRect(x: 100, y: 100, color: UIColor.red.cgColor, parent: self),
            MoveRect(x: 300, y: 100, color: UIColor.blue.cgColor, parent: self),
            InteractionRect(x: 100, y: 300, color: UIColor.green.cgColor, parent: self),
            InteractionRect(x: 300, y: 300, color: UIColor.red.cgColor, parent: self)
        ]
    }
}

// MARK: - MoveRect

class MoveRect: Rect {
    var translation: CGVector?

    override var path: CGPath {
        var transform: CGAffineTransform
        if let translation = translation {
            transform = CGAffineTransform(translationX: translation.dx, y: translation.dy)
        } else {
            transform = CGAffineTransform.identity
        }

        if isFocused {
            return CGPath(rect: frame.insetBy(dx: -20, dy: -20), transform: &transform)
        } else {
            return CGPath(rect: frame, transform: &transform)
        }
    }
}

extension MoveRect { //< UIFocusItem
    func didHintFocusMovement(_ hint: UIFocusMovementHint) {
        self.translation = hint.translation
        parentView?.setNeedsDisplay()
    }
}

// MARK: - InteractionRect

class InteractionRect: Rect {
    var transform3D: CATransform3D?

    override var path: CGPath {
        var transform: CGAffineTransform
        if let transform3D = transform3D {
            transform = CATransform3DGetAffineTransform(transform3D)
        } else {
            transform = CGAffineTransform.identity
        }

        if isFocused {
            return CGPath(rect: frame.insetBy(dx: -20, dy: -20), transform: &transform)
        } else {
            return CGPath(rect: frame, transform: &transform)
        }
    }
}

extension InteractionRect { //< UIFocusItem
    func didHintFocusMovement(_ hint: UIFocusMovementHint) {
        self.transform3D = hint.interactionTransform
        parentView?.setNeedsDisplay()
    }
}
