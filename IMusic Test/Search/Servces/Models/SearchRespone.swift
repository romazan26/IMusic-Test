//
//  SearchRespone.swift
//  IMusic Test
//
//  Created by Роман on 29.02.2024.
//

import Foundation

struct SearchRespone: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    var trackName: String
    var collectionName: String?
    var artistName: String
    var artworkUrl100: String?
    var previewUrl: String?
}
