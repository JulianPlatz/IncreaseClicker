import SwiftUI

struct ContentView: View {
    @State var count: Int = UserDefaults.standard.integer(forKey: "count")
    @State var showingAlert: Bool = false
    
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
                        
                        VStack(spacing: 25) {
                            HStack(spacing: 25) {
                                Spacer().frame(width: 45)
                                Button(action: {
                                    self.count += 1
                                    UserDefaults.standard.set(self.count, forKey: "count")
                                }) {
                                    VStack {
                                        Image(systemName: "plus")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 25, height: 25)
                                            .foregroundColor(Color.white)
                                    }
                                    .frame(width: 100, height: 100)
                                    .background(Color(red: 100/255, green: 200/255, blue: 100/255))
                                    .clipShape(Circle())
                                }
                                
                                Button(action: {
                                    self.count -= 1
                                    UserDefaults.standard.set(self.count, forKey: "count")
                                }) {
                                    VStack {
                                        Image(systemName: "minus")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 15, height: 15)
                                            .foregroundColor(Color.white)
                                    }
                                    .frame(width: 50, height: 50)
                                    .background(Color(red: 255/255, green: 100/255, blue: 100/255))
                                    .clipShape(Circle())
                                }
                            }

                            
                            Button(action: {
                                showingAlert = true
                            }) {
                                VStack {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(Color.white)
                                }
                                .frame(width: 75, height: 75)
                                .background(Color(red: 100/255, green: 100/255, blue: 255/255))
                                .clipShape(Circle())
                            }
                            .alert(isPresented: $showingAlert) {
                                Alert(
                                    title: Text("Reset?"),
                                    message: Text("Do you really want to reset the counter?"),
                                    primaryButton: .cancel(Text("Cancel")),
                                    secondaryButton: .destructive(Text("Reset")) {
                                        self.count = 0
                                        UserDefaults.standard.set(self.count, forKey: "count")
                                    }
                                )
                            }
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
