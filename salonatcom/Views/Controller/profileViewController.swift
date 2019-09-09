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
        f.textLabel.text = "بسام رمضان علي رضوان محمود شحاته "
        f.textLabel.numberOfLines = 0
        
        FixHeight().DynamicHeight(Label: f.textLabel)
      

        s.textLabel.text =  "01146115636"
        s.textLabel.adjustsFontSizeToFitWidth = true
       
        let rightStack = UIStackView(arrangedSubviews: [f , s])
        rightStack.distribution = .fillEqually
        rightStack.spacing = 15
        rightStack.axis = .vertical
        
        let allStacks = UIStackView(arrangedSubviews: [imageProfile , rightStack])
        allStacks.spacing = 12
        
        let TopView = UIView()
        setupTopView(TopView: TopView)
        setupCells( imageProfile: imageProfile ,rightStack: rightStack,allStacks : allStacks, TopView: TopView )
        setupTableView()
        setupSettingName()
        
        let deviceType = UIDevice.current.deviceText
        if deviceType == "iPad"{
               FixHeight().FontSizeText(Text: f.label, Size: 24)
               FixHeight().FontSizeText(Text: f.textLabel, Size: 28)
               FixHeight().FontSizeText(Text: s.label, Size: 24)
               FixHeight().FontSizeText(Text: s.textLabel, Size: 28)
               FixHeight().FontSizeText(Text: settingName, Size: 30)
        }
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
    //    TopView.backgroundColor = .yellow
    }
    fileprivate func setupCells(imageProfile : UIImageView  , rightStack : UIStackView ,allStacks : UIStackView  , TopView : UIView ){
        TopView.addSubview(allStacks)
        allStacks.translatesAutoresizingMaskIntoConstraints = false
        allStacks.leadingAnchor.constraint(equalTo: TopView.leadingAnchor , constant: 8).isActive = true
        allStacks.centerYAnchor.constraint(equalTo: TopView.centerYAnchor).isActive = true
        allStacks.trailingAnchor.constraint(equalTo: TopView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        allStacks.heightAnchor.constraint(equalTo: TopView.safeAreaLayoutGuide.heightAnchor , multiplier: 0.80 ).isActive = true
        
        imageProfile.translatesAutoresizingMaskIntoConstraints = false
        imageProfile.widthAnchor.constraint(equalTo: allStacks.widthAnchor, multiplier: 0.35).isActive = true
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
        return 4
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height =  tableView.frame.height / 4
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
        cell.imageService.backgroundColor = UIColor.init(red: 222/255.0, green: 91/255.0, blue: 167/255.0, alpha: 1)
        switch indexPath.row {
        case 0:
            setupCenter(imageService: cell.imageService, stringImage: "orders")
            cell.nameService.text = "حجوزاتي"
            cell.detailService.text = "جدول مواعيد الحجوزات"
        case 1:
            setupCenter(imageService: cell.imageService, stringImage: "notifcation")
            cell.nameService.text = "التنبيهات والإشعارات"
            cell.detailService.text = "تنبيهات لتأكيد الحجوزات"
        case 2:
            setupCenter(imageService: cell.imageService, stringImage: "edit")
            cell.nameService.text = "تعديل بياناتي"
            cell.detailService.text = "تعديل بيانات العضوية"
        default:
             cell.nameService.text = "الخروج"
             setupCenter(imageService: cell.imageService, stringImage: "logout")
             cell.detailService.isHidden = true
             cell.icon.isHidden = true
            cell.imageService.backgroundColor = UIColor.brown
        }
        
        
        if UIDevice.current.screenType == UIDevice.ScreenType.iPhone_XSMax {
               FixHeight().FontSizeText(Text: cell.nameService, Size: 18)
               FixHeight().FontSizeText(Text: cell.detailService, Size: 16)
        }else if UIDevice.current.screenType == UIDevice.ScreenType.iPhones_6Plus_6sPlus_7Plus_8Plus{
               FixHeight().FontSizeText(Text: cell.nameService, Size: 16)
               FixHeight().FontSizeText(Text: cell.detailService, Size: 14)
        }else if UIDevice.current.screenType == UIDevice.ScreenType.iPhones_5_5s_5c_SE ||
            UIDevice.current.screenType == UIDevice.ScreenType.iPhones_6_6s_7_8 {
               FixHeight().FontSizeText(Text: cell.nameService, Size: 14)
               FixHeight().FontSizeText(Text: cell.detailService, Size: 12)
        }
        let deviceType = UIDevice.current.deviceText
        if deviceType == "iPad"{
              FixHeight().FontSizeText(Text: cell.nameService, Size: 28)
              FixHeight().FontSizeText(Text: cell.detailService, Size: 24)
        }
       
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
extension UIDevice {
    var iPhoneX: Bool {
        return UIScreen.main.nativeBounds.height == 2436
    }
    var iPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    enum ScreenType: String {
        case iPhones_4_4S = "iPhone 4 or iPhone 4S"
        case iPhones_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
        case iPhones_6_6s_7_8 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
        case iPhones_6Plus_6sPlus_7Plus_8Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
        case iPhones_X_XS = "iPhone X or iPhone XS"
        case iPhone_XR = "iPhone XR"
        case iPhone_XSMax = "iPhone XS Max"
        case unknown
    }
    var screenType: ScreenType {
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhones_4_4S
        case 1136:
            return .iPhones_5_5s_5c_SE
        case 1334:
            return .iPhones_6_6s_7_8
        case 1792:
            return .iPhone_XR
        case 1920, 2208:
            return .iPhones_6Plus_6sPlus_7Plus_8Plus
        case 2436:
            return .iPhones_X_XS
        case 2688:
            return .iPhone_XSMax
        default:
            return .unknown
        }
    }
    var deviceText : String {
        switch UIDevice.current.userInterfaceIdiom{
        case .phone:
            return "iPhone"
            
        case .pad:
            return "iPad"
            
        case .tv:
            return "Apple TV"
            
        default:
            return "Unspecified"
        }
    }
}
extension UILabel {
    var optimalHeight : CGFloat {
        get
        {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude))
            label.numberOfLines = 0
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.font = self.font
            label.text = self.text
            label.sizeToFit()
            return label.frame.height
        }
        
    }
}
class FixHeight{
    func DynamicHeight(Label : UILabel){
        let greet4Height = Label.optimalHeight
        Label.frame = CGRect(x: Label.frame.origin.x, y: Label.frame.origin.y, width: Label.frame.width, height: greet4Height)
    }
     func FontSizeText(Text  : UILabel , Size : Int){
        Text.font = UIFont.boldSystemFont(ofSize: CGFloat(Size))
    }
}
