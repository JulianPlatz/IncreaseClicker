import SwiftUI

struct ContentView: View {
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            Color(Color.black).ignoresSafeArea()
            
            VStack {
                ZStack {
                    VStack(spacing: 200) {
                        Text("\(count)")
                            .bold()
                            .foregroundStyle(Color.white)
                            .font(.system(size: 50))
                        
                        Button(action: {
                            self.count += 1
                        }) {
                            VStack {
                                Image(systemName: "hand.tap.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(Color.white)
                            }
                            .frame(width: 100, height: 100)
                            .background(Color(red: 255/255, green: 100/255, blue: 100/255))
                            .clipShape(Circle())
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
