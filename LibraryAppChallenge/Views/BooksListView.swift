//
//  ContentView.swift
//  LibraryAppChallenge
//
//  Created by Meenakshi Poorani Seenivelan on 04/03/22.
//

import SwiftUI

struct BooksListView: View {
    
    //MARK: Properties
    @EnvironmentObject var model:BookModel
    
    //MARK: View Code
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ScrollView {
                    
                    VStack(alignment : .leading) {
                        
                        
                        //MARK: Cards
                        LazyVStack {
                            ForEach(0..<model.books.count)
                            {
                                index in
                                NavigationLink {
                                    BookDetailsView(book: model.books[index])
                                } label: {
                                    
                                    BookCoverView(book: model.books[index]).padding(.top).frame(height:geo.size.height-90)
                                    
                                }

                            }
                        } .padding(/*@START_MENU_TOKEN@*/.leading, 20.0/*@END_MENU_TOKEN@*/)
                            .padding(.trailing, -20)
                    }
                    
                    
                }.navigationTitle("My Library")
            }
            
        }
    }
    //MARK: Methods
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BooksListView().previewDevice("iPhone 13").environmentObject(BookModel())
    }
}
