//
//  LSAnimViewController.swift
//  RPG Wizzard
//
//  Created by Aleksander Bernat on 21.01.2019.
//  Copyright © 2019 Aleksander Bernat. All rights reserved.
//

import UIKit

class LSAnimViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var launchDice: [UIImage] = []
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        launchDice = createImageArray()

        UIView.transition(with: imageView, duration: 1, options: .transitionCrossDissolve, animations: {
            self.imageView.animationImages = self.launchDice
            self.imageView.animationDuration = 1
            self.imageView.animationRepeatCount = 1
            self.imageView.startAnimating()

        }) { (success) in
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateInitialViewController()
            UIApplication.shared.keyWindow?.rootViewController = vc
        }
    }

    func createImageArray() -> [UIImage]{
        var imageArray: [UIImage] = []
        for imageCount in 1..<11{
            let imageName = "load\(imageCount).png"
            let image = UIImage(named: imageName)!
            
            imageArray.append(image)
        }
        return imageArray
    }

    func animate(imageView: UIImageView, images:[UIImage]){
        imageView.animationImages = images
        imageView.animationDuration = 1.0
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }
}
