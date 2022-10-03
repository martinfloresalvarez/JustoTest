//
//  dataUserLabelViewControllerCell.swift
//  JustoTest
//
//  Created by Martin Flores Alvarez on 02/10/22.
//

import UIKit

class AccountCell: UITableViewCell {

  let idLabel = InfoLabel()
  let emailLabel = InfoLabel()
  let userLabel = InfoLabel()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
    setupLayouts()
  }
  
  private func setupViews() {
    contentView.addSubview(idLabel)
    contentView.addSubview(emailLabel)
    contentView.addSubview(userLabel)
  }
  
  private func setupLayouts() {
    idLabel.translatesAutoresizingMaskIntoConstraints = false
    emailLabel.translatesAutoresizingMaskIntoConstraints = false
    userLabel.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantsSpacingDesign.horizontalLabelPadding),
      idLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ConstantsSpacingDesign.verticalLabelSpacing),
      idLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ConstantsSpacingDesign.horizontalLabelPadding)
    ])
    NSLayoutConstraint.activate([
      emailLabel.leadingAnchor.constraint(equalTo: idLabel.leadingAnchor, constant: 0),
      emailLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: ConstantsSpacingDesign.verticalLabelSpacing),
      emailLabel.trailingAnchor.constraint(equalTo: idLabel.trailingAnchor)
    ])
    NSLayoutConstraint.activate([
      userLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor, constant: 0),
      userLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: ConstantsSpacingDesign.verticalLabelSpacing),
      userLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
      userLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -ConstantsSpacingDesign.verticalLabelSpacing)
    ])
  }
  func setup(with results: [Results]) {
    let user = results[0]

    idLabel.text = "ID: \(user.login.uuid)"
    emailLabel.text = "Email: \(user.email)"
    userLabel.text = "User: \(user.login.username)"

  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
