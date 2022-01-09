//
//  ImageViewExtension.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import UIKit

extension UIImageView {
    
    private static var urlStore = [String:String]()
    
    func setImage(url: String, placeholderImage: UIImage? = nil) {
        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        UIImageView.urlStore[tmpAddress] = url
        
        if let image = placeholderImage {
            self.image = image
        } else{
            self.backgroundColor = .gray
        }
        
        MKImageDownloader().downloadAndCacheImage(url: url, onSuccess: { (image, url) in
            DispatchQueue.main.async {
                if UIImageView.urlStore[tmpAddress] == url {
                    UIView.transition(with: self, duration: 2.0, options: .transitionCrossDissolve, animations: {
                        self.image = image
                        self.backgroundColor = .clear
                    }, completion: nil)
                }
            }
        }) { error in
        }
    }
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
    
    func diagonalImage() {
        let shapeLayer: CAShapeLayer = {
            let shapeLayer = CAShapeLayer()
            shapeLayer.lineWidth = 0
            shapeLayer.fillColor = UIColor.white.cgColor
            return shapeLayer
        }()
        
        let path = UIBezierPath()
        path.move(to: bounds.origin)
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        path.addLine(to: CGPoint(x: bounds.minX, y: bounds.maxY - 80))
        path.close()
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }
}
