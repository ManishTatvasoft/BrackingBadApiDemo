//
//  MainModel.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 25/05/22.
//

import Foundation


struct MainModel : Codable {
    let characters : String?
    let episodes : String?
    let quotes : String?
    let deaths : String?

    enum CodingKeys: String, CodingKey {

        case characters = "characters"
        case episodes = "episodes"
        case quotes = "quotes"
        case deaths = "deaths"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        characters = try values.decodeIfPresent(String.self, forKey: .characters)
        episodes = try values.decodeIfPresent(String.self, forKey: .episodes)
        quotes = try values.decodeIfPresent(String.self, forKey: .quotes)
        deaths = try values.decodeIfPresent(String.self, forKey: .deaths)
    }

}
