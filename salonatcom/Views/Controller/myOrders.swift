//
//  myOrders.swift
//  salonatcom
//
//  Created by Bassam Ramadan on 9/3/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit

class myOrders: UIViewController {
    let leftbtn = UIButton(); let centerbtn = UIButton(); let rightbtn = UIButton()
    let tableView = UITableView()
    
    var infoOrders = [holdOrders]()
    private var commonSegue : UIStoryboardSegue!
    

    @objc func ButtonClicked(sender : UIButton){
        if sender.titleLabel?.text == "حجوزات مرفوضة" {
            leftbtn.setTitleColor(.red, for: .normal)
            centerbtn.setTitleColor(.black, for: .normal)
            rightbtn.setTitleColor(.black, for: .normal)
            fetchJSON(url: "https://salonatcom-app.com/mobile-app/api/user-orders?status=rejected")
        }else if sender.titleLabel?.text == "حجوزات مؤكدة"{
            leftbtn.setTitleColor(.black, for: .normal)
            centerbtn.setTitleColor(.red, for: .normal)
            rightbtn.setTitleColor(.black, for: .normal)
            fetchJSON(url: "https://salonatcom-app.com/mobile-app/api/user-orders?status=confirmed")
        }else{
            leftbtn.setTitleColor(.black, for: .normal)
            centerbtn.setTitleColor(.black, for: .normal)
            rightbtn.setTitleColor(.red, for: .normal)
            fetchJSON(url: "https://salonatcom-app.com/mobile-app/api/user-orders?status=pending")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  self.commonSegue == segue {
            if let BillOrders = segue.destination as? BillViewController {
                BillOrders.orderId = sender as! Int
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.commonSegue = UIStoryboardSegue(identifier: "BillViewController", source: self, destination: BillViewController()){
            self.commonSegue.source.show(self.commonSegue.destination, sender: self)
        }
        
        title = "حجوزاتي"
        tableView.backgroundColor = UIColor.init(red: 229/255.0, green: 229/255.0, blue: 234/255.0, alpha: 1)
       
       
        let stackView  = UIStackView(arrangedSubviews: [leftbtn , centerbtn , rightbtn])
        setupStackView(stackView: stackView)
        ButtonClicked(sender: rightbtn)
        setupTableView(stackView: stackView)
    }
    fileprivate func setupTableView(stackView : UIStackView){
        tableView.register(statusOrders.self, forCellReuseIdentifier: "myOrders")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor ).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        
    }
    
    fileprivate func setupStackView(stackView : UIStackView){
        leftbtn.backgroundColor = .init(white: 2.5, alpha: 2)
        centerbtn.backgroundColor = .init(white: 2.5, alpha: 2)
        rightbtn.backgroundColor = .init(white: 2.5, alpha: 2)
        leftbtn.setTitle("حجوزات مرفوضة", for: .normal)
        centerbtn.setTitle("حجوزات مؤكدة", for: .normal)
        rightbtn.setTitle("قيد المعاينة", for: .normal)
        
    
        leftbtn.titleLabel?.adjustsFontSizeToFitWidth = true
        centerbtn.titleLabel?.adjustsFontSizeToFitWidth = true
        rightbtn.titleLabel?.adjustsFontSizeToFitWidth = true
        
        let deviceType = UIDevice.current.deviceText
        if deviceType == "iPad" {
            leftbtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
            centerbtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
            rightbtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        }
        
        leftbtn.setTitleColor(.black, for: .normal)
        centerbtn.setTitleColor(.black, for: .normal)
        rightbtn.setTitleColor(.black, for: .normal)
        leftbtn.addTarget(self, action: #selector(self.ButtonClicked(sender:)), for: .touchUpInside)
        centerbtn.addTarget(self, action: #selector(self.ButtonClicked(sender:)), for: .touchUpInside)
        rightbtn.addTarget(self, action: #selector(self.ButtonClicked(sender:)), for: .touchUpInside)
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor ).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 80).isActive = true
      
    }
    fileprivate func fetchJSON(url : String){
        infoOrders.removeAll()
        tableView.reloadData()
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url) {
            (data , response , error) in
            
            if let error = error {
                print("Failed1 " , error)
                return
            }
            guard let data = data else {return}
            
            do{
                let info = try
                    JSONDecoder().decode(MyOrdersdata.self , from: data)
                self.infoOrders = info.data

                print(info.data)
                OperationQueue.main.addOperation {
                     self.tableView.reloadData()
                }
            }catch let error{
                print("Failed2 " , error)
                return
            }
            
            }.resume()
    }

}
extension myOrders : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return infoOrders.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return view.frame.height / 6
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.init(red: 229/255.0, green: 229/255.0, blue: 234/255.0, alpha: 1)
        return headerView
    }
    
