//
//  DetailView.swift
//  H4X0R News
//
//  Created by Devang Papinwar on 17/08/21.
//

import SwiftUI
import UIKit
import WebKit

struct DetailView: View
{
    let url : String?
    var body: some View
    {
        WebView(urlString : url)
    }
}

struct DetailView_Previews: PreviewProvider
{
    let url : String?
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
}
