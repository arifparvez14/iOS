//
//  AddView.swift
//  TryLibrary
//
//  Created by ShareTrip iOS on 2/5/21.
//

import UIKit

public protocol AddViewProtocol {
//    func didCloseAD() {
//        
//    }
}

public class AddView: UIView {
    private let viewModel = AddViewModel(service: AddService())
    private var htmlStr = String()
    public typealias CompletionCallBack = (_ success: Bool?, _ error: String?) -> Void
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.backgroundColor = UIColor.clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        guard let containerView = self.loadNib(name: "AddView") else {return}
        containerView.frame = self.bounds
        self.addSubview(containerView)
        containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        setupView()
    }
    
    func setupView() {
        addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo:leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo:trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    public func load(onCompletion: @escaping CompletionCallBack)  {
        viewModel.loadData() { [weak self] (success, err)  in
            if success {
                self?.htmlStr = self?.viewModel.getHTMLString() ?? ""
                onCompletion(success, nil)
            }
            else {
                self?.htmlStr = self?.viewModel.getHTMLString() ?? ""
                onCompletion(nil, err)
            }
        }
    }
    
    public func show() {
        self.stackView.addArrangedSubview(InterstitialAddView(htmlString: htmlStr) {
            [weak self] crossButtonTap in
            if crossButtonTap {
                
            }
        })
    }
}

extension UIView {
    func loadNib(name: String) -> UIView? {
        let bundleName = Bundle(for: type(of: self))
        let nib = UINib(nibName: name, bundle: bundleName)
        let view = nib.instantiate(withOwner: nil, options: nil).first as! UIView
        return view
    }
}


