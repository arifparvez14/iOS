//
//  PPHUD.swift
//  TestPPHUD
//
//  Created by Muhammad Ariful islam on 8/10/23.
//

import UIKit

class PathaoProgressHUDView: UIView {
    
    @IBOutlet private var conteinerView: UIView!
    @IBOutlet weak private var contendView: UIView!
    @IBOutlet weak private var messageLabel: UILabel!
    @IBOutlet weak private var stackView: UIStackView!
    @IBOutlet weak private var imageContainerView: UIView!
    
    private var spinnerView: SpinnerView!
    private var config: Config?
    
    private var statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    //MARK: - Init
    init(frame: CGRect, config: Config?) {
        super.init(frame: frame)
        xibSetup(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        self.config = config
        showHUD()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func xibSetup(frame: CGRect) {
        self.conteinerView = loadNibView()
        conteinerView.frame = frame
        addSubview(conteinerView)
        addTapGestureOnContainerView()
    }
    
    //MARK: - HUD Setup
    private func showHUD() {
        removeAllSubviewFromContainerView()
        
        // set view and image view
        if config?.hudType == .show {
            addSpinnerViewIntoContainerView(with: config?.spinnerColor ?? .black)
        } else {
            let imageName = getImageName()
            
            if let imageName {
                addImageViewIntoContainerView(imageName: imageName, width: config?.loaderImageWidth, height: config?.loaderImageHeight)
            } else {
                stackView.removeArrangedSubview(imageContainerView)
            }
        }
        
        // set message label
        if config?.hudType == .show {
            config?.message != nil ? (setMessageLabel()) : (stackView.removeArrangedSubview(messageLabel))
        } else {
            setMessageLabel()
        }
        
        //set dismiss time
        if config?.hudType != .show {
            if config?.dismissTime != nil {
                DispatchQueue.main.asyncAfter(deadline: .now() + (config?.dismissTime ?? 3.0)) {
                    PPHUD.removeFromTop()
                }
            }
        }
        
        //set contendView
        setContendView()
        
        //setMaskType
        setMaskType()
    }
    
    //MARK: - Add and remove subview
    private func addImageViewIntoContainerView(imageName: String, width: CGFloat?, height: CGFloat?) {
        self.imageContainerView.addSubview(statusImageView)
        
        NSLayoutConstraint.activate([
            statusImageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            statusImageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
            statusImageView.heightAnchor.constraint(equalToConstant: height ?? 40.0),
            statusImageView.widthAnchor.constraint(equalToConstant: width ?? 40.0)
        ])
        
        statusImageView.image = getImage(from: imageName)
    }
    
    private func addSpinnerViewIntoContainerView(with color: UIColor) {
        spinnerView = SpinnerView(frame: .zero)
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        self.imageContainerView.addSubview(spinnerView)
        
        NSLayoutConstraint.activate([
            spinnerView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            spinnerView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
            spinnerView.heightAnchor.constraint(equalToConstant: 50.0),
            spinnerView.widthAnchor.constraint(equalToConstant: 50.0)
        ])
        
        spinnerView.lineWidth = 3.0
        spinnerView.spinnerColor = color
    }
    
    private func removeAllSubviewFromContainerView() {
        func removeAllSubviews() {
            imageContainerView.subviews.forEach { subView in
                subView.removeFromSuperview()
            }
        }
    }
    
    //MARK: - Utils
    private func setMaskType() {
        switch config?.maskType {
        case .clear:
            conteinerView.backgroundColor = .clear
        case.black:
            conteinerView.backgroundColor = UIColor.loaderCustomBackgroundColor()
        case .gray:
            conteinerView.backgroundColor = UIColor.loaderGrayBackgroundColor()
        case .none:
            conteinerView.backgroundColor = .clear
        }
    }
    
    private func setContendView() {
        contendView.backgroundColor = config?.loaderBackgroundColor
        contendView.layer.cornerRadius = 10
    }
    
    private func setMessageLabel() {
        self.messageLabel.text = config?.message
        
        switch config?.hudType {
        case .show:
            messageLabel.textColor = config?.showTextColor
        case .showWithStatus:
            messageLabel.textColor = config?.loadingTextColor
        case .showWithSuccess:
            messageLabel.textColor = config?.successTextColor
        case .showWithError:
            messageLabel.textColor = config?.errorTextColor
        case .none:
            return
        }
    }
    
    private func getImageName() -> String? {
        switch config?.hudType {
        case .show, .none:
            return nil
        case .showWithStatus:
            return config?.loadingImageName
        case .showWithSuccess:
            return config?.successImageName
        case .showWithError:
            return config?.errorImageName
        }
    }
    
    //MARK: - Utils
    private func loadNibView() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PathaoProgressHUDView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    private func getImage(from string: String) -> UIImage {
        return UIImage(named: string) ?? UIImage()
    }
    
    private func addTapGestureOnContainerView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.conteinerView.addGestureRecognizer(tap)
        self.conteinerView.isUserInteractionEnabled = true
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        PPHUD.removeFromTop()
    }
}
