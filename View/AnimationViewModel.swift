//
//  AnimationViewModel.swift
//  UI-238
//
//  Created by にゃんにゃん丸 on 2021/06/16.
//

import SwiftUI

class AnimationViewModel: ObservableObject {
    
    @Published var ariPlanMode = false
    @Published var NFCMode = false
    @Published var wifyMode = false
    @Published var hotspotMode = false
    @Published var ariDropMode = false
    @Published var dateMode = false
    
    @Published var showDetail = false
    @Published var enalrgetActions = false
    
    
}

