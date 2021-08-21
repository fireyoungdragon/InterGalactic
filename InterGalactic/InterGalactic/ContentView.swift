import SwiftUI

struct ContentView: View {
    
    let size: CGFloat = 250
    
    @State private var offset: CGFloat = 500
    @State private var scale: CGFloat = 1
    
    var body: some View {
        ZStack {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            ForEach (0..<70) { i in
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.white, .white.opacity(0.5)]), startPoint: .bottom, endPoint: .top))
                    .frame(width: 3, height: 20)
                    .offset(y: offset)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: false).delay(Double(i) / 10), value: offset)
                    .scaleEffect(scale + CGFloat.random(in: 0...0.5))
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: false).delay(Double(i) / 10), value: scale)
                    .rotationEffect(.degrees(Double.random(in: 0...360)))
            }
            Text("Liner Owner")
                .foregroundColor(.purple)
                .font(.largeTitle)
                .offset(y: 170)
        }
        .onAppear {
            offset = 0
            scale = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
