//
//  profileViewController.swift
//  salonatcom
//
//  Created by Bassam Ramadan on 9/2/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {
    let tableView = UITableView()
    

    private var commonSegue : UIStoryboardSegue!
    private var settingName = UILabel()
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if self.commonSegue == segue{
            if segue.destination is myOrders{
              
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.commonSegue = UIStoryboardSegue(identifier: "myOrders", source: self, destination: myOrders()){
            self.commonSegue.source.show(self.commonSegue.destination, sender: self)
        }
        
        title = "صفحتي"
        view.backgroundColor = .init(white: 2.5, alpha: 2)
    
        
        let imageProfile = creatImagAndLable().image
        let f  = ProfileCells()
        let s = ProfileCells()
        
        imageProfile.image = UIImage(named: "background")
        imageProfile.layer.cornerRadius = 12
        imageProfile.clipsToBounds = true
        f.imIcon.image = UIImage(named: "userName")
        s.imIcon.image = UIImage(named: "callNum")
        f.label.text = "الأسم"
        s.label.text = "رقم الجوال"
        f.textLabel.text = "بسام رمضان"
        s.textLabel.text =  "01146115636"
        f.textLabel.font =  UIFont(name: "HelveticaNeue-bold", size: 18)
        s.textLabel.font = UIFont(name: "HelveticaNeue-bold", size: 20)
        let rightStack = UIStackView(arrangedSubviews: [f , s])
        rightStack.distribution = .fillEqually
        rightStack.spacing = 15
        rightStack.axis = .vertical
        
        let allStacks = UIStackView(arrangedSubviews: [imageProfile , rightStack])
        allStacks.spacing = 12
        allStacks.distribution = .fillEqually
        
        let TopView = UIView()
        setupTopView(TopView: TopView)
        setupCells( imageProfile: imageProfile ,rightStack: rightStack,allStacks : allStacks, TopView: TopView )
        setupTableView()
        setupSettingName()
    }
    fileprivate func setupSettingName(){
        view.addSubview(settingName)
        settingName.translatesAutoresizingMaskIntoConstraints = false
        settingName.leadingAnchor.constraint(equalTo: tableView.leadingAnchor ).isActive = true
        settingName.trailingAnchor.constraint(equalTo: tableView.trailingAnchor , constant: -18).isActive = true
        settingName.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -10).isActive = true
        settingName.text = "إعدادات الحساب"
        settingName.font = UIFont(name: "HelveticaNeue-bold", size: 18)
        settingName.textAlignment = .right
    }
   
    fileprivate func setupTopView(TopView : UIView){
        view.addSubview(TopView)
        TopView.translatesAutoresizingMaskIntoConstraints = false
        TopView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor ).isActive = true
        TopView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor ).isActive = true
        TopView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        TopView.heightAnchor.constraint(equalTo: view.heightAnchor , multiplier: 0.35).isActive = true
    }
    fileprivate func setupCells(imageProfile : UIImageView  , rightStack : UIStackView ,allStacks : UIStackView  , TopView : UIView ){
        TopView.addSubview(allStacks)
        allStacks.translatesAutoresizingMaskIntoConstraints = false
        allStacks.leadingAnchor.constraint(equalTo: TopView.leadingAnchor , constant: 8).isActive = true
        allStacks.centerYAnchor.constraint(equalTo: TopView.centerYAnchor).isActive = true
        allStacks.trailingAnchor.constraint(equalTo: TopView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        allStacks.heightAnchor.constraint(equalTo: TopView.safeAreaLayoutGuide.heightAnchor , multiplier: 0.80 ).isActive = true
        
        imageProfile.translatesAutoresizingMaskIntoConstraints = false
        imageProfile.widthAnchor.constraint(equalTo: allStacks.widthAnchor, multiplier: 0.30).isActive = true
    }
    fileprivate func setupTableView(){
        tableView.register(PrfileCell.self, forCellReuseIdentifier: "profile")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor ).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor , multiplier: 0.50).isActive = true
    }
}
extension profileViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height =  tableView.frame.height / 3
        return height
    }
    fileprivate func setupCenter(imageService : UIImageView , stringImage : String){
        let centerIcon = UIImageView()
       
    
        let stackV = UIStackView(arrangedSubviews: [UIView() , centerIcon , UIView()])
        stackV.distribution = .fillEqually
        
        imageService.addSubview(stackV)
        stackV.translatesAutoresizingMaskIntoConstraints = false
        stackV.leadingAnchor.constraint(equalTo: imageService.leadingAnchor).isActive = true
        stackV.trailingAnchor.constraint(equalTo: imageService.trailingAnchor).isActive = true
      
       
        centerIcon.translatesAutoresizingMaskIntoConstraints = false
        centerIcon.centerYAnchor.constraint(equalTo: imageService.centerYAnchor).isActive = true
    
        centerIcon.image = UIImage(named: stringImage)
        imageService.layer.cornerRadius = 8
        imageService.clipsToBounds = true
        imageService.layer.borderWidth = 1
        imageService.layer.borderColor = UIColor.white.cgColor
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profile", for: indexPath) as! PrfileCell
   
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.white
        cell.selectedBackgroundView = bgColorView

        switch indexPath.row {
        case 0:
            setupCenter(imageService: cell.imageService, stringImage: "orders")
            cell.nameService.text = "حجوزاتي"
            cell.detailService.text = "جدول مواعيد الحجوزات"
        case 1:
            setupCenter(imageService: cell.imageService, stringImage: "notifcation")
            cell.nameService.text = "التنبيهات والإشعارات"
            cell.detailService.text = "تنبيهات لتأكيد الحجوزات"
        default:
            setupCenter(imageService: cell.imageService, stringImage: "edit")
            cell.nameService.text = "تعديل بياناتي"
            cell.detailService.text = "تعديل بيانات العضوية"
        }
        cell.imageService.backgroundColor = UIColor.init(red: 222/255.0, green: 91/255.0, blue: 167/255.0, alpha: 1)
        cell.nameService.font = UIFont(name:"HelveticaNeue-Bold", size: 12.0)
        cell.icon.setImage(UIImage(named: "arrow"), for: .normal)
        cell.icon.isEnabled = false
        cell.icon.contentHorizontalAlignment = .center
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.row == 0{
            self.prepare(for: self.commonSegue, sender: self)
            self.commonSegue.perform()
        }
    }
    
}
class infoProfile {
    let cell : segCell = {
        let cell = segCell()
        cell.salary.isHidden = true
        return cell
    }()
}
