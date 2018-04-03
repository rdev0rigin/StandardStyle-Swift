//
//  ViewController.swift
//  standard-style-swift
//
//  Created by Raven on 4/2/18.
//  Copyright © 2018 RDevelopment. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {
    let label = UILabel()
    let textField = UITextField()
    let button = UIButton()
    lazy var ref: DatabaseReference = Database.database().reference()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        Database.database().goOnline()
        // Initialize UI Elements
        label.text = "hello!"
        textField.borderStyle = .roundedRect
        button.setTitle("Set Default Label Text", for: .normal)
        
        textField.delegate = self
        
        button.addTarget(self, action: #selector(ViewController.onButtonPress), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var buttonVals = ref.child("button").observe(.value) { (snapshot) in
            snapshot.value as? [String: String]
            if let value = snapshot.value{
                //there is data available
                let data = value as! [String:Any]
                let buttonColor: String = "background-color"
                print("\(data[buttonColor])")
                self.label.text = data[buttonColor] as? String
            }else{
                //there is no data available. snapshot.value is nil
                print("No data available from snapshot.value!!!!")
            }
        }
    
        self.view.backgroundColor = UIColor(hue: 0.7583, saturation: 1, brightness: 0.59, alpha: 1.0)
        
        // Add label
        label.frame = CGRect(origin: CGPoint(x: 20, y: 40), size: CGSize(width: self.view.frame.width, height: 20))
        self.view.addSubview(label)
        
        // Add textField
        textField.frame = CGRect(origin: CGPoint(x: 20, y: label.frame.maxY + 10
        ), size: CGSize(width: self.view.frame.width - 40, height: 30))
        self.view.addSubview(textField)
        
        // Add button
        button.frame = CGRect(origin: CGPoint(x: 20, y: 100), size: CGSize( width: self.view.frame.width - 40, height: 30))
        
        self.view.addSubview(button)
    }
    
    @objc func onButtonPress() {
        label.text = "Hello!"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        label.text = textField.text
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
