//
//  SearchView.swift
//  mediaApp
//
//  Created by StudentAM on 5/16/24.
//

import SwiftUI
import WebKit

struct SearchView: View {
    @State private var query: String = ""
    @State private var url: URL? = nil

    var body: some View {
        VStack {
            TextField("Search...", text: $query, onCommit: {
                performSearch()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

            if let url = url {
                WebView(url: url)
            } else {
                Text("Enter a search term and press return to search the web.")
                    .foregroundColor(.gray)
                    .padding()
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle("Search", displayMode: .inline)
    }

    private func performSearch() {
        guard !query.isEmpty else {
            return
        }
        let searchQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        if let searchURL = URL(string: "https://www.google.com/search?q=\(searchQuery)") {
            self.url = searchURL
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

