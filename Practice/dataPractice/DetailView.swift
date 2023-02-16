//
//  DetailView.swift
//  USG04
//
//  Created by 백대홍 on 2023/02/09.
//

import SwiftUI

struct DetailView: View {
    @Binding var movies:[Movie]


    var body: some View {
        VStack{
            AsyncImage(url: URL(string:"http://mynf.codershigh.com:8080"+movies[0].image))
            Text(movies[0].title)
            }
        
        }
        
    func putInData() {
        
    }
    }


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movies: .constant([Movie(_id: "", title: "수리남", image: "/poster/1663012985184.jpeg")]))
    }
}
