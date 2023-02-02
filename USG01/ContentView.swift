//
//  ContentView.swift
//  USG01
//
//  Created by 문창재 on 2023/01/26.
//

import SwiftUI

struct ContentView: View {
    @State var isLogin = false
    @State var isOn1st = false
    var thirdSection = ["문창재", "정다영", "김동휘"]
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    Button("로그인"){
                        isLogin = true
                    }.confirmationDialog("로그인", isPresented: $isLogin) {
                        Button("Apple ID로 로그인"){
                            
                        }
                    } message: {
                        Text("dasda")
                    }

                }footer: {
                    Text("애플 디벨로퍼 어쩌구")
                } //로그인
                Section{
                    NavigationLink("알림") {
                        List{
                            Section{
                                Toggle("처음", isOn: $isOn1st)
                                Toggle("처음", isOn: $isOn1st)
                                Toggle("처음", isOn: $isOn1st)
                                Toggle("처음", isOn: $isOn1st)
                            }
                        }.navigationTitle("알림")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }footer: {
                    Text("계정 공지 어쩌구")
                } //알림
                Section{
                    ForEach(<#T##data: Binding<MutableCollection & RandomAccessCollection>##Binding<MutableCollection & RandomAccessCollection>#>, id: <#T##KeyPath<C.Element, _>#>, content: <#T##(Binding<C.Element>) -> _#>)
                }
            }.navigationTitle("계정")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
