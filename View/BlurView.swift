//
//  BlurView.swift
//  UI-238
//
//  Created by にゃんにゃん丸 on 2021/06/16.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    
    var style : UIBlurEffect.Style
    func makeUIView(context: Context) -> UIVisualEffectView{
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
        
        
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}

