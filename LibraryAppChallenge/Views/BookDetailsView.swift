//
//  BookDetailsView.swift
//  LibraryAppChallenge
//
//  Created by Meenakshi Poorani Seenivelan on 04/03/22.
//

import SwiftUI

struct BookDetailsView: View {
    //MARK: Properties
    @EnvironmentObject var model:BookModel
    var book:Book
    @State var pickerIndex = 1

    //MARK: View Code
    var body: some View {
        GeometryReader { geo in
            VStack {
                    Text("Read Now!")
                    .font(.title3)
                    
                    NavigationLink {
                        BookContentsView(book: book)
                    } label: {
                        Image("cover\(book.id)").resizable().frame(width: geo.size.width-100, height: geo.size.height-250, alignment: .center)
                    }

                    VStack {
                        Text("Mark for later!")
                            .fontWeight(.bold)
                            .padding(.top)
                        Button(action: { model.updateFavourite(forId: book.id) }) {
                            Image(systemName: book.isFavourite ? "star.fill" : "star")
                                .resizable()
                                .frame(width: 28, height: 28)
                        }
                        .accentColor(.yellow)

                    }
                    VStack
                    {
                        Text("Rate "+book.title)
                            .fontWeight(.bold)
                            .padding(.top)
                        Picker(" ", selection: $pickerIndex) {
                            Text("1").tag(1)
                            Text("2").tag(2)
                            Text("3").tag(3)
                            Text("4").tag(4)
                            Text("5").tag(5)
                        }.padding([.leading, .bottom, .trailing],40).pickerStyle(SegmentedPickerStyle())
                    }

                }
            
        }.onAppear {
            pickerIndex = book.rating
        }
        .navigationBarTitle(book.title)
       
    }
    //MARK: Methods
}

struct BookDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailsView(book: BookModel().books[0]).previewDevice("iPhone 13").environmentObject(BookModel())
    }
}
