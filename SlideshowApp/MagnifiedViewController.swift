//
//  MagnifiedViewController.swift
//  SlideshowApp
//
//  Created by tlsmooth89 on 4/9/16.
//  Copyright © 2016 yusuke.iwasaki. All rights reserved.
//

import UIKit

class MagnifiedViewController: UIViewController {
    
    var currentPicName: String!
    var selectedImage: UIImage!
    @IBOutlet weak var magnifiedImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedImage = UIImage(named: currentPicName)
        magnifiedImageView.image = selectedImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
