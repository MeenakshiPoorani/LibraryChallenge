//
//  BookContentsView.swift
//  LibraryAppChallenge
//
//  Created by Meenakshi Poorani Seenivelan on 04/03/22.
//

import SwiftUI

struct BookContentsView: View {
    var book:Book
    @State var tabIndex = 0
    var body: some View {
       
        TabView (selection : $tabIndex)
        {
            ForEach(0..<book.content.count)
            {
                index in
                
                VStack {
                    Text(book.content[index])
                    Text(String(index+1))
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).tag(index)
            }
        }
        .onAppear{
            tabIndex = book.currentPage
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        

    }
}

struct BookContentsView_Previews: PreviewProvider {
    static var previews: some View {
        BookContentsView(book: BookModel().books[0]).environmentObject(BookModel())
    }
}
