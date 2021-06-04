//
//  SocialFeed.swift
//  xcode-tdd
//
//  Created by Akshay Gajarlawar on 04/06/21.
//

import Foundation

enum FeedType {
    case image, video
}

struct SocialFeed {
    var id: UUID
    var mediaType: FeedType
    var mediURL: URL
    var description: String?
}
