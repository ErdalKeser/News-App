//
//  TechnologyViewModel.swift
//  News-App
//
//  Created by Erdal Keser on 19.12.2022.
//

import Foundation
import UIKit

protocol TechnologyViewModelInterFace {
    var view : TechnologyViewInterFace? { get set }
    
    func getDataResponse()
}
class TechnologyViewModel: NSObject {
    
    var technologyList = [Article]()
    let tmvc = TechnologyVC()
    weak var view: TechnologyViewInterFace?
}
extension TechnologyViewModel: TechnologyViewModelInterFace {
    func getDataResponse() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&category=technology&apiKey=1a4793051bad44258c53983e3347f7ef")!
        
        URLSession.shared.request(url: url, expecting: Welcome.self) { [weak self] result in
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self?.technologyList = users.articles!
                    self?.view?.reloadData()
                }
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
}

