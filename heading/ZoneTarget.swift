//
//  ZoneTarget.swift
//  heading
//
//  Created by Eric Dolecki on 6/3/19.
//  Copyright © 2019 Eric Dolecki. All rights reserved.
//

import UIKit

class ZoneTarget: UIView {

    var title: String!
    var tinyCircle:         CAShapeLayer!
    public var outerCircle: CAShapeLayer!
    public var innerCircle: CAShapeLayer!
    
    // Width and height of frame needs to be 0.
    init(frame: CGRect, title s: String) {
        title = s
        super.init(frame: frame)
        generateUI()
    }
    
    private func generateUI()
    {
        tinyCircle = CAShapeLayer()
        tinyCircle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        tinyCircle.position = CGPoint(x: self.layer.bounds.midX, y: self.layer.bounds.midY)
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
        
        self.layer.addSublayer(outerCircle)
        self.layer.addSublayer(innerCircle)
        self.layer.addSublayer(tinyCircle)
        self.layer.addSublayer(tc)
        
        let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 15))
        label1.textColor = UIColor.white.withAlphaComponent(0.5)
        label1.font = UIFont.systemFont(ofSize: 9.0)
        label1.text = self.title
        label1.textAlignment = .center
        label1.center = CGPoint(x: 0, y: 25)
        self.addSubview(label1)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
