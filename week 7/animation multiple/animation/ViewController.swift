//
//  ViewController.swift
//  animation
//
//  Created by Aileen Pierce on 11/4/14.
//  Copyright (c) 2014 Aileen Pierce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var delta = CGPointMake(12, 4) //initialize the delta to move 12 pixels horizontally, 4 pixels vertically
    var ballRadius = CGFloat() //radius of the ball image
    var timer = NSTimer() //animation timer
    var translation = CGPointMake(0.0, 0.0) //specifies how many pixels the image will move
    var angle:CGFloat=0.0 //roation angle
    
    var bballdelta = CGPointMake(12, 4) //initialize the delta to move 12 pixels horizontally, 4 pixels vertically
    var bballRadius = CGFloat() //radius of the ball image
    var bballtranslation = CGPointMake(0.0, 0.0) //specifies how many pixels the image will move
    var bballangle:CGFloat=0.0 //roation angle

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bballimageView: UIImageView!
    
    @IBAction func sliderMoved(sender: UISlider) {
        timer.invalidate()
        changeSliderValue()
    }
    
    //changes the position of the image view
    func moveImage() {
        let duration=Double(slider.value)
        //tennis ball
        UIView.beginAnimations("tennis_ball", context: nil)
        UIView.animateWithDuration(duration, animations:
            {self.imageView.transform=CGAffineTransformMakeRotation(self.angle)
            self.imageView.center = CGPointMake(self.imageView.center.x + self.delta.x, self.imageView.center.y + self.delta.y)
            })
        UIView.commitAnimations()
        angle += 0.02 //amount you increase the angle
        //if it's a full rotation reset the angle
        if angle > CGFloat(2*M_PI){
            angle=0
        }
        if imageView.center.x > self.view.bounds.size.width-ballRadius || imageView.center.x < ballRadius{
            delta.x = -delta.x
        }
        if imageView.center.y  > self.view.bounds.size.height - ballRadius || imageView.center.y  < ballRadius {
            delta.y = -delta.y
        }
        //baseball
        UIView.beginAnimations("baseball", context: nil)
        UIView.animateWithDuration(duration, animations:
            {self.bballimageView.transform=CGAffineTransformMakeRotation(self.bballangle)
                self.bballimageView.center = CGPointMake(self.bballimageView.center.x + self.bballdelta.x, self.bballimageView.center.y + self.bballdelta.y)
        })
        UIView.commitAnimations()
        bballangle += 0.02 //amount you increase the angle
        //if it's a full rotation reset the angle
        if bballangle > CGFloat(2*M_PI){
            bballangle=0
        }
        if bballimageView.center.x > self.view.bounds.size.width-bballRadius || bballimageView.center.x < bballRadius{
            bballdelta.x = -bballdelta.x
        }
        if bballimageView.center.y  > self.view.bounds.size.height - bballRadius || bballimageView.center.y  < bballRadius {
            bballdelta.y = -bballdelta.y
        }
    }
    
    //updates the timer and label with the current slider value
    @IBAction func changeSliderValue() {
        sliderLabel.text=String(format: "%.2f", slider.value)
        timer = NSTimer.scheduledTimerWithTimeInterval(Double(slider.value), target: self, selector: "moveImage", userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        //ball radius is half the width of the image
        ballRadius=imageView.frame.size.width/2
        bballRadius=bballimageView.frame.size.width/2
        changeSliderValue()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

