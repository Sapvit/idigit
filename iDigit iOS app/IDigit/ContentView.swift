import SwiftUI

struct ContentView: View {
  
    @State private var isMenuVisible = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Text("Jon Doe")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        .padding()
                        Spacer()
                    }
                    
                    VStack(spacing: 20) {
                        HStack(spacing: 20) {
                            CustomButton(name: "Documents", icon: "person.text.rectangle", link: AnyView(DocumentsView()), unreadMessages: 0)
                            CustomButton(name: "Signature", icon: "signature", link: AnyView(SignatureView()), unreadMessages: 0)
                        }
                        HStack(spacing: 20) {
                            CustomButton(name: "Wallets", icon: "creditcard", link: AnyView(WalletsView()), unreadMessages: 0)
                            CustomButton(name: "Files", icon: "paperclip", link: AnyView(FilesView()), unreadMessages: 0)
                        }
                        HStack(spacing: 20) {
                            CustomButton(name: "Corporate", icon: "building", link: AnyView(CorporateView()), unreadMessages: 2)
                            CustomButton(name: "Scan QR", icon: "qrcode", link: AnyView(ScanQRView()), unreadMessages: 0)
                        }
                    }
                    .padding(.vertical)
                    Spacer()
                }
                .navigationBarItems(trailing:
                    Button(action: {
                        self.isMenuVisible.toggle()
                    }) {
                        Image(systemName: "ellipsis")
                    }
                )
                if isMenuVisible {
                    HoveringMenu()
                    .onTapGesture {
                        self.isMenuVisible.toggle()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Badge: View {
    var number: Int
    
    var body: some View {
        Text("\(number)")
            .foregroundColor(.white)
            .font(.caption)
            .padding(5)
            .background(Color.red)
            .clipShape(Circle())
    }
}

struct HoveringMenu: View {
    @State private var isProcessing = false
    @State private var isKYC = false
    @State private var isKYB = false
    @State private var isClickKYC = false
    @State private var isPush = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white.opacity(0.7))
            HStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 20) {
                        NavigationLink(destination: ProfileView()) {
                            HStack {
                                Image(systemName: "person.circle")
                                Text("Profile")
                            }
                        }
                        NavigationLink(destination: ContactsView()) {
                            HStack {
                                Image(systemName: "person.2.circle")
                                Text("Contacts")
                            }
                        }
                        NavigationLink(destination: MessagesView()) {
                            HStack {
                                Image(systemName: "bell")
                                Text("Notifications")
                            }
                        }
                        NavigationLink(destination: SettingsView()) {
                            HStack {
                                Image(systemName: "gear")
                                Text("Settings")
                            }
                        }
                        Button(action: {
                            isKYC = true
                        }) {
                            HStack {
                                Image(systemName: "person.crop.circle.dashed")
                                    .foregroundColor(.red)
                                Text("KYC demo")
                                    .foregroundColor(.red)
                            }
                        }
                        .sheet(isPresented: $isKYC) {
                            KYCGeneralInfoView(isKYC: $isKYC)
                        }
                        
                        Button(action: {
                            isKYB = true
                        }) {
                            HStack {
                                Image(systemName: "building.columns.circle")
                                    .foregroundColor(.red)
                                Text("KYB demo")
                                    .foregroundColor(.red)
                            }
                        }
                        .sheet(isPresented: $isKYB) {
                            KYBGeneralInfoView(isKYB: $isKYB)
                        }
                        
                        Button(action: {
                            isClickKYC = true
                        }) {
                            HStack {
                                Image(systemName: "cursorarrow.click.2")
                                    .foregroundColor(.red)
                                Text("1-click KYC demo")
                                    .foregroundColor(.red)
                            }
                        }
                        .sheet(isPresented: $isClickKYC) {
                            ClickKYCView(isClickKYC: $isClickKYC)
                        }
                        
                        Button(action: {
                            isPush = true
                        }) {
                            HStack {
                                Image(systemName: "paperplane.circle")
                                    .foregroundColor(.red)
                                Text("Push signature demo")
                                    .foregroundColor(.red)
                            }
                        }
                        .fullScreenCover(isPresented: $isPush) {
                            PushSignView(isPush: $isPush)
                        }.edgesIgnoringSafeArea(.all)
                    }
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(10)
//                    .padding()
                    Spacer()
                }
                
            }
            .padding(.horizontal)
        }
        .padding()
    }
}


struct CustomButton: View {
    let name: String
    let icon: String
    let link: AnyView
    let unreadMessages: Int
    
    var body: some View {
        ZStack {
            NavigationLink(destination: link) {
                VStack {
                    Image(systemName: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text(name)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                }
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(7)
            }
            if unreadMessages > 0 {
                Badge(number: unreadMessages)
                    .offset(x: 50, y: -50)
            }
        }
    }
}
