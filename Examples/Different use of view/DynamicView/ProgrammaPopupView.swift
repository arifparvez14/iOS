//
//  ProgrammaPopupView.swift
//  DynamicView
//
//  Created by Muhammad Ariful islam on 5/10/23.
//

import UIKit

struct PopupViewData {
    var imageViewWidth: CGFloat
    var imageViewHeight: CGFloat
    var text: String
}

class PopupView: UIView {
    var callbackClosure: ((Bool) -> Void)?
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 4.0
        view.clipsToBounds = true
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "picture")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "remove"), for: .normal)
        //button.tintColor = UIColor.blueGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.frame = label.frame.inset(by: UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100))
        label.backgroundColor = .red
        label.lineBreakMode = .byTruncatingTail
        //label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - initializer
    init(frame: CGRect, viewData: PopupViewData, callbackClosure: ((Bool) -> Void)?) {
        self.callbackClosure = callbackClosure
        super.init(frame: frame)
        setupView(with: viewData)
    }

    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView(with: nil)
    }

    // initWithFrame to init view from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView(with: nil)
    }
    
    private func setupView(with viewData: PopupViewData? = nil) {

        addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(closeButton)
        containerView.addSubview(infoLabel)
        

        backgroundColor = UIColor(redInt: 4, greenInt: 4, blueInt: 15, alpha: 0.8)
        closeButton.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        

        if UIScreen.main.bounds.size.width * 0.9 > 400 {
            containerView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        } else {
            containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        }
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2.0),
            closeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -2.0),
            closeButton.widthAnchor.constraint(equalToConstant: 24.0),
            closeButton.heightAnchor.constraint(equalToConstant: 24.0)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            imageView.widthAnchor.constraint(equalToConstant: viewData?.imageViewWidth ?? 100),
            imageView.heightAnchor.constraint(equalToConstant: viewData?.imageViewHeight ?? 100)
        ])
        
        NSLayoutConstraint.activate([
            infoLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 0),
            infoLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -26.0),
            infoLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            infoLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 8)
        ])
        

        if let viewData = viewData {
            infoLabel.text = viewData.text
        }
    }

    @objc func closeButtonTapped(_ sender: Any){
        callbackClosure?(true)
    }
}

extension UIColor {
    convenience init(redInt: Int, greenInt: Int, blueInt: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat(redInt) / 255.0,
            green: CGFloat(greenInt) / 255.0,
            blue: CGFloat(blueInt) / 255.0,
            alpha: alpha
        )
    }
}
