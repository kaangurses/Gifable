//
//  GifView.swift
//  Gifable
//
//  Created by KAAN GURSES on 12.07.2022.
//

import UIKit

final class GifView: UIView {
    private let gifView: UIImageView = .init()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    private func setup() {
        addSubview(gifView)
        gifView.fillSuperView()
    }

    func setGifFromBundle(with name: String) {
        let properties = getAnimationPropertiesFromBundle(with: name)
        gifView.animationImages = properties.images
        gifView.animationDuration = properties.duration
    }

    func setGifFromAssets(with name: String) {
        let properties = getAnimationPropertiesFromAssets(with: name)
        gifView.animationImages = properties.images
        gifView.animationDuration = properties.duration
    }

    func startAnimating() {
        gifView.startAnimating()
    }

    func stopAnimating() {
        gifView.stopAnimating()
    }

    private func getAnimationPropertiesFromBundle(with name: String) -> (images: [UIImage], duration: Double) {
        guard let path = Bundle.main.path(forResource: name, ofType: "gif") else { return ([], 0.0) }
        let url = URL(fileURLWithPath: path)
        guard let gifData = try? Data(contentsOf: url) else { return ([], 0.0) }
        return createUIImageArray(with: gifData as CFData)
    }

    private func getAnimationPropertiesFromAssets(with name: String) -> (images: [UIImage], duration: Double) {
        guard let asset = NSDataAsset(name: name) else { return ([], 0.0) }
        return createUIImageArray(with: asset.data as CFData)
    }

    private func createUIImageArray(with data: CFData) -> (images: [UIImage], duration: Double) {
        guard let source = CGImageSourceCreateWithData(data, nil) else { return ([], 0) }
        var duration: Double = 0.0
        var images = [UIImage]()
        let imageCount = CGImageSourceGetCount(source)
        for i in 0..<imageCount {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: image))
            }
            if let properties: NSDictionary = CGImageSourceCopyPropertiesAtIndex(source, i, nil),
               let durationProperty = (properties [kCGImagePropertyGIFDictionary] as? NSDictionary)?[kCGImagePropertyGIFDelayTime] as? Double {
                duration += durationProperty
            }
        }
        return (images, duration)
    }
}
