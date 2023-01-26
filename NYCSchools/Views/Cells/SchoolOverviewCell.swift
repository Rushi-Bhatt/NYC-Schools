//
//  SchoolOverviewCell.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/23/23.
//

import Foundation
import UIKit

final class SchoolOverviewCell: UITableViewCell, CellIdentifiable {
    
    private var cardStackView: VStackView = {
        let cardStackView = VStackView()
        return cardStackView
    }()
    
    private var titleLabel: SectionTitleLabel = {
        let titleLabel = SectionTitleLabel()
        return titleLabel
    }()

    private var addressLabel: BodyLabel = {
        let addressLabel = BodyLabel()
        return addressLabel
    }()
    
    private var contactStackView: HStackView = {
        let contactStackView = HStackView()
        return contactStackView
    }()
    
    private var phoneButton: Button = {
        let phoneButton = Button()
        return phoneButton
    }()
    
    private var websiteButton: Button = {
        let websiteButton = Button()
        return websiteButton
    }()

    private var viewModel: SchoolOverviewCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    
    func configure(with viewModel: SchoolOverviewCellViewModel) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.titleLabel
        addressLabel.text = viewModel.addressLabel
        phoneButton.setTitle(viewModel.phoneNumberLabel, for: .normal)
        websiteButton.setTitle(viewModel.websiteLabel, for: .normal)
    }
}

private extension SchoolOverviewCell {

    private func setupAppearance() {
        contentView.backgroundColor = .systemFill
        contentView.layer.borderColor = .init(gray: 100, alpha: 1)
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
    }
    
    private func setupView() {
        
        setupAppearance()
        selectionStyle = .none
        contentView.addSubview(cardStackView)

        [phoneButton, websiteButton].forEach {
            contactStackView.addArrangedSubview($0)
        }
        
        [titleLabel, addressLabel, contactStackView].forEach {
            cardStackView.addArrangedSubview($0)
        }
        
        websiteButton.addTarget(self, action: #selector(onWebsiteTap), for: .touchDown)
        phoneButton.addTarget(self, action: #selector(onPhoneTap), for: .touchDown)
        
        NSLayoutConstraint.activate([
            cardStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cardStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            cardStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cardStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            contactStackView.widthAnchor.constraint(equalTo: cardStackView.widthAnchor),
        ])
    }
    
    @objc private func onWebsiteTap() {
        viewModel?.navigateToWebsite()
    }
    
    @objc private func onPhoneTap() {
        viewModel?.navigateToPhone()
    }
}
