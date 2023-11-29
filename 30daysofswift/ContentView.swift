import SwiftUI

struct ContentView: View {
    private let timerPublisher = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @State private var elapsedTime: Double = 0
    @State private var startTime: Double?
    @State private var isPlaying: Bool = false
    
    var body: some View {
        VStack {
            Text(String(format: "%.1f seconds", elapsedTime))
                .onReceive(timerPublisher, perform: { timer in
                    if isPlaying {
                        self.elapsedTime += 0.01
                    }
                })
            
            Button(action: continueTimer, label: {
                Text("Play")
            })
            .disabled(isPlaying)
            
            Button(action: pauseTimer, label: {
                Text("Pause")
            }).disabled(!isPlaying)
            
            Button(action: resetTimer, label: {
                Text("Reset")
            })
        }
        .padding()
    }
    
    private func pauseTimer() {
        self.isPlaying = false
    }
    
    private func continueTimer() {
        self.isPlaying = true
        self.startTime = Date().timeIntervalSince1970
    }
    
    private func resetTimer() {
        self.isPlaying = false
        self.elapsedTime = 0
        
    }
}

#Preview {
    ContentView()
}
