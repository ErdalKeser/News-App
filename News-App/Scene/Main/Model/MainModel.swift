//
//  MainModel.swift
//  News-App
//
//  Created by Erdal Keser on 14.12.2022.
//

import Foundation

struct Welcome: Codable {
    let status: String?
    let articles: [Article]?
}
struct Article: Codable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    
}
