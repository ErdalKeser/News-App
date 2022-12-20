//
//  TechnologyVC.swift
//  News-App
//
//  Created by Erdal Keser on 14.12.2022.
//

import UIKit
protocol TechnologyViewInterFace: AnyObject {
    
    func reloadData()
}

class TechnologyVC: UIViewController {
    @IBOutlet weak var technologyTableView: UITableView!
    private lazy var tvm: TechnologyViewModel = TechnologyViewModel()
    
    var technologyList = [Article]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        technologyTableView.dataSource = self
        technologyTableView.delegate = self
        technologyTableView.register(UINib(nibName: "TechnologyCell", bundle: nil), forCellReuseIdentifier: "technologyCell")
        tvm.view = self
        tvm.getDataResponse()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        let toGoDetailVC = segue.destination as! DetailVC
        toGoDetailVC.incomingUrl = tvm.technologyList[indeks!].url
    }
    
}
extension TechnologyVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tvm.technologyList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = technologyTableView.dequeueReusableCell(withIdentifier: "technologyCell", for: indexPath) as! TechnologyCell
        
        cell.technologyTitleLabel.text = tvm.technologyList[indexPath.row].title!
        
        
        cell.technologyDescriptionLabel.text = "\(tvm.technologyList[indexPath.row].description!)     HABERİN DEVAMI İÇİN TIKLAYIN.."
        
        if let incomindata =  tvm.technologyList[indexPath.row].urlToImage {
            let url = URL(string: incomindata)
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    if data != nil {
                        cell.technologyImageView.image = UIImage(data: data!)
                    }
                }
            }
        }
        
        return cell
    }
    
}
extension TechnologyVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toGoDetail", sender: indexPath.row)
    }
    
}
extension TechnologyVC: TechnologyViewInterFace {
    func reloadData() {
        technologyTableView.reloadData()
    }
    
}


