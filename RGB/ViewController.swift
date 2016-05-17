//
//  ViewController.swift
//  RGB
//
//  Created by 曾偉亮 on 2015/12/8.
//  Copyright © 2015年 TSENG. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

//MARK: - property
//-----------------------------------------------
    var viewNumAry = [UILabel]()//各畫面上的數字編號
    var layerLabel:UILabel?//顯示目前可改變RGB的圖層
    var titleLabel:UILabel?//顯示 R G B A
    
    var sliderR:UISlider?//R滑桿
    var sliderG:UISlider?//G滑桿
    var sliderB:UISlider?//B滑桿
    var sliderA:UISlider?//Alpha滑桿
    var sliderSize:UISlider?//字體大小滑桿
    
    var showR_value:UILabel?//顯示R值
    var showG_value:UILabel?//顯示G值
    var showB_value:UILabel?//顯示B值
    var showA_value:UILabel?//顯示Alpha值
    var showS_value:UILabel?//顯示Size值
    
    var value_R:CGFloat?//R
    var value_G:CGFloat?//G
    var value_B:CGFloat?//B
    var value_A:CGFloat?//Alpha
    var value_S:CGFloat?//Scale
    
    var buttonView:RGBButton?//RGBBt
    var buttonViewAry = [RGBButton]()//RGBBT
    
    var btFontAppear:UIButton?//顯示文字按鈕
    var btFontHide:UIButton?//隱藏文字按鈕
    var btFontName:UIButton?//改變字型按鈕
    var fontNamePickerView:UIPickerView?//選擇字型的pickerView
    var textFontName:String? = "Thonburi" //字型名稱
    var textFontNameIndex:Int? = 4 //字型索引值
    var doneBt:UIButton?
    
    var btNum:Int?//分辨是哪一個 btView
    var btFontNum:Int?//分辨是哪一個 btFont
    var tip:TipViewController?//提示頁面
    var isAppear:Bool = true //初始化時文字有顯示

