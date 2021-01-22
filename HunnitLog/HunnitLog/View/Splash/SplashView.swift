//
//  SplashView.swift
//  HunnitLog
//
//  Created by seungwook.jung on 2020/12/07.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = AnimationView()
        let animation = Animation.named("splash")
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        
        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
    }
}

struct SplashView: View {
    
    var body: some View {
        GeometryReader(content: { geometry in
        LottieView()
            .frame(width: geometry.size.width, height: geometry.size.height)
        })
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
