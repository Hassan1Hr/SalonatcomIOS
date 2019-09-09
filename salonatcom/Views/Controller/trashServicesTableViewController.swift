//
//  trashServicesTableViewController.swift
//  salonatcom
//
//  Created by Bassam Ramadan on 9/1/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit
class trashServicesTableViewController: UIViewController{
    var cells = [segCell]()
    let tableView = UITableView()
    let boot = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "سلة الخدمات"
        view.backgroundColor = .white
        
        let imgTime = creatImagAndLable().image
        let imgCart = creatImagAndLable().image
        let button = creatImagAndLable().Button
        let labelTime = creatImagAndLable().label
        let LabelCart = creatImagAndLable().label
        button.addTarget(self, action: #selector(segueViews(sender:)), for: .touchUpInside)
        let Cart = CartBooking()
        let stackFooter = UIStackView(arrangedSubviews: [button , labelTime , imgTime , LabelCart , imgCart])
        Cart.setFeaturesOfSubviewsOfStackFooter(button: button, imgTime: imgTime, imgCart: imgCart, labelTime: labelTime, LabelCart: LabelCart)
        Cart.setupStackFooter(stackFooter : stackFooter, boot: boot)
        setupTableView()
        Cart.setupboot(boot: boot, view: view)
    }
    @objc func segueViews(sender : UIButton){
         self.hidesBottomBarWhenPushed = true
         let Bill = BillViewController()
         navigationController?.pushViewController(Bill, animated: true)
//        self.prepare(for: self.commonSegue, sender: self)
//        self.commonSegue.perform()
        
    }
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.register(segCell.self, forCellReuseIdentifier: "12")
    }
    
}
extension trashServicesTableViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    @objc func deleteCell(_ sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        // delete dataModel
        cells.remove(at: sender.tag)
        // must befinUpdates and endUpdates to delete cells
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        // to update indexPaths for cells
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "12", for: indexPath) as! segCell
        cell.imIcon.setImage(UIImage(named: "remove"), for: .normal)
        cell.imProfile.image = cells[indexPath.row].imProfile.image
        cell.name.text = cells[indexPath.row].name.text
        cell.salary.text = cells[indexPath.row].salary.text
        cell.time.text = cells[indexPath.row].time.text
        cell.imIcon.tag = indexPath.row
        cell.imIcon.addTarget(self, action: #selector(self.deleteCell(_:)), for: .touchUpInside)
        return cell
    }
    
    
}
