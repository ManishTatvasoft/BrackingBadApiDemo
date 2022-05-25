//
//  UIView+Extension.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 25/05/22.
//

import UIKit


extension UIView {
    
    @IBInspectable
    var borderColor : UIColor {
        get {
            return .white
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable
    var borderWidth : CGFloat {
        get {
            return 0
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var cornerRadius : CGFloat {
        get {
            return 0
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    func getY() -> CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
    
    func getX() -> CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
    
    func dropShadow(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat, radius:CGFloat, opacity:Float){
        
        let shadowPath = UIBezierPath(rect: CGRect(x: x, y: y, width: self.frame.width, height:self.frame.height))
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: width, height: height)
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowPath = shadowPath.cgPath
        self.layer.masksToBounds = false
    }
    
    func addGradientBackground(firstColor: UIColor, secondColor: UIColor){
        
        clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addDisableBackground() {
        clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.lightGray.cgColor, UIColor.lightGray.cgColor]
        gradientLayer.opacity = 0.9
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

//MARK: - UIView extension for toast message
extension UIView{
    enum ToastPosition{
        case top
        case bottom
        case center
    }
    func showToast(message: String, toastAt position: ToastPosition = .bottom, withDuration: Double = 0.2, withDelay: Double = 0.5) {
        let toastContainer = UIView(frame: CGRect())
        toastContainer.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 25;
        toastContainer.clipsToBounds  =  true

        let toastLabel = UILabel(frame: CGRect())
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font.withSize(12.0)
        toastLabel.text = message
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0

        toastContainer.addSubview(toastLabel)
        self.addSubview(toastContainer)

        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false

        let a1 = NSLayoutConstraint(item: toastLabel, attribute: .leading, relatedBy: .equal, toItem: toastContainer, attribute: .leading, multiplier: 1, constant: 15)
        let a2 = NSLayoutConstraint(item: toastLabel, attribute: .trailing, relatedBy: .equal, toItem: toastContainer, attribute: .trailing, multiplier: 1, constant: -15)
        let a3 = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal, toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -15)
        let a4 = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal, toItem: toastContainer, attribute: .top, multiplier: 1, constant: 15)
        toastContainer.addConstraints([a1, a2, a3, a4])
        
        switch position{
        case.top:
            let c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 65)
            let c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -65)
            let c3 = NSLayoutConstraint(item: toastContainer, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 75)
            self.addConstraints([c1, c2, c3])
        case.center:
            let c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 65)
            let c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -65)
            let c3 = NSLayoutConstraint(item: toastContainer, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
            self.addConstraints([c1, c2, c3])
        default:
            let c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 65)
            let c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -65)
            let c3 = NSLayoutConstraint(item: toastContainer, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -75)
            self.addConstraints([c1, c2, c3])
        }
        UIView.animate(withDuration: withDuration, delay: 0.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: withDuration, delay: withDelay, options: .curveEaseOut, animations: {
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
            })
        })
    }
}
