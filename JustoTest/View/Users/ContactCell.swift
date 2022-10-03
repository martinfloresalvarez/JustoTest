//
//  dataUserLabelViewControllerCell.swift
//  JustoTest
//
//  Created by Martin Flores Alvarez on 02/10/22.
//

import UIKit

class ContactCell: UITableViewCell {

  let fullNameLabel = InfoLabel()
  let phoneLabel = InfoLabel()
  let cellLabel = InfoLabel()
  let emailLabel = InfoLabel()
  let genderLabel = InfoLabel()
  let idLabel = InfoLabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
    setupLayouts()
  }
  
  private func setupViews() {
    contentView.addSubview(fullNameLabel)
    contentView.addSubview(phoneLabel)
    contentView.addSubview(cellLabel)
    contentView.addSubview(emailLabel)
    contentView.addSubview(genderLabel)
    contentView.addSubview(idLabel)
  }
  
  private func setupLayouts() {
    fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
    phoneLabel.translatesAutoresizingMaskIntoConstraints = false
    cellLabel.translatesAutoresizingMaskIntoConstraints = false
    emailLabel.translatesAutoresizingMaskIntoConstraints = false
    genderLabel.translatesAutoresizingMaskIntoConstraints = false
    idLabel.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      fullNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantsSpacingDesign.horizontalLabelPadding),
      fullNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ConstantsSpacingDesign.verticalLabelSpacing),
      fullNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantsSpacingDesign.horizontalLabelPadding)
    ])
    NSLayoutConstraint.activate([
      phoneLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor, constant: 0),
      phoneLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: ConstantsSpacingDesign.verticalLabelSpacing),
      phoneLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor)
    ])
    NSLayoutConstraint.activate([
      cellLabel.leadingAnchor.constraint(equalTo: phoneLabel.leadingAnchor, constant: 0),
      cellLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: ConstantsSpacingDesign.verticalLabelSpacing),
      cellLabel.trailingAnchor.constraint(equalTo: phoneLabel.trailingAnchor)
    ])
    NSLayoutConstraint.activate([
      emailLabel.leadingAnchor.constraint(equalTo: cellLabel.leadingAnchor, constant: 0),
      emailLabel.topAnchor.constraint(equalTo: cellLabel.bottomAnchor, constant: ConstantsSpacingDesign.verticalLabelSpacing),
      emailLabel.trailingAnchor.constraint(equalTo: cellLabel.trailingAnchor)
    ])
    NSLayoutConstraint.activate([
      genderLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor, constant: 0),
      genderLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: ConstantsSpacingDesign.verticalLabelSpacing),
      genderLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor)
    ])
    NSLayoutConstraint.activate([
      idLabel.leadingAnchor.constraint(equalTo: genderLabel.leadingAnchor, constant: 0),
      idLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: ConstantsSpacingDesign.verticalLabelSpacing),
      idLabel.trailingAnchor.constraint(equalTo: genderLabel.trailingAnchor),
      idLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -ConstantsSpacingDesign.verticalLabelSpacing)
    ])
  }
  func setup(with results: [Results]) {
    let user = results[0]
    fullNameLabel.text = "Full Name: \(user.name.first) \((user.name.last))"
    phoneLabel.text = "Phone: \(user.phone)"
    cellLabel.text = "Movil: \(user.cell)"
    emailLabel.text = "Email: \(user.email)"
    genderLabel.text = "Gender: \(user.gender)"
    idLabel.text = "\(user.id.name ?? "N/A") | \(user.id.value ?? "S/N")"
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
