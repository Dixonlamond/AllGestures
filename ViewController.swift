//
//  ViewController.swift
//  AllGestures
//
//  Created by Lamond Dixon on 8/3/16.
//  Copyright © 2016 Lamond Dixon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tapView: UIButton!
  @IBOutlet weak var pinchView: UIView!
  @IBOutlet weak var rotateView: UIView!
  @IBOutlet weak var swipeView: UIView!
  @IBOutlet weak var longPressView: UIView!
  @IBOutlet weak var panView: UIView!
  
  
  
  
  
  
  var lastRotation = CGFloat()
  let tapRec = UITapGestureRecognizer()
  let pinchRec = UIPinchGestureRecognizer()
  let swipeRec = UISwipeGestureRecognizer()
  let longPressRec = UILongPressGestureRecognizer()
  let rotateRec = UIRotationGestureRecognizer()
  let panRec = UIPanGestureRecognizer()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // set the target of the gesture recognizers for each view.
    tapRec.addTarget(self, action: #selector(ViewController.tappedView))
    pinchRec.addTarget(self, action: #selector(ViewController.pinchedView(_:)))
    swipeRec.addTarget(self, action: #selector(ViewController.swipedView))
    longPressRec.addTarget(self, action: #selector(ViewController.longPressedView))
    rotateRec.addTarget(self, action: #selector(ViewController.rotatedView(_:)))
    panRec.addTarget(self, action: #selector(ViewController.draggedView(_:)))
    
    
    // added the gesture recognizers to the views.
    tapView.addGestureRecognizer(tapRec)
    swipeView.addGestureRecognizer(swipeRec)
    pinchView.addGestureRecognizer(pinchRec)
    longPressView.addGestureRecognizer(longPressRec)
    rotateView.addGestureRecognizer(rotateRec)
    panView.addGestureRecognizer(panRec)
    
    // set the usersInteractionEnabled property of each view & the ones that need multiple touches.
    rotateView.userInteractionEnabled = true
    rotateView.multipleTouchEnabled = true
    
    pinchView.userInteractionEnabled = true
    pinchView.multipleTouchEnabled = true
    
    tapView.userInteractionEnabled = true
    
    swipeView.userInteractionEnabled = true
    
    longPressView.userInteractionEnabled = true
    
    panView.userInteractionEnabled = true
    
    
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  func tappedView() {
    let tapAlert = UIAlertController(title: "Tapped", message: "You just tapped the tap view", preferredStyle: UIAlertControllerStyle.Alert)
    tapAlert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
    self.presentViewController(tapAlert, animated: true, completion: nil)
  }
  
  func swipedView() {
    let tapAlert = UIAlertController(title: "swiped", message: "You just swiped he swipe view", preferredStyle: UIAlertControllerStyle.Alert)
    tapAlert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
      self.presentViewController(tapAlert, animated: true, completion: nil)
  }
  
  func longPressedView() {
    let tapAlert = UIAlertController(title: "Long Pressed", message: "You just long pressed the long press view", preferredStyle: UIAlertControllerStyle.Alert)
    tapAlert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
    self.presentViewController(tapAlert, animated: true, completion: nil)
  }
  
  func rotatedView(sender:UIRotationGestureRecognizer){
    var lastRotation = CGFloat()
    self.view.bringSubviewToFront(rotateView)
    if(sender.state == UIGestureRecognizerState.Ended){
      lastRotation = 0.0;
    }
    let rotation = 0.0 - lastRotation - sender.rotation
    _ = rotateRec.locationInView(rotateView)
    let currentTrans = sender.view!.transform
    let newTrans = CGAffineTransformRotate(currentTrans, rotation)
    sender.view!.transform = newTrans
    lastRotation = sender.rotation
  }
  
  func pinchedView(sender:UIPinchGestureRecognizer){
    self.view.bringSubviewToFront(pinchView)
    sender.view!.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale)
    sender.scale = 1.0
  }
  
  func draggedView(sender:UIPanGestureRecognizer){
    self.view.bringSubviewToFront(sender.view!)
    let translation = sender.translationInView(self.view)
    sender.view!.center = CGPointMake(sender.view!.center.x + translation.x, sender.view!.center.y + translation.y)
    sender.setTranslation(CGPointZero, inView: self.view)
  }
  
  


  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}









