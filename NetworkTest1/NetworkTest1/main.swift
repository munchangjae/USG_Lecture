//
//  main.swift
//  NetworkTest1
//
//  Created by 문창재 on 2023/02/05.
//
import SwiftUI
import Foundation


struct Movie: Codable, Hashable {
    let title: String
    let image: String
}

struct MovieResponse: Codable {
    let data: [Movie]
}





print("Hello, World!")

func fetchMovies() {
    print("go")
    // 1. URL
    let urlstr = "http://mynf.codershigh.com:8080/api/movies"
    let url = URL(string: urlstr)!

    // 2. Request

    let urlRequest = URLRequest(url: url)

    // 3. Session

    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        do {
            let ret = try JSONDecoder().decode(MovieResponse.self, from: data!)
            for item in ret.data {
                print(item.title)
                print(item.image)
            
            }
        }
        catch {
            print("Error", error)
        }
    }.resume()

}

fetchMovies()
