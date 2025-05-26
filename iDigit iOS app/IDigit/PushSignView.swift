//
//  PushSignView.swift
//  IDigit
//
//  Created by Nikolay Khort on 04.04.2024.
//

import SwiftUI

struct PushSignView: View {
    @Binding var isPush: Bool
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMMM"
        return formatter
    }()
    
    private let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            VStack {
                Text(Date(), formatter: dateFormatter)
                    .font(.title)
                    .foregroundColor(.white)
                
                Text(Date(), formatter: timeFormatter)
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                NavigationLink(destination: TransactionApprovalView(isPush: $isPush)) {
                    HStack {
                        Image("icon") // Use the name of your app icon image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                        
                        Text("iDigit - approve transaction")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                }
                
                Spacer()
            }
            .padding(40)
            .background(
                Image("wallpaper")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
        }
        
    }
}

struct TransactionApprovalView: View {
    @Binding var isPush: Bool
    @State private var showTransactionApproved = false

    var body: some View {
        VStack {
            Text("Transaction")
                .font(.title)
                .foregroundColor(.black)
                .padding(.top, 50)
                .bold()
            
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 5)
                .frame(width: 300, height: 150)
                .overlay(
                    VStack(spacing: 0) {
                        Text("A transaction requires your approval:")
                            .foregroundColor(.black)
//                            .font(.headline)
                            .padding(.top)
                            .lineLimit(nil)
                            .multilineTextAlignment(.center)
                            .lineSpacing(5)
                        Text("\u{20AC}20 Payment to shoponline.com")
                            .foregroundColor(.black)
                            .bold()
//                            .font(.title)
                            .padding()
                            .lineLimit(nil)
                            .multilineTextAlignment(.center)
                            .lineSpacing(5)
                    }
                )
            Spacer()
            VStack(spacing: 20) {
                Button(action: {
                    showTransactionApproved.toggle()
                }) {
                    Text("Approve")
                        .foregroundColor(.white)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(30)
                }
                .alert(isPresented: $showTransactionApproved) {
                    Alert(
                        title: Text("Transaction Approved"),
                        message: nil,
                        dismissButton: .default(Text("OK")) {
                            // Dismiss the view
                            isPush.toggle()
                        }
                    )
                }
                
                Button(action: {
                    // Reject button action
                    // Dismiss the view
                    isPush.toggle()
                }) {
                    Text("Reject")
                        .foregroundColor(.white)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(30)
                }
            }
            .padding(.top, 20)
        }
        .padding()
        .background(Color.gray)
        .navigationBarBackButtonHidden(true)
    }
}


struct PushSignView_Previews: PreviewProvider {
    static var previews: some View {
        return PushSignView(isPush: .constant(false))
    }
}

struct TransactionApprovalView_Previews: PreviewProvider {
    static var previews: some View {
        return TransactionApprovalView(isPush: .constant(false))
    }
}
