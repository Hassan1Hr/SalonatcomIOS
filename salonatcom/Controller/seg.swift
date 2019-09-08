//
//  seg.swift
//  salonatcom
//
//  Created by Bassam Ramadan on 8/26/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit
var rowsWhichAreChecked = [String]()
var rows = [segCell]()
var tab = [UITableView]()
class seg: UIViewController {
    
    let image : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.image = UIImage(named: "background")
        return iv
    }()
    let leftButton : UIButton = {
       let b = UIButton()
        b.backgroundColor = .white
        b.setTitle("معلومات الصالون", for: .normal)
        b.setTitleColor(.black, for: .normal)
        return b
    }()
    let rightButton : UIButton = {
        let b = UIButton()
        b.backgroundColor = .white
        b.setTitle("خدمات الصالون", for: .normal)
        b.setTitleColor(.black, for: .normal)
        
        return b
    }()
    @objc func buttonClicked(sender: UIButton){
        if sender.titleLabel?.text == "معلومات الصالون" {
            rightButton.setTitleColor(.black, for: .normal)
            leftButton.setTitleColor(.red, for: .normal)
            DispatchQueue.main.async {
                self.tableView.isHidden = true
                self.boot.isHidden = true
                self.view.reloadInputViews()
            }
        }else{
            leftButton.setTitleColor(.black, for: .normal)
            rightButton.setTitleColor(.red, for: .normal)
            DispatchQueue.main.async {
                self.tableView.isHidden = false
                 self.boot.isHidden = false
                self.view.reloadInputViews()
            }
           
        }
    }
    @objc func segueViews(sender : UIButton){
        print(1)
//        self.hidesBottomBarWhenPushed = true
//        let red  = trashServicesTableViewController()
//        navigationController?.pushViewController(red, animated: true)
        self.prepare(for: self.commonSegue, sender: self)
        self.commonSegue.perform()
        
    }
    
    
    private var commonSegue: UIStoryboardSegue!
    let boot = UIView()
    let tableView = sallonServices()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "الصالون"
        tableView.backgroundColor = UIColor.init(red: 242/255.0, green: 242/255.0, blue: 247/255.0, alpha: 1)
        self.commonSegue = UIStoryboardSegue(identifier: "CommonSegue", source: self, destination: trashServicesTableViewController()) {
            self.commonSegue.source.showDetailViewController(self.commonSegue.destination, sender: self)
        }
        
        view.backgroundColor = .white
        
        let stackButton = UIStackView(arrangedSubviews: [leftButton , rightButton])
        stackButton.distribution = .fillEqually
        
        tab.append(tableView)
        let stackall = UIStackView(arrangedSubviews: [image , stackButton])
        stackall.axis = .vertical
        
        
        self.buttonClicked(sender: rightButton)
        leftButton.addTarget(self, action: #selector(self.buttonClicked(sender:)), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(self.buttonClicked(sender:)), for: .touchUpInside)
        
        let imgTime = creatImagAndLable().image
        let imgCart = creatImagAndLable().image
        let button = creatImagAndLable().Button
        let labelTime = creatImagAndLable().label
        let LabelCart = creatImagAndLable().label
        button.addTarget(self, action: #selector(segueViews(sender:)), for: .touchUpInside)
        
        setupStackAll(stackall: stackall, image: image)
      //  setupTableView(tableView: tableView, stackall: stackall)
        
        let Cart = CartBooking()
        let stackFooter = UIStackView(arrangedSubviews: [button , labelTime , imgTime , LabelCart , imgCart])
        Cart.setFeaturesOfSubviewsOfStackFooter(button: button, imgTime: imgTime, imgCart: imgCart, labelTime: labelTime, LabelCart: LabelCart)
        Cart.setupStackFooter(stackFooter : stackFooter , boot : boot)
        Cart.setupboot(boot: boot, view: view)
        setupTableView(tableView: tableView, stackall: stackall)
    }
    fileprivate func setupStackAll(stackall : UIStackView , image : UIImageView){
        view.addSubview(stackall)
        stackall.translatesAutoresizingMaskIntoConstraints = false
        stackall.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackall.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackall.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackall.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor , multiplier: 0.25).isActive = true
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.leadingAnchor.constraint(equalTo: stackall.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: stackall.trailingAnchor).isActive = true
        image.topAnchor.constraint(equalTo: stackall.topAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: stackall.bottomAnchor, constant: -30).isActive = true
    }
    fileprivate func setupTableView(tableView : UITableView , stackall : UIStackView) {
        tableView.register(segCell.self, forCellReuseIdentifier: "SauceCell")
        tableView.dataSource = tableView as? UITableViewDataSource
        tableView.delegate = tableView as? UITableViewDelegate
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: stackall.bottomAnchor, constant: 8).isActive = true
        tableView.bottomAnchor.constraint(equalTo: boot.topAnchor, constant: -1).isActive = true
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if self.commonSegue == segue {
            if let trash = segue.destination as? trashServicesTableViewController{
                  trash.cells = rows
            }
        }
    }
    @objc func addCellClicked(indexPath : IndexPath){
        if let cell = self.tableView.cellForRow(at: indexPath) as? segCell{
            rows.append(cell)
        }
    }
}


class sallonServices : UITableView  , UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let c : String
        switch section {
        case 0:
            c = "خدمات الشعر"
            return c
        case 1:
           c = "خدمات البشرة"
            return c
            
        default:
           c = "خدمات اليد"
            return c
        }
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textAlignment = .right
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }


    
    
    @objc func Clicked(sender: UIButton){
        let str = sender.titleLabel?.text ?? ""
        let spil = str.split(separator: ",")
        let indexPath = IndexPath(row: Int(spil[1])!, section: Int(spil[0])!)
        let table = tab[0]
        if let cell = table.cellForRow(at: indexPath) as? segCell{
            if !rows.contains(cell){
                rows.append(cell)
            }
        }
        rowsWhichAreChecked.append(str)
        sender.setBackgroundImage(UIImage(named: "ic_ca_steep_pink"), for: .normal)
        sender.setImage(UIImage(named: "ic_bx_pakage"), for: .normal)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SauceCell", for: indexPath) as!
        segCell
        cell.backgroundColor = UIColor.init(red: 229/255.0, green: 229/255.0, blue: 234/255.0, alpha: 1)
        cell.imProfile.image = UIImage(named: "background")
        cell.name.text = "قص الشعر"
        cell.salary.text = "١٥ جنيه"
        cell.time.text = "٢٠ دقيقة"
        cell.imIcon.titleLabel?.text = "\(indexPath.section),\(indexPath.row)"
        cell.imIcon.addTarget(self, action: #selector(self.Clicked(sender:)), for: .touchUpInside)

        if !rowsWhichAreChecked.contains("\(indexPath.section),\(indexPath.row)"){
            cell.imIcon.setBackgroundImage(UIImage(named: "ic_unchecked"), for: .normal)
            cell.imIcon.setImage(UIImage(named: "ic_plus"), for: .normal)
        }else{
            cell.imIcon.setBackgroundImage(UIImage(named: "ic_ca_steep_pink"), for: .normal)
            cell.imIcon.setImage(UIImage(named: "ic_bx_pakage"), for: .normal)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
      
    }
    
    
}

class creatImagAndLable {
    let label : UILabel = {
       let lb = UILabel()
       lb.backgroundColor = .white
       lb.textAlignment = .right
      return lb
    }()
    
    let image : UIImageView = {
        let lb = UIImageView()
        lb.backgroundColor = .white
        return lb
    }()
    let Button : UIButton = {
        let lb = UIButton()
        lb.backgroundColor = .white
        return lb
    }()
    
}
