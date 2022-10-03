//
//  File.swift
//  JustoTest
//
//  Created by Martin Flores Alvarez on 02/10/22.
//

import UIKit
import Nuke
import NukeExtensions

class PhotoCell: UITableViewCell {
  
  let photoUserImageView = UserImageView()
  
  let nameLabel = UserLabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
    setupLayouts()
  }
  
  private func setupViews() {
    contentView.addSubview(photoUserImageView)
    contentView.addSubview(nameLabel)
  }
  
  private func setupLayouts() {
    photoUserImageView.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      photoUserImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantsImageSizes.horizontalPadding),
      photoUserImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ConstantsImageSizes.verticalPadding),
      photoUserImageView.heightAnchor.constraint(equalToConstant: ConstantsImageSizes.imageUserSize),
      photoUserImageView.widthAnchor.constraint(equalToConstant: ConstantsImageSizes.imageUserSize),
      photoUserImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -ConstantsImageSizes.verticalPadding)
    ])
    NSLayoutConstraint.activate([
      nameLabel.leadingAnchor.constraint(equalTo: photoUserImageView.trailingAnchor, constant: 11),
      nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 11),
      nameLabel.centerYAnchor.constraint(equalTo: photoUserImageView.centerYAnchor),
      nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 11)
    ])
  }
  
  func setup(with picture: Picture, name: Name) {
    
    let options = ImageLoadingOptions(
      placeholder: UIImage(systemName: "person.dash"),
      transition: .fadeIn(duration: 0.1),
      failureImage: UIImage(systemName: "person.dash")
    )
    nameLabel.text = name.first
    
    NukeExtensions.loadImage(with: picture.thumbnail, options: options, into: photoUserImageView) { result in
      switch result {
      case .failure(let error):
        self.photoUserImageView.image =  UIImage(systemName: "person.dash")
        print(error)
      case .success(_):
        NukeExtensions.loadImage(with: picture.large, options: options, into: self.photoUserImageView)
      }
    }
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
