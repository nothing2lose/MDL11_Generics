//
//  TableCells.swift
//  TableTest
//
//  Created by Igors Nemenonoks on 27/08/2017.
//  Copyright © 2017 Chili. All rights reserved.
//

import UIKit

class Custom1View: UIView, ConfigurableCellContainerView {
    
    let label = UILabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        label.translatesAutoresizingMaskIntoConstraints = false
        let cv = self
        cv.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: cv.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: cv.trailingAnchor),
            label.topAnchor.constraint(equalTo: cv.topAnchor),
            label.bottomAnchor.constraint(equalTo: cv.bottomAnchor)
            ])
        self.backgroundColor = UIColor.red.withAlphaComponent(0.5)
    }
    
    final class ViewModel {
        let testString: String = "custom 11"
    }
    
    func configure(data: ViewModel) {
        label.text = data.testString
    }
}

class Custom2View: UIView, ConfigurableCellContainerView {
    
    let label = UILabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        label.translatesAutoresizingMaskIntoConstraints = false
        let cv = self
        cv.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: cv.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: cv.trailingAnchor),
            label.topAnchor.constraint(equalTo: cv.topAnchor),
            label.bottomAnchor.constraint(equalTo: cv.bottomAnchor)
            ])
        
        self.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
    }
    
    final class ViewModel {
        let testString: String = "custom 22"
    }
    
    func configure(data: ViewModel) {
        label.text = data.testString
    }
}

class GenericContainerCell<T: ConfigurableCellContainerView>: UITableViewCell, ConfigurableCell {
    typealias ViewType = T
    
    private(set) lazy var view: ViewType = ViewType(frame: .zero)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        
    }

    private func setupView() {
        view.translatesAutoresizingMaskIntoConstraints = false
        //        print(type(of: view))

        #warning("Playground bug. background color.")
        self.backgroundColor = .white

        let cv = contentView
        cv.addSubview(view)
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: cv.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: cv.trailingAnchor),
            view.topAnchor.constraint(equalTo: cv.topAnchor),
            view.bottomAnchor.constraint(equalTo: cv.bottomAnchor)
            ])
    }
}

// MARK: - Default Implementations
//class UserCell: UITableViewCell, ConfigurableCell {
//    @IBOutlet weak var avatarView: UIImageView!
//    @IBOutlet weak var userNameLabel: UILabel!
//
//    func configure(data user: User) {
//        avatarView.image = UIImage(named: user.imageName)
//        userNameLabel.text = user.name
//    }
//}
//
//
//class MessageCell: UITableViewCell, ConfigurableCell {
//    @IBOutlet weak var messageLabel: UILabel!
//
//    func configure(data message: String) {
//        messageLabel.text = message
//    }
//}
//
//
//class ImageCell: UITableViewCell, ConfigurableCell {
//    @IBOutlet weak var pictureView: UIImageView!
//
//    func configure(data url: URL) {
//        if let data = try? Data(contentsOf: url) {
//            self.pictureView.image = UIImage(data: data)
//        }
//    }
//}
//
//class WarningCell: UITableViewCell, ConfigurableCell {
//    @IBOutlet weak var messageLabel: UILabel!
//
//    func configure(data message: String) {
//        messageLabel.text = message
//    }
//}
