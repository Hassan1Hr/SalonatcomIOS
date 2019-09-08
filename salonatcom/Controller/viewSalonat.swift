//
//  viewSalonat.swift
//  salonatcom
//
//  Created by Bassam Ramadan on 8/25/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit
import SDWebImage


private let reuseIdentifier = "1"
var infoSaloons : [onlySaloon] = []

class viewSalonat: UICollectionViewController , UICollectionViewDelegateFlowLayout{

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppSalonat.self, forCellWithReuseIdentifier: reuseIdentifier)
        
       fetchJSON()
    }
    
    fileprivate func fetchJSON(){
        let urlString = "https://salonatcom-app.com/mobile-app/api/saloons"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) {
            (data , response , error) in
            
            if let error = error {
                print("Failed1 " , error)
                return
            }
            guard let data = data else {return}
            
            do{
                let info = try
                    JSONDecoder().decode(allSaloons.self , from: data)
                infoSaloons = info.data

                
                // Grand central dispatch (GCD)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            }catch let error{
                print("Failed2 " , error)
                return
            }
        
        }.resume()
    }
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 400)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infoSaloons.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppSalonat
        cell.name.text = infoSaloons[indexPath.row].name
        let area = infoSaloons[indexPath.row].area
        
        cell.address.text = area.name + " - " + infoSaloons[indexPath.row].city.name
        
        cell.image.sd_setImage(with: URL(string: infoSaloons[indexPath.row].image ))
        
        return cell
    }
   
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.hidesBottomBarWhenPushed = true
        let red  = seg()
        navigationController?.pushViewController(red, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
