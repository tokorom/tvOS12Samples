//
//  ScrollableCanvasView.swift
//
//  Created by ToKoRo on 2018-09-14.
//

import UIKit

class ScrollableCanvasView: CanvasView, UIFocusItemScrollableContainer {
    override func createRects() -> [Rect] {
        var rects: [Rect] = []

        let rectWidth: CGFloat = 100
        let margin: CGFloat = 100
        var x: CGFloat = 100

        while x + rectWidth < contentSize.width {
            let rect = MoveRect(x: x, y: 100, color: UIColor.blue.cgColor, parent: self)
            rects.append(rect)
            x += rectWidth + margin
        }

        return rects
    }

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }

        if renderOffset != .zero {
            context.translateBy(x: -renderOffset.x, y: -renderOffset.y)
        }

        for rect in rects {
            rect.draw(in: context)
        }
    }

    var renderOffset: CGPoint = .zero

    var contentOffset: CGPoint {
        get {
            return renderOffset
        }
        set {
            self.renderOffset = newValue
            setNeedsDisplay()
        }
    }

    var contentSize: CGSize {
        return CGSize(width: bounds.size.width * 2, height: bounds.size.height)
    }

    var visibleSize: CGSize {
        return bounds.size
    }
}
