//
//  ScanQrView.swift
//  IDigit
//
//  Created by Nikolay Khort on 15.03.2024.
//

import SwiftUI

struct ScanQRView: View {
    
    @State private var isSheetPresented = false
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all) // Set the area around the viewfinder to white
            
            // Transparent center rectangle with QR code
            VStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(Color.black)
                        .opacity(0.0)
                        .frame(width: 300, height: 300) // Adjust size as needed
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.green, lineWidth: 2) // Green border around the viewfinder
                        )
                    Image(systemName: "qrcode.viewfinder")
                        .font(.system(size: 250))
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .foregroundColor(.black)
                        .padding(20)
                }
                Spacer()
                // Yellow bubble with text "Follow QR-code"
                HStack {
                    Spacer()
                    Button(action: {
                        isSheetPresented = true
                    }) {
                        Text("Follow QR-code")
                            .padding(10)
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $isSheetPresented) {
                        FollowQRView()
                    }
                    Spacer()
                }
                .padding(.bottom, 20)
                
            }
        }
        .navigationBarTitle("Scan QR")
//        .navigationBarItems(trailing:
//            Button(action: {
//                // Action for any button in the navigation bar
//            }) {
//                Text("Button") // Customize the button as needed
//            }
//        )
    }
}


struct ScanQRView_Previews: PreviewProvider {
    static var previews: some View {
        ScanQRView()
    }
}


struct FollowQRView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Spacer()
                Image(systemName: "minus")
                    .font(.system(size: 50))
                    .foregroundColor(.gray)
                Spacer()
            }
            Spacer()
            Text("Document: ID card")
                .font(.title)
                .padding(.bottom, 5)
            Text("Name: Andrew Jason")
                .font(.headline)
            Text("BirthDate: 01/07/1973")
                .font(.headline)
            Text("Issue date: 01/07/2022")
                .font(.headline)
            Text("Expiry date: 01/31/2026")
                .font(.headline)
            Image("ID_QR_Scan_image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Spacer()
            Text("Verified by iDigit: 07/16/2023")
//                .font(.headline)
                .italic()
                .foregroundColor(.green)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
