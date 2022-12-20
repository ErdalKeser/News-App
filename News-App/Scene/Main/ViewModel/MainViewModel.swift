//
//  MainViewModel.swift
//  News-App
//
//  Created by Erdal Keser on 16.12.2022.
//

import Foundation
import UIKit

protocol MainViewModelInterFace {
    var view : MainViewInterFace? { get set }
    
    func getDataResponse()
}
class MainViewModel: NSObject {
    
    var mainList = [Article]()
    let mmvc = MainVC()
    weak var view: MainViewInterFace?
}
extension MainViewModel: MainViewModelInterFace {
    func getDataResponse() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey=1a4793051bad44258c53983e3347f7ef")!

        URLSession.shared.request(url: url, expecting: Welcome.self) { [weak self] result in
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self?.mainList = users.articles!
                    self?.view?.reloadData()
                }
            case .failure(let error):
                print(error)
            }
            
        }
        
 }
 
}

