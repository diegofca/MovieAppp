//
//  ViewController.swift
//  movieApp
//
//  Created by Devp.ios on 17/09/18.
//  Copyright © 2018 Devp.ios. All rights reserved.
//

import UIKit
import Alamofire

extension UITabBarController {
    func updateTabBarItem(tab: Int, image: UIImage?) {
        guard let tabItems = tabBar.items, tab < tabItems.count && tab >= 0
            else { return }
        let tabItem = tabItems[tab]
        tabItem.image = image?.withRenderingMode(.alwaysOriginal)
        tabItem.selectedImage = tabItem.image
    }
}

class tabstMoviesView: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

