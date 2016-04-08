//
//  ViewController.swift
//  SlideshowApp
//
//  Created by tlsmooth89 on 4/8/16.
//  Copyright © 2016 yusuke.iwasaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let pictureName: [String] = ["image_1.jpg", "image_2.jpg", "image_3.jpg"]
    var myImage: UIImage!
    var i = 0
    
    // Timer
    var timer: NSTimer!
    // Boolian to check if the slideshow is playing.
    var playing: Bool = false
    
    // To be called from the other buttons.
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var magnifiedButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // The "Forward" button method.
    @IBAction func onForwardButtonClick(sender: AnyObject) {
        nextImage()
    }
    
    // The "Play" button method.
    @IBAction func onPlayButtonClick(sender: AnyObject) {
        
        // Check if the slideshow is currently playing.
        if playing == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: ("nextImage"), userInfo: nil, repeats: true)
            sender.setTitle("停止", forState: UIControlState.Normal)
            forwardButton.enabled = false
            backButton.enabled = false
            playing = true
        } else {
            timer.invalidate()
            sender.setTitle("再生", forState: UIControlState.Normal)
            forwardButton.enabled = true
            backButton.enabled = true
            playing = false
        }
    }
    
    // The method called from both "Forward" and "Play" buttons.
    func nextImage() {
        
        if i < pictureName.count-1 {
            ++i
        } else {
            i = 0
        }
        
        myImage = UIImage(named: pictureName[i])
        magnifiedButton.setImage(myImage, forState: .Normal)
    }
    
    // The "Back" button method.
    @IBAction func onBackButtonClick(sender: AnyObject) {
        
        if i > 0 {
            --i
        } else {
            i = pictureName.count-1
        }
        
        myImage = UIImage(named: pictureName[i])
        magnifiedButton.setImage(myImage, forState: .Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let magnifiedViewController: MagnifiedViewController = segue.destinationViewController as! MagnifiedViewController
        magnifiedViewController.currentPicName = pictureName[i]
        
        // Stop the slideshow if playing.
        if playing == true {
            timer.invalidate()
            playButton.setTitle("再生", forState: UIControlState.Normal)
            forwardButton.enabled = true
            backButton.enabled = true
            playing = false
        }
    }
    
    
    // Back from the second page (the "Magnified" page)
    @IBAction func backFromSecondPage(segue: UIStoryboardSegue) {
    }
}

