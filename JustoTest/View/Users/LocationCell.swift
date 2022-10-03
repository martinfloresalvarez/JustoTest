//
//  dataUserLabelViewControllerCell.swift
//  JustoTest
//
//  Created by Martin Flores Alvarez on 02/10/22.
//

import UIKit
import MapKit

class LocationCell: UITableViewCell, MKMapViewDelegate {
  
  let fullAdressLabel = InfoLabel()
  var latitude = Double()
  var longitude = Double()
  
  let mapView: MKMapView = {
    let map = MKMapView()
    map.overrideUserInterfaceStyle = .light
    return map
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
    setupLayouts()
  }
  
  private func setupViews() {
    contentView.addSubview(fullAdressLabel)
    contentView.addSubview(mapView)
  }
  
  private func setupLayouts() {
    fullAdressLabel.translatesAutoresizingMaskIntoConstraints = false
    mapView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      fullAdressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantsSpacingDesign.horizontalLabelPadding),
      fullAdressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ConstantsSpacingDesign.verticalLabelSpacing),
      fullAdressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ConstantsSpacingDesign.horizontalLabelPadding)
    ])
    NSLayoutConstraint.activate([
      mapView.leadingAnchor.constraint(equalTo: fullAdressLabel.leadingAnchor),
      mapView.topAnchor.constraint(equalTo: fullAdressLabel.bottomAnchor, constant: ConstantsSpacingDesign.verticalLabelSpacing),
      mapView.trailingAnchor.constraint(equalTo: fullAdressLabel.trailingAnchor),
      mapView.heightAnchor.constraint(equalToConstant: 140),
      mapView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -ConstantsSpacingDesign.verticalLabelSpacing)
    ])
    
  }
  
  func setup(with results: [Results]) {
    let user = results[0]
    fullAdressLabel.text = "\(user.location.street.name) \(user.location.street.number) , \(user.location.city) \(user.location.state) \(user.location.country)"
    latitude = Double(user.location.coordinates.latitude)!
    longitude = Double(user.location.coordinates.longitude)!
    addMap()
  }
  
  func addMap() {
    
    let latDelta: CLLocationDegrees = 0.02
    let lonDelta: CLLocationDegrees = 0.02
    let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
    let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    let region = MKCoordinateRegion(center: coordinates, span: span)
    let annotation: MKPointAnnotation = MKPointAnnotation()
    annotation.coordinate = coordinates
    annotation.title = "You are here"
    mapView.setRegion(region, animated: true)
    mapView.addAnnotation(annotation)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
