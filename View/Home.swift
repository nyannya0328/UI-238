//
//  Home.swift
//  UI-238
//
//  Created by にゃんにゃん丸 on 2021/06/16.
//

import SwiftUI
extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
}

struct Home: View {
    @StateObject var model = AnimationViewModel()
    @Namespace var animation
    var body: some View {
        ZStack{
            
            GeometryReader{proxy in
                
                let frame = proxy.frame(in:.global)
                
                
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: frame.width, height: frame.height)
                
                
                //BlurView(style: .systemMaterialLight)
                    .onTapGesture {
                        withAnimation(Animation.easeInOut.speed(1.0)){
                            
                            model.showDetail = false
                        }
                    }
                
                
            }
            .ignoresSafeArea()
            
           
            VStack{
                
                
                HStack(spacing:10){
                    
                    
                    Image(systemName: "chart.bar.fill")
                        .font(.title)
                        
                    
                    Text("Version")
                        .fontWeight(.bold)
                    
                    
                    Spacer()
                    
                    Text("53%")
                        .fontWeight(.bold)
                    
                    
                    Image(systemName: "battery.25")
                    
                    
                    
                    
                }
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.top,25)
                
                
                HStack(spacing:15){
                    
                    GeometryReader{proxy in
                        
                        ZStack{
                            
                            
                            if !model.showDetail{
                                
                                VStack(spacing:15){
                                    
                                    
                                    
                                    HStack(spacing:15){
                                        
                                        
                                        ActionButton(image: "airplane.circle.fill", isSelected: $model.ariPlanMode, animation: animation, title: "Air Plane")
                                        
                                        ActionButton(image: "antenna.radiowaves.left.and.right", isSelected: $model.dateMode, animation: animation, title: "Mobile")
                                        
                                        
                                      
                                    }
                                    
                                    HStack(spacing:15){
                                        
                                        ActionButton(image: "wifi", isSelected: $model.wifyMode, animation: animation, title: "Wifi")
                                        
                                        
                                        ActionButton(image: "airplayaudio", isSelected: $model.ariDropMode, animation: animation, title: "Air Drop")
                                        
                                    }
                                   
                                    
                                  
                                    
                                }
                                .padding(15)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(
                                
                                    HStack(spacing:15){
                                        
                                        ActionButton(image: "wave.3.right", isSelected: $model.NFCMode, animation: animation, title: "NFC")
                                        
                                        ActionButton(image: "personalhotspot", isSelected: $model.hotspotMode, animation: animation, title: "Hot Spot")
                                        
                                        
                                    }
                                    
                                    .offset(y: 40)
                                    .padding(.horizontal,10)
                                    .opacity(0)
                                
                                )
                                .background(BlurView(style: .dark)
                                
                                
                                                .cornerRadius(30)
                                                .matchedGeometryEffect(id: "ACTION_SHEET", in: animation)
                                
                                )
                               
                                .scaleEffect(model.enalrgetActions ? 0.8 : 1)
                            
                                .onLongPressGesture(minimumDuration: 0.25){
                                    
                                    
                                    withAnimation(Animation.easeInOut(duration: 0.33).speed(1.3)){
                                        
                                        withAnimation(.easeInOut){
                                            
                                            
                                            model.enalrgetActions = true
                                            
                                            
                                        }
                                        
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                            
                                            UIImpactFeedbackGenerator.init(style: .light).impactOccurred()
                                            
                                            model.enalrgetActions = false
                                            model.showDetail = true
                                            
                                        }
                                        
                                      
                                        
                                    }
                                    
                                }
                            }
                           
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                       
                        
                        
                        
                        
                        
                    }
                    
                    GeometryReader{proxy in
                        
                        VStack(spacing:15){
                            
                            
                          Text("Not Playing")
                            .font(.callout.bold())
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                            
                            HStack{
                                
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "backward.fill")
                                        .font(.title)
                                        .foregroundColor(.white)
                                })
                                .disabled(true)
                                .opacity(0.7)
                                
                                Spacer(minLength: 0)
                                
                                
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "play.fill")
                                        .font(.title)
                                        .foregroundColor(.white)
                                })
                                
                                Spacer(minLength: 0)
                                
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "arrowtriangle.forward.fill")
                                        .font(.title)
                                        .foregroundColor(.white)
                                })
                                .disabled(true)
                                .opacity(0.7)
                                
                                
                                
                            }
                            .padding()
                            
                            
                            
                            
                          
                            
                        }
                        
                    }
                        .padding(15)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(BlurView(style: .dark))
                        .cornerRadius(30)
                        
                        
                        
                         
                       
                        
                        
                        
                        
                  
                  
                    
                    
                    
                    
                    
                    
                    
                }
                .frame(height: (getRect().width - 75) / 2)
                .padding(.top,30)
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.horizontal,30)
            .opacity(model.showDetail ? 0 : 1)
            
            GeometryReader{proxy in
                
                
                if model.showDetail{
                
                VStack(spacing:15){
                    
                    
                    
                    HStack(spacing:15){
                        
                        
                        ActionButton(image: "airplane.circle.fill", isSelected: $model.ariPlanMode, animation: animation, title: "Air Plan")
                        
                        ActionButton(image: "antenna.radiowaves.left.and.right", isSelected: $model.dateMode, animation: animation, title: "Mobile")
                        
                        
                      
                    }
                    
                    HStack(spacing:15){
                        
                        ActionButton(image: "wifi", isSelected: $model.wifyMode, animation: animation, title: "Wifi")
                        
                        
                        ActionButton(image: "airplayaudio", isSelected: $model.ariDropMode, animation: animation, title: "Ari Drop")
                        
                    }
                    
                    
                    HStack(spacing:15){
                        
                        ActionButton(image: "wave.3.right", isSelected: $model.NFCMode, animation: animation, title: "NFC")
                        
                        ActionButton(image: "personalhotspot", isSelected: $model.hotspotMode, animation: animation, title: "Hot Spot")
                        
                        
                    }
                    
                    
                  
                    
                }
                .padding(15)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(BlurView(style: .dark)
                                .cornerRadius(30)
                                .matchedGeometryEffect(id: "ACTION_SHEET", in: animation)
                
                
                )
                
                    
                }
            }
            .frame(height: getRect().height / 2.1)
            .padding(.horizontal,30)
            
            
            
        }
        .environmentObject(model)
        .statusBar(hidden: true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct ActionButton : View {
    
    var image : String
    @Binding var isSelected : Bool
    var animation : Namespace.ID
    var title : String
    @EnvironmentObject var model : AnimationViewModel
    var body: some View{
        
        
        VStack{
            
            let actulalySize = (getRect().width - 75) / 2
            
            
            Image(systemName: image)
                .font(.title2)
                .foregroundColor(image == "wifi" && !isSelected ? .red : .white)
                .frame(width: (actulalySize - 45) / 2,height:(actulalySize - 45) / 2)
                .background(ZStack{
                    
                    if image == "wify"{isSelected ? Color.blue:Color.white}
                    
                    else  if image == "airplane.circle.fill"{isSelected ? Color.green : Color.gray.opacity(0.25)}
                    
                    else if image == "antenna.radiowaves.left.and.right"{isSelected ? Color.orange:Color.gray.opacity(0.25)}
                    
                    else{isSelected ? Color.blue:Color.gray.opacity(0.25) }
                    
                    
                })
                .clipShape(Circle())
            if model.showDetail{
                
                Text(title)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                
                Text(isSelected ?  "ON" : "OF")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
            }
            
            
            
            
        }
        .matchedGeometryEffect(id: image, in: animation)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .gesture(
        TapGesture()
            .onEnded({ _ in
                
                
                withAnimation(.linear){
                    
                    
                   isSelected.toggle()
                    
                }
                
            })
            .simultaneously(with: LongPressGesture(minimumDuration: 0.25).onEnded({ _ in
                
                withAnimation(Animation.easeInOut(duration: 0.33)){
                    
                    withAnimation(.easeInOut.speed(1.3)){
                        
                        
                        model.enalrgetActions = true
                        
                        
                    }
                    
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        
                        UIImpactFeedbackGenerator.init(style: .light).impactOccurred()
                        
                        model.enalrgetActions = false
                        model.showDetail = true
                        
                    }
                    
                  
                    
                }

                
            
                
                
            }))
        
        )
      
    }
}
