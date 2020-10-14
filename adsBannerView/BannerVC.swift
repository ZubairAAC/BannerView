//
//  BannerVC.swift
//  BannerWebView
//
//  Created by Amco on 8/13/20.
//  Copyright © 2020 Amco. All rights reserved.
//

import UIKit
import WebKit
import SafariServices
import SVProgressHUD
import Alamofire
import SwiftyJSON




class BannerVC: UIViewController  {
    
    @IBOutlet weak var dateTextF: UITextField!
    
    
     var picker: UIDatePicker?
    let myDatePicker = UIDatePicker()
    
    
    @IBOutlet weak var titleView: UIView!
    
    
    @IBOutlet weak var testImage: UIButton!
    @IBAction func testImage(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destinationVc = vc.instantiateViewController(withIdentifier: "BannerView") as? BannerView
        self.present(destinationVc!, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var testText: UIButton!
    @IBAction func testText(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destinationVc = vc.instantiateViewController(withIdentifier: "BannerDocument") as? BannerDocument
        self.present(destinationVc!, animated: true, completion: nil)
    }
    
    @IBOutlet weak var testRedirect: UIButton!
    @IBAction func testRedirect(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let destinationVc = vc.instantiateViewController(withIdentifier: "PopupView") as? PopupView
        
        self.present(destinationVc!, animated: true, completion: nil)
    }
    
   
    
    @IBOutlet weak var appOfferWall: UIButton!
    @IBAction func appOfferWall(_ sender: Any) {
   
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main)
        let newVc = vc.instantiateViewController(withIdentifier: "AppOfferWal") as? AppOfferWal
        self.present(newVc!, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var appAddBtn: UIButton!
    @IBAction func appAddBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destinationVc = vc.instantiateViewController(withIdentifier: "AvplayerVcNew") as? AvplayerVcNew
        self.present(destinationVc!, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
      
       
       
    }
    override func viewWillAppear(_ animated: Bool) {
//        SVProgressHUD.setContainerView(self.view)
//        SVProgressHUD.setDefaultMaskType(.black)
//        SVProgressHUD.show()
    }
    override func viewDidAppear(_ animated: Bool) {
        //SVProgressHUD.setContainerView(self.view)
       // SVProgressHUD.setDefaultMaskType(.black)
        //SVProgressHUD.show()
    }

    
    
    
    
    
    
   func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
//        SVProgressHUD.dismiss()
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start to load")
        //SVProgressHUD.dismiss()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish to load")
       // SVProgressHUD.dismiss()
    }
    

    @objc func tapDone() {
           if let datePicker = self.dateTextF.inputView as? UIDatePicker { // 2-1
               let dateformatter = DateFormatter()
               dateformatter.dateStyle = .medium
               self.dateTextF.text = dateformatter.string(from: datePicker.date)
           }
           self.dateTextF.resignFirstResponder()
       }
    
    

}
/*
 
 */



extension UITextField {
    
    func setInputViewDatePicker(target: Any, selector: Selector) {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))//1
        datePicker.datePickerMode = .date //2
        self.inputView = datePicker //3
        
        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0)) //4
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) //5
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel)) // 6
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector) //7
        toolBar.setItems([cancel, flexible, barButton], animated: false) //8
        self.inputAccessoryView = toolBar //9
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
}
