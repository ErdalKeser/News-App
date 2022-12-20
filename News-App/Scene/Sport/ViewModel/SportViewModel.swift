//
//  SportViewModel.swift
//  News-App
//
//  Created by Erdal Keser on 19.12.2022.
//

import Foundation
import UIKit

protocol SportViewModelInterFace {
    var view : SportViewInterFace? { get set }
    
    func getDataResponse()
}
class SportViewModel: NSObject {
    
    var sportList = [Article]()
    let smvc = SportVC()
    weak var view: SportViewInterFace?
}
extension SportViewModel: SportViewModelInterFace {
    func getDataResponse() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&category=sports&apiKey=1a4793051bad44258c53983e3347f7ef")!
        
        URLSession.shared.request(url: url, expecting: Welcome.self) { [weak self] result in
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self?.sportList = users.articles!
                    self?.view?.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

