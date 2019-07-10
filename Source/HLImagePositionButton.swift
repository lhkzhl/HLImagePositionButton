//
//  HLCustomButton.swift
//  testSwift
//
//  Created by  xueguoxue on 2019/7/2.
//  Copyright © 2019  xueguoxue. All rights reserved.
//

import UIKit

@IBDesignable
class HLImagePositionButton: UIButton {
    public enum ImagePositionType: Int {
        case left
        case right
        case top
        case bottom
    }
    
    private(set) var type:ImagePositionType
    @IBInspectable
    let space:CGFloat
    
    @IBInspectable
    var typeRawValue:Int {
        set {
            if let type = ImagePositionType(rawValue: newValue) {
                self.type = type
            }
        }
        get {
            return type.rawValue
        }
    }
    
    init(type:ImagePositionType = .left,space:CGFloat = 5) {
        self.type = type
        self.space = space
        super.init(frame: CGRect.zero)
        
//        super.init(type: UIButton.ButtonType.custom)
//        super.init(type: .custom)
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        
        self.type = .left
        self.space = 5
        super.init(coder: aDecoder)
    }
    
    
    @available(*,unavailable)
    override var titleEdgeInsets: UIEdgeInsets {
        set {
            super.titleEdgeInsets = newValue
        }
        get {
            return super.titleEdgeInsets
        }
    }
    
    @available(*,unavailable)
    override var imageEdgeInsets: UIEdgeInsets {
        set {
            super.imageEdgeInsets = newValue
        }
        get {
            return super.imageEdgeInsets
        }
    }
    
    
    
    /// 如果buttonType 不为systme imageView 与titleLabel 始终存在
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let imageView = imageView,
        let titleLabel = titleLabel else {
            return
        }
        
        let labelSize = titleLabel.intrinsicContentSize
        let imageSize = imageView.intrinsicContentSize
        
        switch type {
        case .left:
            if isSetTitle() && isSetImage() {
//                titleLabel.frame.origin.x = imageView.frame.maxX + space
                titleLabel.frame.origin.x = frame.width/2 - (labelSize.width + imageSize.width + space)/2
                imageView.frame.origin.x = titleLabel.frame.maxX + space
                
            }
        case .right:
            if isSetTitle() && isSetImage() {
//                titleLabel.frame.origin.x = contentEdgeInsets.left
//                imageView.frame.origin.x = titleLabel.frame.maxX + space
                
                imageView.frame.origin.x = frame.width/2 - (labelSize.width + imageSize.width + space)/2
                titleLabel.frame.origin.x = imageView.frame.maxX + space
            }
        case .top:
            if isSetTitle() && isSetImage() {
//                imageView.frame.origin.y = contentEdgeInsets.top
                imageView.frame.origin.y = frame.height/2 - (labelSize.height + imageSize.height + space)/2
                
                imageView.center.x = frame.width/2
                titleLabel.frame.size = titleLabel.intrinsicContentSize
                titleLabel.frame.origin.y = imageView.frame.maxY + space
                titleLabel.center.x = frame.width/2
            }
        case .bottom:
            if isSetTitle() && isSetImage() {
                titleLabel.frame.size = titleLabel.intrinsicContentSize
//                titleLabel.frame.origin.y = contentEdgeInsets.top
                titleLabel.frame.origin.y = frame.height/2 - (labelSize.height + imageSize.height + space)/2
                
                titleLabel.center.x = frame.width/2
                imageView.frame.origin.y = titleLabel.frame.maxY + space
                imageView.center.x = frame.width/2
            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
        guard let imageView = imageView,
            let titleLabel = titleLabel else {
                return .zero
        }
        
        switch type {
        case .left,.right:
            
            return CGSize(width: super.intrinsicContentSize.width + getRealSpace(), height: super.intrinsicContentSize.height)
        case .top,.bottom:
            if !isSetImage() && !isSetTitle() {
//                backgroundImage(for: <#T##UIControl.State#>)
                // 只设置了背景图片
                return super.intrinsicContentSize
            }
            
            let titleW = titleLabel.intrinsicContentSize.width
            let imageW = imageView.intrinsicContentSize.width
            let titleH = titleLabel.intrinsicContentSize.height
            let imageH = imageView.intrinsicContentSize.height
            
            let contentEdgeWidth = contentEdgeInsets.left + contentEdgeInsets.right
            let contentEdgeHeight = contentEdgeInsets.top + contentEdgeInsets.bottom
            
            return CGSize(width: CGFloat.maximum(titleW, imageW) + contentEdgeWidth, height: titleH + imageH + getRealSpace() + contentEdgeHeight)
        }
    }
    
    
    private func getRealSpace() -> CGFloat {
        if isSetTitle() && isSetImage() {
            return space
        }
        return 0
    }
    
    private func isSetTitle() -> Bool {
        guard let titleLabel = titleLabel else {
                return false
        }
        return titleLabel.text != nil && !titleLabel.text!.isEmpty
    }
    private func isSetImage() -> Bool {
        guard let imageView = imageView else {
            return false
        }
        return imageView.image != nil
    }

}
