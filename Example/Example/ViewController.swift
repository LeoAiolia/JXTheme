//
//  ViewController.swift
//  Example
//
//  Created by jiaxin on 2019/7/10.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import UIKit
import JXTheme

class ViewController: UITableViewController {
    @IBOutlet weak var themeView: UIView!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var themeTextField: UITextField!
    @IBOutlet weak var themeTextView: UITextView!
    @IBOutlet weak var themeImageView: UIImageView!
    @IBOutlet weak var themeLayerContainerView: UIView!
    lazy var themeLayer: CALayer = { CALayer() }()
    @IBOutlet weak var customThemeStyleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshToggleButton()

        themeView.theme.backgroundColor = { (style) -> UIColor in
            if style == .dark {
                return .black
            }else {
                return .blue
            }
        }
        //UIView customization自定义
        themeView.theme.customization = {[weak self] style in
            if style == .dark {
                self?.themeView.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
            }else {
                self?.themeView.bounds = CGRect(x: 0, y: 0, width: 80, height: 80)
            }
        }

        themeLabel.theme.backgroundColor = { (style) -> UIColor in
            if style == .dark {
                return .black
            }else {
                return .white
            }
        }
        themeLabel.theme.textColor = { (style) -> UIColor in
            if style == .dark {
                return .white
            }else {
                return .black
            }
        }

        themeTextField.theme.backgroundColor = { (style) -> UIColor in
            if style == .dark {
                return .black
            }else {
                return .white
            }
        }
        themeTextField.theme.textColor = { (style) -> UIColor in
            if style == .dark {
                return .white
            }else {
                return .black
            }
        }

        themeTextView.theme.backgroundColor = { (style) -> UIColor in
            if style == .dark {
                return .black
            }else {
                return .white
            }
        }
        themeTextView.theme.textColor = { (style) -> UIColor in
            if style == .dark {
                return .white
            }else {
                return .black
            }
        }

        themeImageView.theme.backgroundColor = { (style) -> UIColor in
            if style == .dark {
                return .black
            }else {
                return .white
            }
        }
        themeImageView.theme.image = { (style) -> UIImage in
            if style == .dark {
                return UIImage(named: "catWhite")!
            }else {
                return UIImage(named: "catBlack")!
            }
        }

        themeLayerContainerView.layer.addSublayer(themeLayer)
        themeLayer.theme.backgroundColor = { (style) -> UIColor in
            if style == .dark {
                return .black
            }else {
                return .blue
            }
        }
        //CALayer customization自定义
        themeLayer.theme.customization = { [weak self] style in
            if style == .dark {
                self?.themeLayer.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
            }else {
                self?.themeLayer.bounds = CGRect(x: 0, y: 0, width: 80, height: 80)
            }
        }

        //自定义ThemeStyle示例
        customThemeStyleLabel.theme.backgroundColor = { (style) -> UIColor in
            if style == .dark {
                return .black
            }else if style == .pink {
                return UIColor(red: 255.0/255, green: 192.0/255, blue: 203.0/255, alpha: 1)
            }else {
                return .white
            }
        }
        customThemeStyleLabel.theme.textColor = { (style) -> UIColor in
            if style == .dark {
                return .white
            }else if style == .pink {
                return .white
            }else {
                return .black
            }
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        themeLayer.frame = themeLayerContainerView.bounds
    }

    func refreshToggleButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: ThemeManager.shared.currentThemeStyle.rawValue, style: .plain, target: self, action: #selector(toggleThemeStyle))
    }

    @objc func toggleThemeStyle() {
        if ThemeManager.shared.currentThemeStyle == .dark {
            ThemeManager.shared.themeStyleDidChange(.light)
        }else {
            ThemeManager.shared.themeStyleDidChange(.dark)
        }
        refreshToggleButton()
    }

    @IBAction func togglePinkButtonClicked(_ sender: UIButton) {
        ThemeManager.shared.themeStyleDidChange(.pink)
        refreshToggleButton()
    }
}

//自定义ThemeStyle示例
extension ThemeStyle {
    static let pink = ThemeStyle(rawValue: "pink")
}


//TODO:添加业务示例封装
//enum DQDynamicBackgoundColorLevel {
//    case normal
//    case main
//    case sub
//}
//
//enum DQDynamicTextColorLevel {
//    case normal
//    case mainTitle
//    case subtitle
//}
//
//func dynamicBackgoundColor(level: DQDynamicBackgoundColorLevel) -> DQColorDynamicProvider {
//    switch level {
//    case .normal:
//        return { (style) -> UIColor in
//            if style == .light {
//                return UIColor.black
//            }else {
//                return UIColor.red
//            }
//        }
//    case .main:
//        return { (style) -> UIColor in
//            if style == .light {
//                return UIColor.black
//            }else {
//                return UIColor.red
//            }
//        }
//    case .sub:
//        return { (style) -> UIColor in
//            if style == .light {
//                return UIColor.black
//            }else {
//                return UIColor.red
//            }
//        }
//    }
//}
//
//func dynamicTextColor(level: DQDynamicTextColorLevel) -> DQColorDynamicProvider {
//    switch level {
//    case .normal:
//        return { (style) -> UIColor in
//            if style == .light {
//                return UIColor.white
//            }else {
//                return UIColor.black
//            }
//        }
//    case .mainTitle:
//        return { (style) -> UIColor in
//            if style == .light {
//                return UIColor.white
//            }else {
//                return UIColor.black
//            }
//        }
//    case .subtitle:
//        return { (style) -> UIColor in
//            if style == .light {
//                return UIColor.white
//            }else {
//                return UIColor.black
//            }
//        }
//    }
//}