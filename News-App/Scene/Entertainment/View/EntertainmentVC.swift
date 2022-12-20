//
//  EntertainmentVC.swift
//  News-App
//
//  Created by Erdal Keser on 14.12.2022.
//

import UIKit
protocol EntertainmentViewInterFace: AnyObject {
    
    func reloadData()
}

class EntertainmentVC: UIViewController {
    @IBOutlet weak var entertainmentTableView: UITableView!
    private lazy var evm: EntertainmentViewModel = EntertainmentViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        entertainmentTableView.dataSource = self
        entertainmentTableView.delegate = self
        entertainmentTableView.register(UINib(nibName: "EntertainmentCell", bundle: nil), forCellReuseIdentifier: "entertainmentCell")
        evm.view = self
        evm.getDataResponse()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        let toGoDetailVC = segue.destination as! DetailVC
        toGoDetailVC.incomingUrl = evm.entertainmentList[indeks!].url
    }
    
}
extension EntertainmentVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return evm.entertainmentList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = entertainmentTableView.dequeueReusableCell(withIdentifier: "entertainmentCell", for: indexPath) as! EntertainmentCell
        
        cell.entertainmentTitleLabel.text = evm.entertainmentList[indexPath.row].title!
        
        
        cell.entertainmentDescriptionLabel.text = "\(evm.entertainmentList[indexPath.row].description!)     HABERİN DEVAMI İÇİN TIKLAYIN.."
        
        if let incomindata =  evm.entertainmentList[indexPath.row].urlToImage {
            let url = URL(string: incomindata)
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    cell.entertainmentImageView.image = UIImage(data: data!)
                }
            }
        }
        
        return cell
    }
    
}
extension EntertainmentVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toGoDetail", sender: indexPath.row)
    }
    
}
extension EntertainmentVC: EntertainmentViewInterFace {
    func reloadData() {
        entertainmentTableView.reloadData()
    }
    
}

