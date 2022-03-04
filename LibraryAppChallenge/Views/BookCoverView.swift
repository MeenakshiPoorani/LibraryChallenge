//
//  BookCoverView.swift
//  LibraryAppChallenge
//
//  Created by Meenakshi Poorani Seenivelan on 04/03/22.
//

import SwiftUI

struct BookCoverView: View {
    
    //MARK: Properties
    var book:Book
   
    //MARK: View Code
    var body: some View {
        GeometryReader{ geo in
            ZStack
                {
                Rectangle()
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Text(book.title).font(.title).fontWeight(.bold).foregroundColor(Color.black).padding(.bottom)
                            Spacer()
                            if book.isFavourite {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundColor(.yellow)
                            }
                        }
                        Text(book.author).italic().foregroundColor(Color.black)
                        Image("cover\(book.id)").resizable()
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                }
                .cornerRadius(10)
                .shadow(radius: 10)
                .foregroundColor(Color.white)
                .frame(width:geo.size.width-50, height: geo.size.height-50)
                
        
        }
    }
    //MARK: Methods
}

struct BookCoverView_Previews: PreviewProvider {
    static var previews: some View {
        BookCoverView(book: BookModel().books[0]).environmentObject(BookModel())
    }
}
