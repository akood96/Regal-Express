//
//  corner.swift
//  Regal Express
//
//  Created by akood on 5/6/19.
//  Copyright © 2019 akood. All rights reserved.
//

import UIKit

class cornerButton : UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 1/UIScreen.main.nativeScale
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/2
        layer.borderColor = isEnabled ? tintColor.cgColor : UIColor.red.cgColor
    }
}
