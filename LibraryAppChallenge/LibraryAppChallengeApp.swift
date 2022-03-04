//
//  LibraryAppChallengeApp.swift
//  LibraryAppChallenge
//
//  Created by Meenakshi Poorani Seenivelan on 04/03/22.
//

import SwiftUI

@main
struct LibraryAppChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            BooksListView().environmentObject(BookModel())
        }
    }
}
