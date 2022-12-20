//
//  SportVC.swift
//  News-App
//
//  Created by Erdal Keser on 14.12.2022.
//

import UIKit
protocol SportViewInterFace: AnyObject {
    
    func reloadData()
}
class SportVC: UIViewController {
    @IBOutlet weak var sportTableView: UITableView!
    private lazy var svm: SportViewModel = SportViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sportTableView.dataSource = self
        sportTableView.delegate = self
        sportTableView.register(UINib(nibName: "SportCell", bundle: nil), forCellReuseIdentifier: "sportCell")
        svm.view = self
        svm.getDataResponse()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        let toGoDetailVC = segue.destination as! DetailVC
        toGoDetailVC.incomingUrl = svm.sportList[indeks!].url
    }
}
extension SportVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return svm.sportList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = sportTableView.dequeueReusableCell(withIdentifier: "sportCell", for: indexPath) as! SportCell
        
        cell.sportTitleLabel.text = svm.sportList[indexPath.row].title!
        
        cell.sportDescriptionLabel.text = "\(svm.sportList[indexPath.row].description!)     HABERİN DEVAMI İÇİN TIKLAYIN.."
        
        if let incomindata =  svm.sportList[indexPath.row].urlToImage {
            let url = URL(string: incomindata)
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    cell.sportImageView.image = UIImage(data: data!)
                }
            }
        }
        
        return cell
    }
    
}
extension SportVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toGoDetail", sender: indexPath.row)
    }
    
}
extension SportVC: SportViewInterFace {
    func reloadData() {
        sportTableView.reloadData()
    }
    
}


