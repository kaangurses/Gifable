//
//  UIViewExtension.swift
//  Gifable
//
//  Created by KAAN GURSES on 12.07.2022.
//

import UIKit

extension UIView {
    func fillSuperView() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0).isActive = true
        topAnchor.constraint(equalTo: superview.topAnchor, constant: 0).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0).isActive = true
    }

    func setConstraints(leading: NSLayoutXAxisAnchor? = nil,
                        leadingConstant: CGFloat = 0,
                        top: NSLayoutYAxisAnchor? = nil,
                        topConstant: CGFloat = 0,
                        trailing: NSLayoutXAxisAnchor? = nil,
                        trailingConstant: CGFloat = 0,
                        bottom: NSLayoutYAxisAnchor? = nil,
                        bottomConstant: CGFloat = 0,
                        width: CGFloat? = nil,
                        height: CGFloat? = nil,
                        centerX: NSLayoutXAxisAnchor? = nil,
                        centerXConstant: CGFloat = 0,
                        centerY: NSLayoutYAxisAnchor? = nil,
                        centerYConstant: CGFloat = 0) {

        translatesAutoresizingMaskIntoConstraints = false

        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: leadingConstant).isActive = true
        }

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }

        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: trailingConstant).isActive = true
        }

        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: bottomConstant).isActive = true
        }

        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }

        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX, constant: centerXConstant).isActive = true
        }

        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY, constant: centerYConstant).isActive = true
        }
    }
}
