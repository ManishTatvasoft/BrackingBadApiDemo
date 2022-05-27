//
//  QuotesModel.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 26/05/22.
//

import Foundation

struct QuotesModel: Codable{
    let quote_id : Int?
    let quote : String?
    let author : String?
    let series : String?

    enum CodingKeys: String, CodingKey {

        case quote_id = "quote_id"
        case quote = "quote"
        case author = "author"
        case series = "series"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        quote_id = try values.decodeIfPresent(Int.self, forKey: .quote_id)
        quote = try values.decodeIfPresent(String.self, forKey: .quote)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        series = try values.decodeIfPresent(String.self, forKey: .series)
    }
}
