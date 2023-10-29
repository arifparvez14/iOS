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
    
    @IBOutlet weak private var spinnerContainerView: UIView!
    @IBOutlet weak private var spinnerView: SpinnerView!
    
    @IBOutlet weak private var imageContainerVew: UIView!
    @IBOutlet weak private var imageView: UIImageView!
    
    @IBOutlet weak private var ivHLC: NSLayoutConstraint!
    @IBOutlet weak private var ivWDL: NSLayoutConstraint!
    
    private enum ViewType: String {
        case spinnerView
        case imageView
    }
    
    private var config: Config?
    
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
        
        //set spinnerView and imageView
        setSpinnerAndImageView()
        
        // set message label
        if config?.hudType == .show {
            config?.message != nil ? (setMessageLabel()) : (messageLabel.isHidden = true)
        } else {
            setMessageLabel()
        }
        
        //set dismiss time
        if config?.hudType != .show {
            if config?.dismissTime != nil {
                DispatchQueue.main.asyncAfter(deadline: .now() + (config?.dismissTime ?? 3.0)) {
                    PPHUD.remove()
                }
            }
        }
        
        //set contendView
        setContendView()
        
        //set maskType
        setMaskType()
        
        //set style
        setStyle()
    }
    
    
    //MARK: - Setters
    private func setSpinnerAndImageView() {
        if config?.hudType == .show {
            setSpinnerView()
            hideSpinnerOrImageView(viewType: .imageView)
        } else {
            if hasStatusImage() != nil {
                hideSpinnerOrImageView(viewType: .spinnerView)
                setImageView()
            } else {
                setSpinnerView()
                hideSpinnerOrImageView(viewType: .imageView)
            }
        }
    }
    
    private func setSpinnerView() {
        spinnerView.lineWidth = 2.0
        spinnerView.spinnerColor = config?.spinnerColor ?? .white
    }
    
    private func setImageView() {
        ivHLC.constant = config?.loaderImageHeight ?? 40.0
        ivWDL.constant = config?.loaderImageWidth ?? 40.0
        imageView.image = getImage()
    }
    
    private func setMaskType() {
        switch config?.maskType {
        case .clear:
            conteinerView.backgroundColor = .clear
        case.black:
            conteinerView.backgroundColor = UIColor.init(red: 46 / 255, green: 46 / 255, blue: 46 / 255, alpha: 1)
        case .gray:
            conteinerView.backgroundColor = UIColor.init(red: 128 / 255, green: 128 / 255, blue: 128 / 255, alpha: 0.5)
        case .none:
            conteinerView.backgroundColor = .clear
        }
    }
    
    private func setContendView() {
        contendView.backgroundColor = config?.loaderBackgroundColor
        contendView.layer.cornerRadius = 13
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
    
    private func setStyle() {
        guard let loaderStyle = config?.loaderStyle else { return }
        
        if loaderStyle == .light {
            messageLabel.textColor = .black
            contendView.backgroundColor = .white
            imageView.tintColor = .black
            spinnerView.spinnerColor = .black
        } else if loaderStyle == .dark {
            messageLabel.textColor = .white
            contendView.backgroundColor = UIColor.init(red: 49/255, green: 49/255, blue: 49/255, alpha: 1)
            imageView.tintColor = .white
            spinnerView.spinnerColor = .white
        }
    }
    
    //MARK: - Getters
    private func hasStatusImage() -> Bool? {
        switch config?.hudType {
        case .show, .none:
            return nil
        case .showWithStatus:
            return config?.loadingImage != nil ? true : nil
        case .showWithSuccess:
            return config?.successImage != nil ? true : nil
        case .showWithError:
            return config?.errorImage != nil ? true : nil
        }
    }
    
    private func hideSpinnerOrImageView(viewType: ViewType) {
        switch viewType {
        case .spinnerView:
            spinnerContainerView.isHidden = true
            spinnerView.isHidden = true
        case .imageView:
            imageView.isHidden = true
            imageContainerVew.isHidden = true
        }
    }
    
    private func getImage() -> UIImage {
        switch config?.hudType {
        case .show, .none:
            return UIImage()
        case .showWithStatus:
            return config?.loadingImage ?? UIImage()
        case .showWithSuccess:
            return config?.successImage ?? UIImage()
        case .showWithError:
            return config?.errorImage ?? UIImage()
        }
    }
    
    //MARK: - Utils
    private func loadNibView() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PathaoProgressHUDView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    private func addTapGestureOnContainerView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.conteinerView.addGestureRecognizer(tap)
        self.conteinerView.isUserInteractionEnabled = true
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        PPHUD.remove()
    }
}
