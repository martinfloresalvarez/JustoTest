//
//  File.swift
//  JustoTest
//
//  Created by Martin Flores Alvarez on 02/10/22.
//

import Foundation
import UIKit

class UserTableView: UITableViewController {
  
  var pullControl = UIRefreshControl()
  let activityIndicator = UIActivityIndicatorView(style: .large)
  let button = UIButton.nanigationBarButton()
  var isList = false
  
  var user: [User] = []
  var users: [Users] = []
  var sections: Int = 4
  var elements: Int = 10
  var totalElements: Int = 10

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(PhotoCell.self, forCellReuseIdentifier: "photoCell")
    tableView.register(ContactCell.self, forCellReuseIdentifier: "contactCell")
    tableView.register(LocationCell.self, forCellReuseIdentifier: "locationCell")
    tableView.register(AccountCell.self, forCellReuseIdentifier: "accountCell")
    tableView.separatorStyle = .none
    pullControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
    pullControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
    tableView.addSubview(pullControl)
    button.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
    let barButton = UIBarButtonItem(customView: button)
    self.navigationItem.rightBarButtonItem = barButton
    
    activityIndicator.center = self.view.center
    activityIndicator.hidesWhenStopped = true
    activityIndicator.startAnimating()
    self.view.addSubview(activityIndicator)
    
    loadUser()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    activityIndicator.center = self.view.center
  }
  
  @objc func addTapped() {
    isList.toggle()
    button.setImage(UIImage(systemName: isList ? "person.fill" : "list.dash"), for: .normal)
    loadUser()
  }
  
  func loadUser() {
    let parameters: [String: Any] = ["elements": elements]
    
    DispatchQueue.main.async {

      if self.isList {
      ApiManager.shared.getDataUsers(parameters: parameters) { (response) in

          if self.elements == 10 {
            self.users = [response]
          } else {
            self.users[0].results.append(contentsOf: response.results)
          }
          self.refreshData()
        
      } fail: {
        print("fail")
      }
    } else {
      ApiManager.shared.getDataUser(parameters: parameters) { (response) in
          self.user = [response]
          self.refreshData()
      
      } fail: {
        print("fail")
      }
    }
  
    }
  }
  
  func refreshData() {
      self.pullControl.endRefreshing()
      self.activityIndicator.stopAnimating()
      self.tableView.reloadData()
   }
  
  @objc func refresh(_ sender: AnyObject) {
    loadUser()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if isList && users.count >= 1 {
      return users[0].results.count
    }
    return 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if isList && users.count >= 1 {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as? PhotoCell else {
        fatalError()
      }
      cell.setup(with: users[0].results[indexPath.row].picture, name: users[0].results[indexPath.row].name)
      return cell
    }
    switch indexPath.section {
    case 0:
      
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as? PhotoCell else {
        fatalError()
      }
      
      cell.setup(with: user[0].results[0].picture, name: user[0].results[0].name)
      return cell
      
    case 1:
      
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as? ContactCell else {
        fatalError()
      }
      
      cell.setup(with: user[0].results)
      return cell
      
    case 2:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as? LocationCell else {
        fatalError()
      }
      cell.setup(with: user[0].results)
      return cell
      
    default:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "accountCell", for: indexPath) as? AccountCell else {
        fatalError()
      }
      cell.setup(with: user[0].results)
      return cell
    }
  }
  
  override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    if isList {
      return 1
    }
    if user.count >= 1 {
      return sections
    }
    return 0
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    if isList {
      return "\(totalElements) users random"
    }
    switch section {
    case 0:
      return ""
    case 1:
      return "Contact information"
    case 2:
      return "Location"
    case 3:
      return "Account"
    default:
      return ""
    }
  }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
    let myLabel = UILabel()
    myLabel.frame = CGRect(x: 22, y: 0, width: 320, height: 22)
    myLabel.backgroundColor = .white
    myLabel.font = UIFont.subTitleFont
    myLabel.textColor = UIColor.titleColor
    myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
    let headerView = UIView()
    headerView.addSubview(myLabel)
    return headerView
  }
  
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if isList && users.count >= 1 {
      let lastElement = users[0].results.count - 3
      if indexPath.row == lastElement {
        elements = 3
        totalElements += 3
        loadUser()
      }
    }
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}
