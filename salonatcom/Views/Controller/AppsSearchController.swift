//
//  AppsSearchControllerCollectionViewController.swift
//  salonatcom
//
//  Created by Bassam Ramadan on 8/16/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit
import SDWebImage

var ServicesApp : [serviceApp] = []
class AppsSearchController: UICollectionViewController , UICollectionViewDelegateFlowLayout {

    let cellId = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        collectionView.backgroundColor = .white
        collectionView.register(ViewCell.self, forCellWithReuseIdentifier: cellId)
        
        fitchJSON()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.frame.width - 10)/2
        return CGSize(width: width, height: width*1.5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    fileprivate func fitchJSON() {
        
        let urlString = "https://itunes.apple.com/search?term=jack+johnson"
        
        guard let url = URL(string: urlString) else {return }
        
        URLSession.shared.dataTask(with: url){(data , respon , err) in
            
            if let err = err{
                print("Failed " , err)
                return
            }
            
            guard let data = data else {return}
            
            do{
                let servicesData = try
                    JSONDecoder().decode(Services.self,from: data)
                ServicesApp = servicesData.results

            }catch let err{
                print("Faild",err)
            }
            
            
        }.resume()
    }
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
  
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return ServicesApp.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        as! ViewCell
      
        cell.label.text = ServicesApp[indexPath.row].trackName
        cell.image.sd_setImage(with: URL(string: ServicesApp[indexPath.row].artworkUrl100))
        
       
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.hidesBottomBarWhenPushed = true
        let red  = seg()
        navigationController?.pushViewController(red, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
}

