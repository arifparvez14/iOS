//
//  SelfFittedTVCellVC.swift
//  iOSTutorial
//
//  Created by BJIT on 23/3/22.
//

import UIKit

class SelfFittedTVCellVC: UIViewController, UITableViewDataSource {
    @IBOutlet weak var selfFittedTV: UITableView!
    @IBOutlet weak var containerView: UIView!
    var viewTitle: String!

    var text = ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", "", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."]

    var defaultLabelHeight = CGFloat()
    var emptyLabelHeight = CGFloat()
    var firstLabelHeight = CGFloat()
    var lastLabelHeight = CGFloat()
    var isCellFitted = true

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = viewTitle
        setupTVCellHeight()
        selfFittedTV.dataSource = self
        selfFittedTV.register(UINib(nibName: "InfoTVCell", bundle: nil), forCellReuseIdentifier: "InfoTVCell")
    }

    func setupTVCellHeight() {
        defaultLabelHeight = ((containerView.bounds.height * 45) / 100) - 10
        emptyLabelHeight = ((containerView.bounds.height * 10) / 100)

        firstLabelHeight = heightForView(text: text[0], font: .systemFont(ofSize: 17), width: UIScreen.main.bounds.width)

        lastLabelHeight = heightForView(text: text[2], font: .systemFont(ofSize: 17), width: UIScreen.main.bounds.width)

        if firstLabelHeight < defaultLabelHeight && lastLabelHeight < defaultLabelHeight {
            isCellFitted = true
        } else {
            isCellFitted = false
        }
    }

    func heightForView(text: String, font: UIFont, width: CGFloat) -> CGFloat {
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text

        label.sizeToFit()
        return label.frame.height
    }

    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = selfFittedTV.dequeueReusableCell(withIdentifier: "InfoTVCell", for: indexPath) as? InfoTVCell
        cell?.configCell(text: text[indexPath.row])
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return emptyLabelHeight
        }

        if isCellFitted {
            return defaultLabelHeight
        } else {
            return UITableView.automaticDimension
        }
    }
}