    @objc func deleteButton(sender : UIButton){
        infoOrders.remove(at: sender.tag)
        tableView.beginUpdates()
        tableView.deleteSections(IndexSet(integer: sender.tag), with: .automatic)
        tableView.endUpdates()
      
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myOrders", for: indexPath) as! statusOrders
      
        cell.backgroundColor = UIColor.init(red: 229/255.0, green: 229/255.0, blue: 234/255.0, alpha: 1);
        cell.deletIcon.setBackgroundImage(UIImage(named: "remove"), for: .normal)
        cell.dateIcon.image = UIImage(named: "date")
        cell.date.text = infoOrders[indexPath.row].reservation_date
        cell.nameSallon.text = infoOrders[indexPath.row].saloon_info.name
        
        cell.status.text = checkStatus(status: infoOrders[indexPath.row].status)
       // cell.backgroundColor = .yellow
        cell.status.adjustsFontSizeToFitWidth = true
        cell.status.adjustsFontForContentSizeCategory = true
        
        cell.status.textAlignment = .left
        cell.nameSallon.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        cell.date.font = UIFont.boldSystemFont(ofSize: 16.0)
        cell.status.font = UIFont.boldSystemFont(ofSize: 16.0)
        cell.imageSallon.image = UIImage(named: "background")
        cell.tag = indexPath.section
        
        if UIDevice.current.screenType == UIDevice.ScreenType.iPhone_XSMax {
              FixHeight().FontSizeText(Text: cell.nameSallon, Size: 18)
              FixHeight().FontSizeText(Text: cell.date, Size: 14)
            
        }else if UIDevice.current.screenType == UIDevice.ScreenType.iPhones_6Plus_6sPlus_7Plus_8Plus{
            FixHeight().FontSizeText(Text: cell.nameSallon, Size: 15)
            FixHeight().FontSizeText(Text: cell.date, Size: 13)
            
        }else if UIDevice.current.screenType == UIDevice.ScreenType.iPhones_5_5s_5c_SE ||
            UIDevice.current.screenType == UIDevice.ScreenType.iPhones_6_6s_7_8 {
            FixHeight().FontSizeText(Text: cell.nameSallon, Size: 13)
            FixHeight().FontSizeText(Text: cell.date, Size: 11)
            
        }
        let deviceType = UIDevice.current.deviceText
        if deviceType == "iPad"{
            FixHeight().FontSizeText(Text: cell.nameSallon, Size: 30)
            FixHeight().FontSizeText(Text: cell.date, Size: 22)
            FixHeight().FontSizeText(Text: cell.status, Size: 30)
        }
        
        cell.deletIcon.addTarget(self, action: #selector(self.deleteButton(sender:)), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        self.prepare(for: self.commonSegue, sender: infoOrders[indexPath.section].id)
        self.commonSegue.perform()
    }
    fileprivate func checkStatus(status : String)->String{
        let stat : String
        switch status {
        case "pending":
            stat = "قيد المعاينة"
        case "confirmed":
            stat = "تم تأكيد الحجز"
        case "rejected":
            stat = "تم رفض الحجز"
        default:
            stat = ""
        }
        return stat
    }
    
}
extension UIButton {
    func underline() {
        guard let text = self.titleLabel?.text else { return }
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        
        self.setAttributedTitle(attributedString, for: .normal)
    }
}




extension UILabel {
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
    func DynamicHeight(){
        let greet4Height = self.optimalHeight
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: greet4Height)
    }
}
