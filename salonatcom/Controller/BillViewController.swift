//
//  BillViewController.swift
//  salonatcom
//
//  Created by Bassam Ramadan on 9/2/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit
import SDWebImage

class BillViewController: UIViewController {
    
    var CollectionData =  [orderselected]()

    var sectionHeader = [
        "إجمالي التكلفة","بيانات الصالون","بيانات الإتصال","موعد الحجز","الخدمات المختارة","معلومات الطلب"
    ]
    let tableView = UITableView()
    
    var orderId = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(orderId)
        title = "تفاصيل الطلب"
        
        tableView.delegate = self
        tableView.dataSource = self
        setupTableView()
        
        
        fetchJSON(url: "https://salonatcom-app.com/mobile-app/api/user-orders?status=pending")
        setupTableView()
    }
    
    fileprivate func fetchJSON(url : String){
        print(url)
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
                    JSONDecoder().decode(orderStatus.self , from: data)
                self.CollectionData = info.data
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
    
    fileprivate func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.register(infoRequst.self, forCellReuseIdentifier: "12")
    }
    
}
extension BillViewController : UITableViewDelegate , UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section >= 2 && section <= 4 {
            return 2
        }
        else if section == 5{
            return 1
        }else if section == 1 {
            if CollectionData.count > 0 {
            return self.CollectionData[0].services.count
            }else{
                return 0
            }
        }
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionHeader[5-section]
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "HelveticaNeue-bold", size: 20)
        header.textLabel?.textAlignment = .right
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "12", for: indexPath) as! infoRequst
            cell.info.isHidden = true
            cell.label.isHidden = true
            cell.cells.isHidden = false
            cell.cells.imIcon.isHidden = true
           // image data   >>>> CollectionData[0].services[indexPath.row].image
            cell.cells.name.text = CollectionData[0].services[indexPath.row].name
            cell.cells.salary.text = CollectionData[0].services[indexPath.row].service_cost
            cell.cells.salary.backgroundColor = .red
            cell.cells.time.text = CollectionData[0].services[indexPath.row].service_duration
            cell.cells.imProfile.sd_setImage(with: URL(string: "https://salonatcom-app.com/mobile-app/public/images/saloons/1565002490q47MLtgDHAyY.png" ))
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "12", for: indexPath) as! infoRequst
            cell.info.isHidden = false
            cell.label.isHidden = false
            cell.cells.isHidden = true
            cell.label.text = ""
            cell.info.text = ""
            cell.backgroundColor = .white
            if CollectionData.count > 0 {
                if indexPath.section == 0 {
                    if indexPath.row == 0 {
                        cell.label.text = "رقم الطلب"
                        
                    }
                    else if indexPath.row == 1 {
                        cell.label.text = "تاريخ الطلب"
                        cell.info.text = CollectionData[0].created_at
                    }
                    else if indexPath.row == 2 {
                        cell.label.text = "حالة الطلب"
                    }
                }
                else if indexPath.section == 2 {
                    if indexPath.row == 0 {
                        cell.label.text = "التاريخ"
                        cell.info.text = CollectionData[0].reservation_date
                        cell.info.font = UIFont.boldSystemFont(ofSize: 14)
                    }
                    else if indexPath.row == 1 {
                        cell.label.text = "التوقيت"
                        cell.info.text = "\(CollectionData[0].end_time)  : \(CollectionData[0].reservation_time)"
                        cell.info.font = UIFont.boldSystemFont(ofSize: 14)
                    }
                }
                else if indexPath.section == 3 {
                    if indexPath.row == 0 {
                        cell.label.text = "الإسم"
                         cell.info.text = CollectionData[0].user_info.name
                    }
                    else if indexPath.row == 1 {
                        cell.label.text = "رقم الجوال"
                        cell.info.text = CollectionData[0].user_info.phone
                        cell.info.font = UIFont.boldSystemFont(ofSize: 14)
                    }
                }else if indexPath.section == 4{
                    if indexPath.row == 0 {
                        cell.label.text = "الإسم"
                        cell.info.text = CollectionData[0].saloon_info.name
                    }
                    else if indexPath.row == 1 {
                        cell.label.text = "رقم الجوال"
                        cell.info.text = CollectionData[0].saloon_info.phone
                        cell.info.font = UIFont.boldSystemFont(ofSize: 14)
                    }
                }
            
            }
             return cell
        }
    }
}
class infoRequst : UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stack = UIStackView(arrangedSubviews: [info , label])
        addSubview(stack)
        addSubview(cells)
        setupStack(stack: stack , cells: cells)
        setupLabel(stack: stack, label: label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    fileprivate func setupLabel(stack : UIStackView , label : UILabel){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant:
            8).isActive = true
        label.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    fileprivate func setupStack(stack : UIStackView , cells : segCell){
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant:
            8).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        stack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant:
            8).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
        cells.translatesAutoresizingMaskIntoConstraints = false
        cells.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant:
            8).isActive = true
        cells.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        cells.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant:
            8).isActive = true
        cells.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
    }
    let cells : segCell = {
       let cell = segCell()
       return cell
    }()
    let label : UILabel = {
        let lb = UILabel()
        lb.textAlignment = .right
        lb.font = lb.font.withSize(20)
        return lb
    }()
    let info : UILabel = {
        let lb = UILabel()
        lb.textAlignment = .right
        lb.font = lb.font.withSize(16)
        return lb
    }()
}
