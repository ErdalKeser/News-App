//
//  DetailVC.swift
//  News-App
//
//  Created by Erdal Keser on 14.12.2022.
//

import UIKit
import WebKit

class DetailVC: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    var incomingUrl: String? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incomingNews(urlString: incomingUrl!)


    }
    func incomingNews(urlString:String){
        

        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
    }

}
