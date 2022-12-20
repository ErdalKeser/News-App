//
//  ViewController.swift
//  News-App
//
//  Created by Erdal Keser on 13.12.2022.
//

import UIKit
protocol MainViewInterFace: AnyObject {
    
    func reloadData()
}


class MainVC: UIViewController {
    @IBOutlet weak var mainTableView: UITableView!
    private lazy var mvm: MainViewModel = MainViewModel()
    
    var mainList = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.register(UINib(nibName: "MainCell", bundle: nil), forCellReuseIdentifier: "mainCell")
        mvm.view = self
        mvm.getDataResponse()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        let toGoDetailVC = segue.destination as! DetailVC
        toGoDetailVC.incomingUrl = mvm.mainList[indeks!].url
}
    
}
extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mvm.mainList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainCell
        
        cell.mainTitleLabel.text = mvm.mainList[indexPath.row].title!
        
        
        cell.mainAuthorLabel.text = "\(mvm.mainList[indexPath.row].description!)     HABERİN DEVAMI İÇİN TIKLAYIN.."
        
        if let incomindata =  mvm.mainList[indexPath.row].urlToImage {
        let url = URL(string: incomindata)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell.mainImageView.image = UIImage(data: data!)
            }
        }
        }
        
        return cell
    }
    
}
extension MainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toGoDetail", sender: indexPath.row)
    }
    
}
extension MainVC: MainViewInterFace {
    func reloadData() {
        mainTableView.reloadData()
    }
    
}

