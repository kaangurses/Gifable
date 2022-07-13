//
//  ViewController.swift
//  Gifable
//
//  Created by KAAN GURSES on 12.07.2022.
//

import UIKit

final class ViewController: UIViewController {
    private var gifView: GifView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }

    private func setupView() {
        let customGifView = GifView(frame: CGRect(x: 0.0, y: 0.0, width: 80.0, height: 60.0))
        view.addSubview(customGifView)
        customGifView.setConstraints(width: 80.0, height: 60.0, centerX: view.centerXAnchor, centerY: view.centerYAnchor)
        customGifView.setGifFromAssets(with: "smile")
        customGifView.startAnimating()
        gifView = customGifView

        let animationSwitch = UISwitch()
        view.addSubview(animationSwitch)
        animationSwitch.setConstraints(top: customGifView.bottomAnchor, topConstant: 30.0, centerX: view.centerXAnchor, centerXConstant: -50.0)
        animationSwitch.isOn = true
        animationSwitch.addTarget(self, action: #selector(animationChanged(_:)), for: .valueChanged)

        let animationLabel = UILabel()
        view.addSubview(animationLabel)
        animationLabel.setConstraints(leading: animationSwitch.trailingAnchor, leadingConstant: 12, centerY: animationSwitch.centerYAnchor)
        animationLabel.text = "Start Animation"

        let assetSwitch = UISwitch()
        view.addSubview(assetSwitch)
        assetSwitch.setConstraints(top: animationSwitch.bottomAnchor, topConstant: 30.0, centerX: view.centerXAnchor, centerXConstant: -50.0)
        assetSwitch.isOn = true
        assetSwitch.addTarget(self, action: #selector(resourceChanged(_:)), for: .valueChanged)

        let assetLabel = UILabel()
        view.addSubview(assetLabel)
        assetLabel.setConstraints(leading: assetSwitch.trailingAnchor, leadingConstant: 12, centerY: assetSwitch.centerYAnchor)
        assetLabel.text = "From Asset"
    }

    @objc private func animationChanged(_ sender: UISwitch) {
        sender.isOn ? gifView?.startAnimating() : gifView?.stopAnimating()
    }

    @objc private func resourceChanged(_ sender: UISwitch) {
        gifView?.stopAnimating()
        sender.isOn ? gifView?.setGifFromAssets(with: "smile") : gifView?.setGifFromBundle(with: "blink_eyes")
        gifView?.startAnimating()
    }
}
