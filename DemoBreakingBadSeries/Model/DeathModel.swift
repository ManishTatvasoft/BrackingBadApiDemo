//
//  DeathModel.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 26/05/22.
//

import Foundation

struct DeathModel: Codable{
    let death_id : Int?
    let death : String?
    let cause : String?
    let responsible : String?
    let last_words : String?
    let season : Int?
    let episode : Int?
    let number_of_deaths : Int?

    enum CodingKeys: String, CodingKey {

        case death_id = "death_id"
        case death = "death"
        case cause = "cause"
        case responsible = "responsible"
        case last_words = "last_words"
        case season = "season"
        case episode = "episode"
        case number_of_deaths = "number_of_deaths"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        death_id = try values.decodeIfPresent(Int.self, forKey: .death_id)
        death = try values.decodeIfPresent(String.self, forKey: .death)
        cause = try values.decodeIfPresent(String.self, forKey: .cause)
        responsible = try values.decodeIfPresent(String.self, forKey: .responsible)
        last_words = try values.decodeIfPresent(String.self, forKey: .last_words)
        season = try values.decodeIfPresent(Int.self, forKey: .season)
        episode = try values.decodeIfPresent(Int.self, forKey: .episode)
        number_of_deaths = try values.decodeIfPresent(Int.self, forKey: .number_of_deaths)
    }
}
