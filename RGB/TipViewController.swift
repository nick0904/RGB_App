//
//  TipViewController.swift
//  RGB
//
//  Created by 曾偉亮 on 2015/12/12.
//  Copyright © 2015年 TSENG. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
    var m_parentObj:ViewController?
    var m_scrollerView:UIScrollView?
    
//MARK: Normal function
//-------------------------------------
    func refrashFrame(frame:CGRect) {
    
        self.view.backgroundColor = UIColor.blackColor()
        
        //m_scrollerView
        m_scrollerView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height/3))
        m_scrollerView?.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        m_scrollerView?.backgroundColor = UIColor.clearColor()
        m_scrollerView?.showsHorizontalScrollIndicator = true
        m_scrollerView?.showsVerticalScrollIndicator = false
        m_scrollerView?.contentSize = CGSize(width: self.view.frame.size.width*1.5, height: self.view.frame.size.height/3)
        m_scrollerView?.bounces = false
        self.view.addSubview(m_scrollerView!)
        
        //內文
        let tipText:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width*1.5, height: self.view.frame.size.height/3))
        tipText.textColor = UIColor.whiteColor()
        tipText.backgroundColor = UIColor.blueColor()
        tipText.textAlignment = NSTextAlignment.Left
        tipText.font = UIFont.systemFontOfSize(tipText.frame.size.width/28)
        tipText.numberOfLines = 0
        tipText.text = " 1. 畫面共有三個圖層: 背景 - 底層 - 文字層\n\n 2. 點擊 背景 與 底層 可更改其 RGB值 及 Alpha值(透明度)\n\n 3. 點擊文字圖層,可更改其 RGB值 - Alpha值 - 文字大小 - 字型"
       
        m_scrollerView?.addSubview(tipText)
        
        //標題
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/3, height: self.view.frame.size.height/20))
        label.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/6)
        label.text = "小 提 示"
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(self.view.frame.size.width/8)
        label.adjustsFontSizeToFitWidth = true
        self.view.addSubview(label)
        
        //返回鍵
        let returnBt:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/2.5, height: self.view.frame.size.height/12.5))
        returnBt.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/12*9.5)
        returnBt.setTitle("返 回", forState: UIControlState.Normal)
        returnBt.backgroundColor = UIColor.orangeColor()
        returnBt.layer.cornerRadius = returnBt.frame.size.width/10
        returnBt.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Highlighted)
        returnBt.addTarget(self, action: #selector(TipViewController.returnBtAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(returnBt)
        
    }
    
//MARK: - btAction
//-------------------------------------
    func returnBtAction(sender:UIButton) {

        if m_parentObj != nil {
            
            m_parentObj?.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
//MARK: - hideStatusBar
//-------------------------------------
    override func prefersStatusBarHidden() -> Bool {
        
        return true
    }
    

}
