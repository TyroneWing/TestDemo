//
//  UIView+Extension.swift
//  04-UIView-Category
//
//  Created by __liangdahong on 16/9/6.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import UIKit

extension UIView {

    /// X
    public var bm_x: CGFloat {
        get{
            return self.frame.origin.x
        }
        set{
            var tempFrame = self.frame
            tempFrame.origin.x = newValue
            self.frame = tempFrame
        }
    }

    /// Y
    public var bm_y: CGFloat {
        get{
            return self.frame.origin.y
        }
        set{
            var tempFrame = self.frame
            tempFrame.origin.y = newValue
            self.frame = tempFrame
        }
    }
    
    /// width
    public var bm_width: CGFloat {
        get{
            return self.frame.size.width
        }
        set{
            var tempFrame = self.frame
            tempFrame.size.width = newValue
            self.frame = tempFrame
        }
    }
    
    /// height
    public var bm_height: CGFloat {
        get{
            return self.frame.size.height
        }
        set{
            var tempFrame = self.frame
            tempFrame.size.height = newValue
            self.frame = tempFrame
        }
    }

    /// size
    public var bm_size: CGSize {
        get{
            return self.frame.size
        }set{
            var tempFrame = self.frame
            tempFrame.size = newValue
            self.frame = tempFrame
        }
    }
    
    /// origin
    public var bm_origin: CGPoint {
        get{
            return self.frame.origin
        }set{
            var tempFrame = self.frame
            tempFrame.origin = newValue
            self.frame = tempFrame
        }
    }

    /// centerX
    public var bm_centerX: CGFloat {
        get{
            return self.center.x
        }set{
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }

    /// centerY
    public var bm_centerY: CGFloat {
        get{
            return self.center.x
        }set{
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
}
