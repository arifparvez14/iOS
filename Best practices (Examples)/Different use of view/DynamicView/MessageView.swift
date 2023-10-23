//
//  MessageView.swift
//  DynamicView
//
//  Created by Muhammad Ariful islam on 4/10/23.
//

import UIKit

class MessageView: UIView {
    
    @IBOutlet weak var infoTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var crossBtn: UIButton!
    @IBOutlet weak var imageHLC: NSLayoutConstraint!
    @IBOutlet weak var imageViewWLC: NSLayoutConstraint!
    var imageViewWidth: CGFloat = 0
    var imageViewHeight: CGFloat = 0
    var textStr = ""
    
    var vc: UIViewController!
    var view: UIView!
    
    init(frame: CGRect, inView: UIViewController, iVWidth: CGFloat, ivHeight: CGFloat, text: String) {
        super.init(frame: frame)
        
        self.imageViewHeight = ivHeight
        self.imageViewWidth = iVWidth
        textStr = text
        
        xibSetup(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        
        setProperty()
    }
    
    func setProperty() {
        imageHLC.constant = self.imageViewHeight
        imageViewWLC.constant = self.imageViewWidth
        
        infoTextView.textContainerInset = UIEdgeInsets.zero
        infoTextView.textContainer.lineFragmentPadding = 0
        infoTextView.isScrollEnabled = false
        infoTextView.textContainer.lineBreakMode = .byTruncatingTail
        infoTextView.text = self.textStr
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func xibSetup(frame: CGRect) {
        self.view = loadNibView()
        view.frame = frame
        addSubview(view)
    }
    
    func loadNibView() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "MessageView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
}


