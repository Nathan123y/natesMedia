//
//  profilemodel.swift
//  mediaApp
//
//  Created by StudentAM on 5/16/24.
//

import Foundation
import SwiftUI

class ProfileModel: ObservableObject {
    @Published var username: String
    @Published var displayName: String
    @Published var nickname: String
    @Published var profileImage: UIImage?

    init(username: String, displayName: String, nickname: String, profileImage: UIImage? = nil) {
        self.username = username
        self.displayName = displayName
        self.nickname = nickname
        self.profileImage = profileImage
    }
}
