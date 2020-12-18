//
//  ContentView.swift
//  ColorBook
//
//  Created by Zach Eriksen on 12/17/20.
//

import SwiftUI
import xColor

let qa_page = xColorBookPage(colors: [
    "primary": xColor(red: 1, green: 0, blue: 0, alpha: 1),
    "secondary": xColor(red: 0.5, green: 0, blue: 1, alpha: 1),
    "accent": xColor(red: 0.5, green: 0.5, blue: 1, alpha: 1),
])

let xmas_page = xColorBookPage(colors: [
    "primary": xColor(red: 1, green: 0, blue: 0, alpha: 1),
    "secondary": xColor(red: 0, green: 1, blue: 0, alpha: 1),
    "accent": xColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1),
])

let holloween_page = xColorBookPage(colors: [
    "primary": xColor(red: 0.74, green: 0.25, blue: 0.1, alpha: 1),
    "secondary": xColor(red: 1, green: 0, blue: 0, alpha: 1),
    "accent": xColor(red: 0, green: 0, blue: 0, alpha: 1),
])

let book = xColorBook(pages: [
    "qa": qa_page,
    "xmas": xmas_page,
    "spooky": holloween_page
])

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    ForEach(book.pages.keys.sorted(by: <), id: \.self) { page in
                        VStack {
                            Text(page)
                            ForEach(book.pages[page]!.colors.keys.sorted(by: <), id: \.self) { color in
                                HStack {
                                    Text(color)
                                    Spacer()
                                    Color(book.color(named: color, forPageNamed: page))
                                }
                            }
                            
                            .frame(width: geo.size.width, alignment: .center)
                        }
                    }
                }
                .frame(height: geo.size.height, alignment: .center)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
