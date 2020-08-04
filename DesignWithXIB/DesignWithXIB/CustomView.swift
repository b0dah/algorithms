//
//  CustomView.swift
//  DesignWithXIB
//
//  Created by Иван Романов on 13.07.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import UIKit

@IBDesignable class CustomView: UIView {
    @IBOutlet weak var label: UILabel!
    
    var view: UIView!
    var XIBName: String = "CustomView"
    
    @IBInspectable var labelText: String {
        
        get {
            return label.text ?? ""
        }
        
        set {
            label.text = newValue
        }
    }
    
    func loadFromXIB() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: XIBName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    func setup() {
        view = loadFromXIB()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
}
