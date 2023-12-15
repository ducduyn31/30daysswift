import SwiftUI

struct ContentView: View {
    @State private var selectedFont = 0
    private let fonts = ["Avenir", "Helvetica Neue", "Georgia", "Futura", "Menlo"]
    var body: some View {
        VStack {
            Spacer()
            Text("\(fonts[selectedFont])")
                .font(Font.custom(fonts[selectedFont], size: 32))
            Spacer()
            Button(action: {
                selectedFont = (selectedFont + 1) % fonts.count
            }) {
                Text("Next Font")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
