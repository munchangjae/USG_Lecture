//
//  CommentView.swift
//  USG04
//
//  Created by 백대홍 on 2023/02/09.
//

import SwiftUI
struct genreResponse: Codable {
    let data: [Genre]
}
struct Genre: Codable, Hashable {
  
}
struct CommentView: View {
    @State private var Genres:[Genre] = []
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
