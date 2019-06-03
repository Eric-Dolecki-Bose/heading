//
//  ViewController.swift
//  heading
//
//  Created by Eric Dolecki on 5/28/19.
//  Copyright © 2019 Eric Dolecki. All rights reserved.
//

import UIKit
import CoreGraphics
import Foundation

class ViewController: UIViewController {

    var zone: UIView!
    var zone2: UIView!
    var zones:[UIView] = [UIView]()
    
    var person: UIView!
    var outerCircle: CAShapeLayer!
    var innerCircle: CAShapeLayer!
    var tinyCircle: CAShapeLayer!
    
    var outerCircle2: CAShapeLayer!
    var innerCircle2: CAShapeLayer!
    var tinyCircle2: CAShapeLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateUI()
        evaluateLook()
    }
    
    func generateUI()
    {
        // View need a height and width of zero for things to align properly.
        
        zone = UIView(frame: CGRect(x: 100, y: 200, width: 0, height: 0))
        
        // Create shape layers for the zone.
        
        tinyCircle = CAShapeLayer()
        tinyCircle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        tinyCircle.position = CGPoint(x: zone.layer.bounds.midX, y: zone.layer.bounds.midY)
        tinyCircle.path = UIBezierPath(ovalIn: CGRect(x: -10.0 / 2, y: -10.0 / 2, width: 10.0, height: 10.0)).cgPath
        tinyCircle.fillColor = UIColor.purple.withAlphaComponent(0.2).cgColor
        tinyCircle.strokeColor = UIColor.white.cgColor
        
        let tc = CAShapeLayer()
        tc.path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0),
                               radius: CGFloat(1),
                               startAngle: CGFloat(0),
                               endAngle:CGFloat(Double.pi * 2),
                               clockwise: true).cgPath
        tc.fillColor = UIColor.black.cgColor
        
        // 50px inner radius.
        innerCircle = CAShapeLayer()
        innerCircle.path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0),
                                        radius: CGFloat(50),
                                        startAngle: CGFloat(0),
                                        endAngle:CGFloat(Double.pi * 2),
                                        clockwise: true).cgPath
        innerCircle.fillColor = UIColor.clear.cgColor
        innerCircle.strokeColor = UIColor.white.cgColor
        innerCircle.lineWidth = 1.0
        innerCircle.lineDashPattern = [2,4]
        
        // 100px outer radius.
        outerCircle = CAShapeLayer()
        outerCircle.path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0),
                                        radius: CGFloat(100),
                                        startAngle: CGFloat(0),
                                        endAngle:CGFloat(Double.pi * 2),
                                        clockwise: true).cgPath
        outerCircle.fillColor = UIColor.clear.cgColor
        outerCircle.strokeColor = UIColor.white.cgColor
        outerCircle.lineWidth = 1.0
        outerCircle.lineDashPattern = [2,4]
        
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.byValue = NSNumber(value: 2 * Double.pi)
        rotation.duration = 48
        rotation.repeatCount = Float.infinity
        innerCircle.add(rotation, forKey: "lineRotation")
        outerCircle.add(rotation, forKey: "lineRotation")
        
        zone.layer.addSublayer(outerCircle)
        zone.layer.addSublayer(innerCircle)
        zone.layer.addSublayer(tinyCircle)
        zone.layer.addSublayer(tc)

        let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 15))
        label1.textColor = UIColor.white.withAlphaComponent(0.5)
        label1.font = UIFont.systemFont(ofSize: 9.0)
        label1.text = "ZONE A"
        label1.textAlignment = .center
        label1.center = CGPoint(x: 0, y: 25)
        zone.addSubview(label1)
        
        // =====
        
        zone2 = UIView(frame: CGRect(x: 260, y: 200, width: 0, height: 0))
        
        // Create shape layers for the zone.
        
        tinyCircle2 = CAShapeLayer()
        tinyCircle2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        tinyCircle2.position = CGPoint(x: zone.layer.bounds.midX, y: zone.layer.bounds.midY)
        tinyCircle2.path = UIBezierPath(ovalIn: CGRect(x: -10.0 / 2, y: -10.0 / 2, width: 10.0, height: 10.0)).cgPath
        tinyCircle2.fillColor = UIColor.purple.withAlphaComponent(0.2).cgColor
        tinyCircle2.strokeColor = UIColor.white.cgColor
        
        let tc2 = CAShapeLayer()
        tc2.path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0),
                               radius: CGFloat(1),
                               startAngle: CGFloat(0),
                               endAngle:CGFloat(Double.pi * 2),
                               clockwise: true).cgPath
        tc2.fillColor = UIColor.black.cgColor
        
        // 50px inner radius.
        innerCircle2 = CAShapeLayer()
        innerCircle2.path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0),
                                        radius: CGFloat(50),
                                        startAngle: CGFloat(0),
                                        endAngle:CGFloat(Double.pi * 2),
                                        clockwise: true).cgPath
        innerCircle2.fillColor = UIColor.clear.cgColor
        innerCircle2.strokeColor = UIColor.white.withAlphaComponent(0.5).cgColor
        innerCircle2.lineWidth = 1.0
        innerCircle2.lineDashPattern = [2,4]
        
        // 100px outer radius.
        outerCircle2 = CAShapeLayer()
        outerCircle2.path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0),
                                        radius: CGFloat(100),
                                        startAngle: CGFloat(0),
                                        endAngle:CGFloat(Double.pi * 2),
                                        clockwise: true).cgPath
        outerCircle2.fillColor = UIColor.clear.cgColor
        outerCircle2.strokeColor = UIColor.white.withAlphaComponent(0.5).cgColor
        outerCircle2.lineWidth = 1.0
        outerCircle2.lineDashPattern = [2,4]
        
        let rotation2 = CABasicAnimation(keyPath: "transform.rotation")
        rotation2.byValue = NSNumber(value: 2 * Double.pi)
        rotation2.duration = 48
        rotation2.repeatCount = Float.infinity
        innerCircle2.add(rotation2, forKey: "lineRotation2")
        outerCircle2.add(rotation2, forKey: "lineRotation2")
        
        zone2.layer.addSublayer(outerCircle2)
        zone2.layer.addSublayer(innerCircle2)
        zone2.layer.addSublayer(tinyCircle2)
        zone2.layer.addSublayer(tc2)
        
        let label2 = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 15))
        label2.textColor = UIColor.white.withAlphaComponent(0.5)
        label2.font = UIFont.systemFont(ofSize: 9.0)
        label2.text = "ZONE B"
        label2.textAlignment = .center
        label2.center = CGPoint(x: 0, y: 25)
        zone2.addSubview(label2)
        
        
        
        
        
        zones.append(zone)
        zones.append(zone2)
        
        
        
        
        
        
        
        
        
        // Create the "person" dot.
        // View need a height and width of zero to rotate properly.
        
        person = UIView(frame: CGRect(x: 220, y: 200, width: 0, height: 0))
        
        // Create shape layers for the person.
        
        let p = CAShapeLayer()
        p.path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0),
                              radius: CGFloat(10),
                              startAngle: CGFloat(0),
                              endAngle:CGFloat(Double.pi * 2),
                              clockwise: true).cgPath
        p.fillColor = UIColor.yellow.withAlphaComponent(0.6).cgColor
        p.strokeColor = UIColor.white.withAlphaComponent(0.2).cgColor
        p.lineWidth = 1.0
        
        let pp = CAShapeLayer()
        pp.path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0),
                               radius: CGFloat(1),
                               startAngle: CGFloat(0),
                               endAngle:CGFloat(Double.pi * 2),
                               clockwise: true).cgPath
        pp.fillColor = UIColor.black.cgColor
        
        // to show rotation.
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 0, y: 0))
        linePath.addLine(to: CGPoint(x: 0, y: -10))
        line.path = linePath.cgPath
        line.strokeColor = UIColor.red.cgColor
        pp.addSublayer(line)
        person.layer.addSublayer(p)
        person.layer.addSublayer(pp)
        
        // Now created, add them to the VC view.
        
        self.view.addSubview(zone)
        self.view.addSubview(zone2)
        self.view.addSubview(person)
    }

    func evaluateLook()
    {
        let point1 = CGPoint(x: person.center.x, y: person.center.y)
        let point2 = CGPoint(x: zone.center.x, y: zone.center.y)
        
        var angle = pointPairToBearingDegrees(startingPoint: point1, endingPoint: point2)
        angle = angle + 90 // To put into the correct angle with 0 at the right.
        
        // So this works on the left side of a zone too.
        
        if angle > 360 {
            angle = angle - 360
        }

        // Get the transform rotation of the helmet. it's 0 to 180 right and 0 to -180 left.
        
        let radians = atan2(person.transform.b, person.transform.a)
        var degrees = radians * 180 / .pi
        if degrees < 0 {
            degrees = 360 + degrees
        }
        
        //  TODO: If the zone is directly above, the angle difference doesn't seem to work.
        //  - the difference is on either side of 0° up.
        
        
        
        var ang = 20
        let dist = testDistance(point1: point1, point2: point2)
        if dist <= 100 && dist >= 50 {
            ang = 20
            highlightOutter(bValue: true)
            highlightInner(bValue: false)
        } else if dist <= 50 {
            ang = 35
            highlightOutter(bValue: true)
            highlightInner(bValue: true)
        } else {
            highlightOutter(bValue: false)
            highlightInner(bValue: false)
        }
        
        // Is the person looking towards the zone?
        
        // The zone is above the user, we need to do special math to detect look.
        var difference: CGFloat = 0.0
        if degrees < 15 && angle > 345 {
            difference = 30.0
        } else {
            difference = abs(angle - degrees)
        }
        
        //let difference = abs(angle - degrees)
        if difference < CGFloat(ang) {
            highlightZone(bValue: true)
        } else {
            highlightZone(bValue: false)
        }
    }
    
    // MARK: - Slider Callbacks
    
    // Changes the angle of the peron's view.
    @IBAction func sliderChanged(_ sender: UISlider) {
        person.transform = CGAffineTransform(rotationAngle: CGFloat(sender.value * 2.0 * Float.pi / sender.maximumValue))
        evaluateLook()
    }
    
    // Changes the x position of the person center.
    @IBAction func xSliderChanged(_ sender: UISlider) {
        person.center = CGPoint(x: CGFloat(sender.value), y: person.center.y)
        evaluateLook()
    }
    
    // Changes the y position of the person center.
    @IBAction func ySliderChanged(_ sender: UISlider) {
        person.center = CGPoint(x: person.center.x, y: CGFloat(sender.value))
        evaluateLook()
    }
    
    // MARK: - Utility Methods
    
    func testDistance(point1: CGPoint, point2: CGPoint) -> CGFloat {
        let distance = hypot(point1.x - point2.x, point1.y - point2.y)
        return distance
    }
    
    func highlightInner(bValue:Bool) {
        if bValue {
            innerCircle.fillColor = UIColor.blue.withAlphaComponent(0.4).cgColor
        } else {
            innerCircle.fillColor = UIColor.clear.cgColor
        }
    }
    
    func highlightOutter(bValue: Bool) {
        if bValue {
            outerCircle.fillColor = UIColor.blue.withAlphaComponent(0.2).cgColor
        } else {
            outerCircle.fillColor = UIColor.clear.cgColor
        }
    }
    
    func highlightZone(bValue: Bool) {
        if bValue {
            tinyCircle.fillColor = UIColor.red.withAlphaComponent(0.6).cgColor
            tinyCircle.strokeColor = UIColor.red.cgColor
        } else {
            tinyCircle.fillColor = UIColor.purple.withAlphaComponent(0.2).cgColor
            tinyCircle.strokeColor = UIColor.white.cgColor
        }
    }
    
    func pointPairToBearingDegrees(startingPoint: CGPoint, endingPoint: CGPoint) -> CGFloat {
        let originPoint = CGPoint(x: endingPoint.x - startingPoint.x, y: endingPoint.y - startingPoint.y)
        let bearingRadians = atan2f(Float(originPoint.y), Float(originPoint.x)) // get bearing in radians
        var bearingDegrees = bearingRadians * Float((180 / Double.pi)) // convert to degrees
        bearingDegrees = (bearingDegrees > 0.0 ? bearingDegrees : (360.0 + bearingDegrees)) // correct discontinuity
        return CGFloat(bearingDegrees)
    }
}
