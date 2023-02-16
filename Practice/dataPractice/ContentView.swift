//
//  ContentView.swift
//  USG04
//
//  Created by 백대홍 on 2023/01/30.
//

import SwiftUI


struct Actor: Codable, Hashable {
    let _id: String
    let name: String
    let image: String
}



struct ActorResponse: Codable {
    let data: [Actor]
}

struct ContentView: View {
    @State private var Movies:[Movie] = []
    @State private var Actors:[Actor] = []
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    
    var body: some View {
        VStack {
            NavigationStack{
                ScrollView(.horizontal){
                    LazyHGrid(rows: columns) {
                        ForEach(Actors, id: \.self) { item in
                            AsyncImage(url: URL(string:"http://mynf.codershigh.com:8080"+item.image)) { image in
                                image.resizable()
                                    .frame(width: 150, height:200)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                }
                .navigationTitle("배우")
            }
            Button("배우 보기"){
                fetchMovieList()
            }
        }
        
        
    }
    
    func fetchMovieList() {
        print("fetchMovieList")
        // 1. URL
        let urlStr = "http://mynf.codershigh.com:8080/api/actors"
        let url = URL(string: urlStr)!
        
        // 2. Request
        let request = URLRequest(url: url)
        
        // 3. Session, Task
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                let ret = try JSONDecoder().decode(ActorResponse.self, from: data!)
                //        print("ret :", ret.data)
                for item in ret.data {
                    print(item._id)
                    print(item.name)
                    print(item.image)
                    Actors.append(item)
                }
            }
            catch {
                print("Error", error)
            }
        }.resume()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
