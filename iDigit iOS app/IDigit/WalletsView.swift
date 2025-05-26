//
//  WalletsView.swift
//  IDigit
//
//  Created by Nikolay Khort on 21.03.2024.
//

import SwiftUI

struct WalletsView: View {
    var body: some View {
        
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                WalletIcon(imageName: "Metamask", walletName: "Metamask", destination: AnyView(Image("Metamask").resizable().scaledToFit().frame(maxWidth: 200, maxHeight: 200)))
                WalletIcon(imageName: "Solfare", walletName: "Solfare", destination: AnyView(Image("Solfare").resizable().scaledToFit().frame(maxWidth: 200, maxHeight: 200)))
            }
            HStack(spacing: 20) {
                WalletIcon(imageName: "Trust wallet", walletName: "Trust wallet", destination: AnyView(Image("Trust wallet").resizable().scaledToFit().frame(maxWidth: 200, maxHeight: 200)))
                WalletIcon(imageName: "WalletConnect", walletName: "WalletConnect", destination: AnyView(Image("WalletConnect").resizable().scaledToFit().frame(maxWidth: 200, maxHeight: 200)))
            }
            HStack(spacing: 20) {
                WalletIcon(imageName: "Bridge wallet", walletName: "Bridge wallet", destination: AnyView(Image("Bridge wallet").resizable().scaledToFit().frame(maxWidth: 200, maxHeight: 200)))
                WalletIcon(imageName: "Argent", walletName: "Argent", destination: AnyView(Image("Argent").resizable().scaledToFit().frame(maxWidth: 200, maxHeight: 200)))
            }
        }
        .navigationBarTitle("Wallets")
        .navigationBarItems(trailing:
            Button(action: {
                
            }) {
                Image(systemName: "plus")
            }
        )
        .padding(.vertical)
        
        
    }
}

#Preview {
    WalletsView()
}


struct WalletIcon: View {
    let imageName: String
    let walletName: String
    let destination: AnyView
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                Text(walletName)
                    .font(.caption)
                    .foregroundColor(.black)
            }
            .padding()
            .frame(width: 120, height: 120)
        }
    }
}
