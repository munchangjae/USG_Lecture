//
//  main.swift
//  network1
//
//  Created by 문창재 on 2023/01/26.
//

import Foundation

print("Hello, Swift!")


struct Movie: Codable {
    let genre: [String]
    let title: String
    let image: String
    let _id: String
}

struct MovieResponse: Codable {
    let data: [Movie]
}



func doIt(data: Data?, response: URLResponse?, error: Error?) {
    print("do it!!!")
    // Data -> Swift Data Type
    do {
        let ret = try JSONDecoder().decode(MovieResponse.self, from: data!)
//        print("ret :", ret.data)
        for item in ret.data {
            print(item.genre)
            print(item.title)
            print(item.image)
            print(item._id)
        }
    }
    catch {
        print("Error")
    }

}


func fetchMovieList() {
    print("fetchMovieList")
    // 1. URL
    let urlStr = "http://mynf.codershigh.com:8080/api/movies"
    let url = URL(string: urlStr)!
    
    // 2. Request
    let request = URLRequest(url: url)
        
    // 3. Session, Task
    let task = URLSession.shared.dataTask(with: request, completionHandler: doIt(data:response:error:))
    task.resume()
}


fetchMovieList()
