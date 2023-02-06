//
//  ContentView.swift
//  Network2
//
//  Created by 문창재 on 2023/01/30.
//

import SwiftUI

struct Movie: Codable, Hashable {
    let title: String
    let image: String
}

struct MovieResponse: Codable {
    let data: [Movie]
}



struct MoviesView: View {
    @State private var Movies:[Movie] = []

    
    var body: some View {
        VStack {
            NavigationStack{
                List(Movies, id: \.self) {
                    item in HStack{
                        AsyncImage(url: URL(string: "http://mynf.codershigh.com:8080"+item.image)) { image in
                            image.resizable()
                                .frame(width:200, height: 300)
                        } placeholder: {
                            ProgressView()
                        }
                        Text(item.title)

                    }
                }
                .navigationTitle("영화")
            }
            Button("서버에서 추가"){
                fetchMovieList()
            }
 
            
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
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                let ret = try JSONDecoder().decode(MovieResponse.self, from: data!)
        //        print("ret :", ret.data)
                for item in ret.data {
                    print(item.title)
                    print(item.image)
                    Movies.append(item)
                }
            }
            catch {
                print("Error", error)
            }
        }.resume()
    }


}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
