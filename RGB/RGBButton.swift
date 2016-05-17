//
//  RGBButton.swift
//  RGB
//
//  Created by 曾偉亮 on 2015/12/9.
//  Copyright © 2015年 TSENG. All rights reserved.
//

import UIKit

class RGBButton: UIButton {

//MARK: - property
//--------------------------
    var m_RGB_R:CGFloat?
    var m_RGB_G:CGFloat?
    var m_RGB_B:CGFloat?
    var m_RGB_A:CGFloat?
    var m_color:UIColor?
    var num:Int = 0
    

//MARK: - override init
//---------------------------
    init(frame: CGRect,color:UIColor) {
        
        super.init(frame: frame)
        self.frame = frame
        self.backgroundColor = color
        m_color = color
        
        //取得RGB的 R,G,B,Aloha各項的值
        let colorComponents = CGColorGetComponents(m_color?.CGColor)
        m_RGB_R = colorComponents[0]//R
        m_RGB_G = colorComponents[1]//G
        m_RGB_B = colorComponents[2]//B
        m_RGB_A = colorComponents[3]//A
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
