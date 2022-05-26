//
//  CharacterModel.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 25/05/22.
//

import Foundation
struct CharacterModel : Codable {
    let char_id : Int?
    let name : String?
    let birthday : String?
    let occupation : [String]?
    let img : String?
    let status : String?
    let nickname : String?
    let appearance : [Int]?
    let portrayed : String?
    let category : String?
    let better_call_saul_appearance : [Int]?

    enum CodingKeys: String, CodingKey {

        case char_id = "char_id"
        case name = "name"
        case birthday = "birthday"
        case occupation = "occupation"
        case img = "img"
        case status = "status"
        case nickname = "nickname"
        case appearance = "appearance"
        case portrayed = "portrayed"
        case category = "category"
        case better_call_saul_appearance = "better_call_saul_appearance"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        char_id = try values.decodeIfPresent(Int.self, forKey: .char_id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        birthday = try values.decodeIfPresent(String.self, forKey: .birthday)
        occupation = try values.decodeIfPresent([String].self, forKey: .occupation)
        img = try values.decodeIfPresent(String.self, forKey: .img)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        nickname = try values.decodeIfPresent(String.self, forKey: .nickname)
        appearance = try values.decodeIfPresent([Int].self, forKey: .appearance)
        portrayed = try values.decodeIfPresent(String.self, forKey: .portrayed)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        better_call_saul_appearance = try values.decodeIfPresent([Int].self, forKey: .better_call_saul_appearance)
    }

}