//MARK: - Normal function
//-----------------------------------------------
    func refreash(frame frame:CGRect){
        
        self.view.frame = frame
        self.view.backgroundColor = UIColor.blackColor()
        
        //viewNumAry (產生數字 1 2 3 編號的 label )
        for i in 1 ..< 4 {
            
            let numLabel:UILabel? = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width/15, height: frame.size.height/20))
            numLabel?.text = "\(i)"
            numLabel?.textColor = UIColor.whiteColor()
            numLabel?.font = UIFont.systemFontOfSize(frame.size.width/15)
            //numLabel?.backgroundColor = UIColor.blueColor()
            numLabel?.textAlignment = NSTextAlignment.Center
            viewNumAry.append(numLabel!)
            self.view.addSubview(numLabel!)
        }
        
        //layerLabel
        layerLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.size.height/32))
        layerLabel?.center = CGPoint(x: frame.size.width/2, y: frame.size.height/12 * 6.4)
        layerLabel?.textAlignment = NSTextAlignment.Center
        layerLabel?.textColor = UIColor.whiteColor()
        layerLabel?.font = UIFont.systemFontOfSize(layerLabel!.frame.height)
        layerLabel?.text = "請選擇圖層"
        self.view.addSubview(layerLabel!)
        
        //transToVertical
        let transToeveertical:CGAffineTransform = CGAffineTransformMakeRotation (CGFloat(M_PI_2*3))
        
        let sliderX:CGFloat = frame.size.width/12 //每條slider的 x 基準
        let titleLabelSize:CGFloat = frame.size.width/15
        let sliderLength:CGFloat = frame.size.height/3//滑桿長度
        
        //MARK: R
        //sliderR
        sliderR = UISlider(frame: CGRect(x: 0.0, y: 0.0, width: sliderLength, height: 50))
        sliderR?.center = CGPoint(x: sliderX, y: frame.size.height/12 * 9.25)
        sliderR?.transform = transToeveertical
        sliderR?.minimumValue = 0.0
        sliderR?.maximumValue = 1.0
        sliderR?.value = 0.5
        sliderR?.tintColor = UIColor.redColor()
        sliderR?.thumbTintColor = UIColor.grayColor()
        sliderR?.addTarget(self, action: #selector(ViewController.sliderAction(_:)), forControlEvents: UIControlEvents.ValueChanged)
       
        self.view.addSubview(sliderR!)
        
        //titleLabel:R
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: titleLabelSize, height: titleLabelSize))
        titleLabel?.center = CGPoint(x: sliderX, y: frame.size.height/12 * 7)
        titleLabel?.text = "R"
        titleLabel?.textColor = UIColor.redColor()
        titleLabel?.font = UIFont.systemFontOfSize(titleLabelSize)
        titleLabel?.textAlignment = NSTextAlignment.Center
        self.view.addSubview(titleLabel!)
        
        //showR_value
        showR_value = UILabel(frame: CGRect(x: 0, y: 0, width: titleLabelSize * 2.0, height: titleLabelSize * 1.5))
        showR_value?.center = CGPoint(x: titleLabel!.center.x, y: frame.size.height/12 * 11.5)
        showR_value?.text = String(format:"%.2f",(sliderR?.value)!)
        showR_value?.textAlignment = NSTextAlignment.Center
        showR_value?.textColor = UIColor.redColor()
        showR_value?.font =  UIFont.systemFontOfSize(titleLabelSize/1.5)
        self.view.addSubview(showR_value!)
        
        //MARK: G
        //sliderG
        sliderG = UISlider(frame: CGRect(x: 0.0, y: 0.0, width: sliderLength, height: 50))
        sliderG?.center = CGPoint(x: sliderX * 3, y: sliderR!.center.y)
        sliderG?.transform = transToeveertical
        sliderG?.minimumValue = 0.0
        sliderG?.maximumValue = 1.0
        sliderG?.value = 0.5
        sliderG?.tintColor = UIColor.greenColor()
        sliderG?.thumbTintColor = UIColor.grayColor()
        sliderG?.addTarget(self, action: #selector(ViewController.sliderAction(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(sliderG!)
        
        //titleLabel:G
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: titleLabelSize, height: titleLabelSize))
        titleLabel?.center = CGPoint(x: sliderX * 3, y: frame.size.height/12 * 7)
        titleLabel?.text = "G"
        titleLabel?.textColor = sliderG!.tintColor
        titleLabel?.font = UIFont.systemFontOfSize(titleLabelSize)
        titleLabel?.textAlignment = NSTextAlignment.Center
        self.view.addSubview(titleLabel!)
        
        //showG_value
        showG_value = UILabel(frame: showR_value!.frame)
        showG_value?.center = CGPoint(x: titleLabel!.center.x, y: showR_value!.center.y)
        showG_value?.textColor = sliderG!.tintColor
        showG_value?.textAlignment = NSTextAlignment.Center
        showG_value?.text = String(format:"%.2f",sliderG!.value)
        showG_value?.font = showR_value!.font
        self.view.addSubview(showG_value!)
        
        //MARK: B
        //sliderB
        sliderB = UISlider(frame: CGRect(x: 0.0, y: 0.0, width: sliderLength, height: 50))
        sliderB?.center = CGPoint(x: sliderX * 5, y: sliderR!.center.y)
        sliderB?.transform = transToeveertical
        sliderB?.minimumValue = 0.0
        sliderB?.maximumValue = 1.0
        sliderB?.value = 0.5
        sliderB?.tintColor = UIColor(red: 0.0, green: 0.65, blue: 1.0, alpha: 1.0)
        sliderB?.thumbTintColor = UIColor.grayColor()
        sliderB?.addTarget(self, action: #selector(ViewController.sliderAction(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(sliderB!)
        
        //titleLabel:B
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: titleLabelSize, height: titleLabelSize))
        titleLabel?.center = CGPoint(x: sliderX * 5, y: frame.size.height/12 * 7)
        titleLabel?.text = "B"
        titleLabel?.textColor = sliderB!.tintColor
        titleLabel?.font = UIFont.systemFontOfSize(titleLabelSize)
        titleLabel?.textAlignment = NSTextAlignment.Center
        self.view.addSubview(titleLabel!)
        
        //showB_value
        showB_value = UILabel(frame: showR_value!.frame)
        showB_value?.center = CGPoint(x: titleLabel!.center.x, y: showG_value!.center.y)
        showB_value?.text = String(format:"%.2f",sliderB!.value)
        showB_value?.textAlignment = NSTextAlignment.Center
        showB_value?.textColor = sliderB!.tintColor
        showB_value?.font = showR_value!.font
        self.view.addSubview(showB_value!)
        
        //MARK: A
        //sliderA
        sliderA = UISlider(frame: CGRect(x: 0.0, y: 0.0, width: sliderLength, height: 50))
        sliderA?.center = CGPoint(x: sliderX * 7, y: sliderR!.center.y)
        sliderA?.transform = transToeveertical
        sliderA?.minimumValue = 0.0
        sliderA?.maximumValue = 1.0
        sliderA?.value = 0.5
        sliderA?.tintColor = UIColor.lightGrayColor()
        sliderA?.thumbTintColor = UIColor.grayColor()
        sliderA?.addTarget(self, action: #selector(ViewController.sliderAction(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        self.view.addSubview(sliderA!)
        
        //titleLabel:A
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: titleLabelSize, height: titleLabelSize))
        titleLabel?.center = CGPoint(x: sliderX * 7, y: frame.size.height/12 * 7)
        titleLabel?.text = "A"
        titleLabel?.textColor = UIColor.lightGrayColor()
        titleLabel?.font = UIFont.systemFontOfSize(titleLabelSize)
        titleLabel?.textAlignment = NSTextAlignment.Center
        self.view.addSubview(titleLabel!)
        
        //showA_value
        showA_value = UILabel(frame: showR_value!.frame)
        showA_value?.center = CGPoint(x: titleLabel!.center.x, y: showR_value!.center.y)
        showA_value?.text = String(format:"%.2f",sliderA!.value)
        showA_value?.textAlignment = NSTextAlignment.Center
        showA_value?.textColor = sliderA!.tintColor
        showA_value?.font = showR_value!.font
        self.view.addSubview(showA_value!)
        
        //MARK:Size
        //sliderSize
        sliderSize = UISlider(frame: CGRect(x: 0.0, y: 0.0, width: sliderLength, height: 50))
        sliderSize!.center = CGPoint(x: sliderX * 9, y: sliderR!.center.y)
        sliderSize?.transform = transToeveertical
        sliderSize?.minimumValue = 10.0
        sliderSize?.maximumValue = 45.0
        value_S = 27.0
        sliderSize?.value = Float(value_S!)
        sliderSize?.tintColor = UIColor.orangeColor()
        sliderSize?.thumbTintColor = UIColor.grayColor()
        sliderSize?.addTarget(self, action: #selector(ViewController.textScale(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(sliderSize!)
        
        //titleLabel:size
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: titleLabelSize * 1.68, height: titleLabelSize))
        titleLabel?.center = CGPoint(x: sliderX * 9, y: frame.size.height/12 * 7)
        titleLabel?.text = "Size"
        titleLabel?.textColor = UIColor.orangeColor()
        titleLabel?.font = UIFont.systemFontOfSize(titleLabelSize)
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.textAlignment = NSTextAlignment.Center
        self.view.addSubview(titleLabel!)
        
        //showS_value
        showS_value = UILabel(frame: showR_value!.frame)
        showS_value!.center = CGPoint(x: titleLabel!.center.x, y: showR_value!.center.y)
        showS_value?.textAlignment = NSTextAlignment.Center
        showS_value?.textColor = UIColor.orangeColor()
        showS_value?.font = showR_value!.font
        showS_value?.text = String(format:"%i",Int(sliderSize!.value))
        self.view.addSubview(showS_value!)
        
        //畫面上半部遮罩
        let view:UIView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height/2))
        view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(view)
        
        //MARK: RGBButton(生成 3 個 Bt)
        for i in 0 ..< 3 {
            
            buttonView = RGBButton(frame: CGRect(x: 0, y: 0, width: frame.size.width / CGFloat(i+1), height: frame.size.height/CGFloat((i+1)*2)), color: UIColor(red: 0.0, green: 0.1*CGFloat(i+1), blue: 0.25*CGFloat(i+1), alpha: 0.25*CGFloat(i+1)))
            buttonView?.center = CGPoint(x: frame.size.width/2, y: frame.size.height/4)
            buttonView?.addTarget(self, action:#selector(ViewController.btViewAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(buttonView!)
            buttonViewAry.append(buttonView!)
        }
        
        //修改buttonView[1]的 frame 大小
        buttonViewAry[1].frame = CGRect(x: 0, y: 0, width: buttonViewAry[0].frame.size.width / 1.5, height: buttonViewAry[0].frame.size.height / 1.8)
        buttonViewAry[1].center = CGPoint(x: buttonViewAry[0].center.x, y: buttonViewAry[0].center.y)
        
        //修改buttonViewAry[2]的 frame 的大小 且只顯示文字
        buttonViewAry[2].frame = CGRect(x: 0, y: 0, width: buttonViewAry[1].frame.size.width / 1.25, height: buttonViewAry[1].frame.size.height / 2)
        buttonViewAry[2].center = CGPoint(x: buttonViewAry[0].center.x, y: buttonViewAry[0].center.y)
        buttonViewAry[2].setTitleColor(UIColor(red: buttonViewAry[2].m_RGB_R!, green: buttonViewAry[2].m_RGB_G! , blue: buttonViewAry[2].m_RGB_B! , alpha: buttonViewAry[2].m_RGB_A! ), forState: UIControlState.Normal)
        buttonViewAry[2].backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        buttonViewAry[2].setTitle("Text123", forState: UIControlState.Normal)
        buttonViewAry[2].titleLabel?.font = UIFont(name: textFontName!, size: value_S!)
        buttonViewAry[2].titleLabel?.adjustsFontSizeToFitWidth = true
        buttonViewAry[2].titleLabel?.textAlignment = NSTextAlignment.Center

        //set bt.num
        buttonViewAry[0].num = 0
        buttonViewAry[1].num = 1
        buttonViewAry[2].num = 2
        
        //MARK: btFontThin
        btFontAppear = UIButton(frame: CGRect(x: 0, y: 0, width: frame.size.width/10, height: sliderLength/3 ))
        btFontAppear?.center = CGPoint(x: sliderX * 11, y: self.view.frame.size.height/12*7)
        btFontAppear?.layer.cornerRadius = 17.0
        btFontAppear?.backgroundColor = UIColor.darkGrayColor()
        btFontAppear?.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        btFontAppear?.setTitle("顯示", forState: UIControlState.Normal)
        btFontAppear?.titleLabel?.font = UIFont.systemFontOfSize(btFontAppear!.frame.size.height/5)
        btFontAppear?.addTarget(self, action: #selector(ViewController.btFontAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btFontAppear?.tag = 0
        self.view.addSubview(btFontAppear!)

        //MARK: btFontBold
        btFontHide = UIButton(frame: btFontAppear!.frame)
        btFontHide?.center = CGPoint(x: btFontAppear!.center.x, y: self.view.frame.size.height/12*9)
        btFontHide?.layer.cornerRadius = btFontAppear!.layer.cornerRadius
        btFontHide?.backgroundColor = btFontAppear!.backgroundColor
        btFontHide?.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        btFontHide?.setTitle("隱藏", forState: UIControlState.Normal)
        btFontHide?.titleLabel?.font = UIFont.systemFontOfSize(btFontHide!.frame.size.height/5)
        btFontHide?.addTarget(self, action: #selector(ViewController.btFontAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btFontHide?.tag = 1
        self.view.addSubview(btFontHide!)
        
        //MARK:btFontName
        btFontName = UIButton(frame: btFontAppear!.frame)
        btFontName?.center = CGPoint(x: btFontAppear!.center.x, y: self.view.frame.size.height/12*11)
        btFontName?.layer.cornerRadius = btFontAppear!.layer.cornerRadius
        btFontName?.backgroundColor = btFontAppear!.backgroundColor
        btFontName?.setTitle("字型", forState: UIControlState.Normal)
        btFontName?.titleLabel?.adjustsFontSizeToFitWidth = true
        btFontName?.titleLabel?.font = UIFont.systemFontOfSize(btFontName!.frame.size.height/5)
        btFontName?.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        btFontName?.addTarget(self, action: #selector(ViewController.btFontAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btFontName?.tag = 2
        self.view.addSubview(btFontName!)

        //Can't action berfore any bt pressed
        sliderR?.enabled = false
        sliderG?.enabled = false
        sliderB?.enabled = false
        sliderA?.enabled = false
        sliderSize?.enabled = false
        btFontAppear?.enabled = false
        btFontHide?.enabled = false
        btFontName?.enabled = false
        
        btFontNum = 0//先預設顯示
        
        //MARK:tipBt
        //小提示按鍵
        let tipBt:UIButton = UIButton(type: UIButtonType.InfoLight)
        tipBt.center = CGPoint(x: showR_value!.center.x , y: layerLabel!.center.y)
        tipBt.addTarget(self, action: #selector(ViewController.tipBtAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        tipBt.tintColor = UIColor.yellowColor()
        self.view.addSubview(tipBt)
        
    }
    
    
//MARK: - btViewAction
//-----------------------------------------------
    func btViewAction(btView:RGBButton) {
        
        sliderR?.enabled = true
        sliderG?.enabled = true
        sliderB?.enabled = true
        sliderA?.enabled = true
        
        if btView.num == 0 {
            
            self.onHidePickerViewAction(buttonViewAry[0])
            self.onFontBtAllFalse()
            self.thumbColor()
            layerLabel?.text = "背 景"
            self.getCurrentRGBValue(buttonViewAry[0])
            btNum = 0
        }
        else if btView.num == 1 {
            
            self.onHidePickerViewAction(buttonViewAry[1])
            self.onFontBtAllFalse()
            self.thumbColor()
            layerLabel?.text = "底 層"
            self.getCurrentRGBValue(buttonViewAry[1])
            btNum = 1
        }
        else if btView.num == 2 {
            
            layerLabel?.text = "文字層"
            self.checkHideOrAppear()//判斷文字隱藏還是顯示
            btFontAppear?.enabled = true
            btFontHide?.enabled = true
            
            self.getCurrentRGBValue(buttonViewAry[2])
            btNum = 2
            
            if btFontNum == 0 {
                
                btFontAppear?.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
            }
            else if btFontNum == 1 {
                
                btFontHide?.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
                sliderR?.enabled = false
                sliderG?.enabled = false
                sliderB?.enabled = false
                sliderA?.enabled = false
            }
            
             self.thumbColor()
        }
    }

//MARK: - getCurrentRGBValue
//-----------------------------------------------
    func getCurrentRGBValue(btView:RGBButton){

        sliderR?.value = Float(btView.m_RGB_R!)
        sliderG?.value = Float(btView.m_RGB_G!)
        sliderB?.value = Float(btView.m_RGB_B!)
        sliderA?.value = Float(btView.m_RGB_A!)
        
        //value_R G B A 初始化(第一次執行時)
        value_R = CGFloat(sliderR!.value)
        value_G = CGFloat(sliderG!.value)
        value_B = CGFloat(sliderB!.value)
        value_A = CGFloat(sliderA!.value)
        
        showR_value?.text = String(format:"%.2f",sliderR!.value)
        showG_value?.text = String(format:"%.2f",sliderG!.value)
        showB_value?.text = String(format:"%.2f",sliderB!.value)
        showA_value?.text = String(format:"%.2f",sliderA!.value)
    }
    
//MARK: - sliderAction
//-----------------------------------------------
    func sliderAction(sender:UISlider) {
        
        
        if sender == sliderR  {
            
            sliderR?.value = sender.value
            value_R = CGFloat(sliderR!.value)
            showR_value?.text = String(format:"%.2f",sliderR!.value)
            
        }
        else if sender == sliderG {
            
            sliderG?.value = sender.value
            value_G = CGFloat(sliderG!.value)
            showG_value?.text = String(format:"%.2f",sliderG!.value)
        }
        else if sender == sliderB {
            
            sliderB?.value = sender.value
            value_B = CGFloat(sliderB!.value)
            showB_value?.text = String(format:"%.2f",sliderB!.value)
        }
        else if sender == sliderA {
            
            sliderA?.value = sender.value
            value_A = CGFloat(sliderA!.value)
            showA_value?.text = String(format:"%.2f",sliderA!.value)
        }
        
        
        if btNum == 0 {
            
            self.rgbChange(buttonViewAry[0])
        }
        else if btNum == 1 {
            
            self.rgbChange(buttonViewAry[1])
        }
        else if btNum == 2 {
            
            self.rgbChangeForText(buttonViewAry[2])
        }
        
    }
    
    
//MARK: - rgbChange
//-----------------------------------------------
    func rgbChange(btView:RGBButton) {
        
        btView.backgroundColor = UIColor(red: value_R!, green: value_G!, blue: value_B!, alpha: value_A!)
        
        btView.m_RGB_R = value_R!
        btView.m_RGB_G = value_G!
        btView.m_RGB_B = value_B!
        btView.m_RGB_A = value_A!
    }
    
    func rgbChangeForText(btView:RGBButton) {
        
        btView.setTitleColor(UIColor(red: value_R!, green: value_G!, blue: value_B!, alpha: value_A!), forState: UIControlState.Normal)
        
        btView.m_RGB_R = value_R!
        btView.m_RGB_G = value_G!
        btView.m_RGB_B = value_B!
        btView.m_RGB_A = value_A!
    }
    
//MARK: - textScale
//-----------------------------------------------

    func textScale(sender:UISlider) {
        
        if sender == sliderSize {
            
            value_S = CGFloat(sliderSize!.value)
            
            buttonViewAry[2].titleLabel?.font = UIFont(name: textFontName!, size: value_S!)
            
            showS_value?.text = String(format:"%i",Int(sliderSize!.value))
        }
        
    }
    
//MARK: - btFontAction
//-----------------------------------------------
    func btFontAction(sender:UIButton) {
        
        if sender.tag == 0 {//文字顯示按鈕
            
            isAppear = true
            self.checkHideOrAppear()
            self.thumbColor()
            
            value_S = CGFloat(sliderSize!.value)
            buttonViewAry[2].setTitle("Text123", forState: UIControlState.Normal)
            
            btFontNum = 0
        }
        else if sender.tag == 1 {//文字隱藏按鈕
            
            isAppear = false
            self.checkHideOrAppear()
            self.thumbColor()
            
            value_S = CGFloat(sliderSize!.value)
            buttonViewAry[2].setTitle("", forState: UIControlState.Normal)
            
            btFontNum = 1
        }
        else if sender.tag == 2 {//字型按鈕
            
            btFontName?.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
            self.showPickerView()
        }
        
    }
    
//MARK: - tipBTAction
//-----------------------------------------------
    func tipBtAction(sender:UIButton) {
        
        if tip == nil {
            
            tip = TipViewController()
            tip?.refrashFrame(self.view.frame)
        }
        
        tip?.m_parentObj = self
        self.presentViewController(tip!, animated: true, completion: nil)
    }
    
//MARK: - Hidden Status Bar
//-----------------------------------------------
    override func prefersStatusBarHidden() -> Bool {
        
        return true
    }
    
//MARK: - showPickerView
//-----------------------------------------------
    func showPickerView() {
        
        if fontNamePickerView == nil {
            
            //fontNamePickerView
            fontNamePickerView = UIPickerView(frame: CGRect(x: 0, y: self.view.frame.size.height/10*8, width: self.view.frame.size.width, height: self.view.frame.size.height/2))
            fontNamePickerView?.backgroundColor = UIColor.whiteColor()
            fontNamePickerView!.delegate = self
            fontNamePickerView!.dataSource = self
            fontNamePickerView?.showsSelectionIndicator = true
            fontNamePickerView?.alpha = 0.95
            self.view.addSubview(fontNamePickerView!)
            fontNamePickerView?.selectRow(4, inComponent: 0, animated: true)//初始設定字型"Arial"
        }
        else{
            
            fontNamePickerView?.selectRow(textFontNameIndex!, inComponent: 0, animated: true)
        }
        fontNamePickerView?.userInteractionEnabled = true
        
        let doneBtW:CGFloat = self.view.frame.size.width/8
        let doneBtH:CGFloat = fontNamePickerView!.frame.size.height/13
        let space:CGFloat = 15
        
        if doneBt == nil {
            
            //doneBt
            doneBt = UIButton(frame: CGRect(x: self.view.frame.size.width - doneBtW - space, y: self.view.frame.size.height/10*8 + space, width: doneBtW, height: doneBtH))
            doneBt?.layer.cornerRadius = doneBtH/5
            doneBt?.backgroundColor = UIColor.blueColor()
            doneBt?.setTitle("完成", forState: UIControlState.Normal)
            doneBt?.titleLabel?.font = UIFont.boldSystemFontOfSize(doneBtH*0.68)
            doneBt?.setTitleColor(UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.68), forState: UIControlState.Normal)
            doneBt?.setTitleColor(UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), forState: UIControlState.Highlighted)
            doneBt?.addTarget(self, action: #selector(ViewController.onHidePickerViewAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(doneBt!)
        }
        doneBt?.userInteractionEnabled = true
       
        //顯示pickerView的動畫
        UIView.beginAnimations("showPickerView", context: nil)
        UIView.setAnimationDuration(0.88/1)
        fontNamePickerView?.frame.origin = CGPoint(x: 0, y: self.view.frame.size.height/2)
        doneBt?.frame.origin = CGPoint(x: self.view.frame.size.width - self.view.frame.size.width/8 - space, y: self.view.frame.size.height/2 + space)
        UIView.commitAnimations()

    }
    
//MARK: - onHidePickerViewAction
//-----------------------------------------------
    func onHidePickerViewAction(sender:UIButton) {
        
        if sender == doneBt {
            
            btFontName?.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        }
        else {
            
            btFontName?.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        }
        
        self.performSelector(#selector(ViewController.onHidePickerViewActionDelay), withObject: nil, afterDelay: 0.01)
    }
    
//MARK: - onHidePickerViewActionDelay
//----------------------------------------------
    func onHidePickerViewActionDelay(){
        
        doneBt?.userInteractionEnabled = false
        fontNamePickerView?.userInteractionEnabled = false
        
        //隱藏pickerView的動畫
        UIView.beginAnimations("hidePickerView", context: nil)
        UIView.setAnimationDuration(0.88/1)
        fontNamePickerView?.frame.origin = CGPoint(x: 0, y: self.view.frame.size.height+1)
        doneBt?.frame.origin = CGPoint(x: self.view.frame.size.width - self.view.frame.size.width/8 - 15, y: self.view.frame.size.height + 15 + 1)
        UIView.commitAnimations()
        
    }
    
//MARK: - onFontBtAllFalse 所有更改文字的按鈕都失效
//-----------------------------------------------
    func onFontBtAllFalse() {
        
        btFontHide?.enabled = false
        btFontHide?.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        
        btFontAppear?.enabled = false
        btFontAppear?.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        
        btFontName?.enabled = false
        btFontName?.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        
        sliderSize?.enabled = false
        sliderSize?.thumbTintColor = UIColor.grayColor()

    }
    
//MARK: - checkHideOrAppear 判斷文字顯示或隱藏時的狀態
//-----------------------------------------------
    func checkHideOrAppear() {
        
        if isAppear == true { //文字顯示
    
            sliderR?.enabled = true
            sliderG?.enabled = true
            sliderB?.enabled = true
            sliderA?.enabled = true
            sliderSize?.enabled = true
            btFontName?.enabled = true
            
            sliderSize?.thumbTintColor = sliderSize?.tintColor
            btFontAppear?.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
            btFontHide?.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            btFontName?.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        }
        else { //文字隱藏
            
            sliderR?.enabled = false
            sliderG?.enabled = false
            sliderB?.enabled = false
            sliderA?.enabled = false
            sliderSize?.enabled = false
            btFontName?.enabled = false
            
            sliderSize?.thumbTintColor = UIColor.grayColor()
            btFontAppear?.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            btFontHide?.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
            btFontName?.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        }
        
    }
    
//MARK: - thmbCoLor
//-----------------------------------------------
    func thumbColor() {
        
        if sliderR?.enabled == true { //slider 生效時的顏色
            
            sliderR?.thumbTintColor = sliderR?.tintColor
            sliderG?.thumbTintColor = sliderG?.tintColor
            sliderB?.thumbTintColor = sliderB?.tintColor
            sliderA?.thumbTintColor = sliderA?.tintColor
        }
        else { //sliderg 失效時的顏色
            
            sliderR?.thumbTintColor = UIColor.grayColor()
            sliderG?.thumbTintColor = UIColor.grayColor()
            sliderB?.thumbTintColor = UIColor.grayColor()
            sliderA?.thumbTintColor = UIColor.grayColor()
        }

    }
    
    
//MARK: - PickerView Delegate
//-----------------------------------------------
//MARK: DataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return UIFont.familyNames().count
    }
    
//MARK: Delegate
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        
//        return UIFont.familyNames()[row]
//    }
//    
//    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//        
//        let strData = UIFont.familyNames()[row]
//        let m_title = NSMutableAttributedString(string: strData)
//        let range = NSMakeRange(0, m_title.length)
//        
//        if row == textFontNameIndex {
//            
//            m_title.addAttribute(NSForegroundColorAttributeName, value: UIColor.greenColor(), range: range)
//        }else {
//            
//            m_title.addAttributes([NSForegroundColorAttributeName:UIColor.redColor()], range: range)
//        }
//        
//        return m_title
//    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height/12))
        label.text = UIFont.familyNames()[row]
        label.textAlignment = .Center
        label.font = UIFont(name: UIFont.familyNames()[row], size: label.frame.size.height/2)
        label.textColor = UIColor.redColor()
        label.adjustsFontSizeToFitWidth = true
        return label
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        textFontName = UIFont.familyNames()[row]
        textFontNameIndex = row
        buttonViewAry[2].titleLabel?.font = UIFont(name: UIFont.familyNames()[row], size: value_S!)
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return self.view.frame.size.height/12
    }
    
    
}//end class

