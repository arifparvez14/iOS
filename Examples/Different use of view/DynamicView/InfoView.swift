//
//  InfoView.swift
//  DynamicView
//
//  Created by Muhammad Ariful islam on 5/10/23.
//

import UIKit



class InfoView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var IVHLC: NSLayoutConstraint!
    @IBOutlet weak var IVWLC: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupXib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupXib()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupXib()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupXib()
    }
    
    func setupView(viewData: PopupViewData) {
        IVHLC.constant = viewData.imageViewHeight
        IVWLC.constant = viewData.imageViewWidth
        
        textView.textContainerInset = UIEdgeInsets.zero
        textView.textContainer.lineFragmentPadding = 0
        textView.isScrollEnabled = false
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.text = viewData.text
    }

    // MARK: - Private Methods

    private func setupXib() {
        
        let view = loadNibView()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    func loadNibView() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "InfoView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    @IBAction func deleteButtonTap(_ sender: Any) {
        
    }
    
}
