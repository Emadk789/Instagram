//
//  Extensions.swift
//  Instagram
//
//  Created by Emad Albarnawi on 15/01/2021.
//

import UIKit

extension UIView {
    var width: CGFloat {
        print("Width midY", self.frame.minX, "The equation", frame.origin.x)
        return self.frame.size.width
    }
    var height: CGFloat {
        return self.frame.size.height
    }
    
    var top: CGFloat {
        return self.frame.origin.y
    }
    
    var buttom: CGFloat {
        print("maxY", self.frame.maxY, "The equation", self.frame.size.height + frame.origin.y)
        return self.frame.maxY
    }
    var right: CGFloat {
        return self.frame.maxX
    }
    var left: CGFloat {
        print("midY", self.frame.minX, "The equation", frame.origin.x)
        return self.frame.midY
    }
    
}

extension String {
    func safeKey() -> String {
        return self.replacingOccurrences(of: "@", with: "-").replacingOccurrences(of: ".", with: "-")
    }
}
