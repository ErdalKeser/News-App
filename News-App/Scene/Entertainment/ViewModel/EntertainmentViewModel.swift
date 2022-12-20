//
//  EntertainmentViewModel.swift
//  News-App
//
//  Created by Erdal Keser on 19.12.2022.
//

import Foundation
import UIKit

protocol EntertainmentViewModelInterFace {
    var view : EntertainmentViewInterFace? { get set }
    
    func getDataResponse()
}
class EntertainmentViewModel: NSObject {
    
    var entertainmentList = [Article]()
    let emvc = EntertainmentVC()
    weak var view: EntertainmentViewInterFace?
}
extension EntertainmentViewModel: EntertainmentViewModelInterFace {
    func getDataResponse() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&category=entertainment&apiKey=1a4793051bad44258c53983e3347f7ef")!

        URLSession.shared.request(url: url, expecting: Welcome.self) { [weak self] result in
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self?.entertainmentList = users.articles!
                    self?.view?.reloadData()
                }
            case .failure(let error):
                print(error)
            }
            
        }
        
 }
 
}
