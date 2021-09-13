//
//  ContentView.swift
//  H4X0R News
//
//  Created by Devang Papinwar on 17/08/21.
//

import SwiftUI

struct ContentView: View
{
    @ObservedObject var networkManager = NetworkManager()
    var body: some View
    {
        NavigationView
        {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack
                    {
                        Text(post.title)
                        Text(String(post.points))
                    }
                }
            }
            .navigationTitle("H4X0R News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        Group
        {
            ContentView()
        }
    }
}
