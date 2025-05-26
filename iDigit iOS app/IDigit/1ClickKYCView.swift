//
//  1ClickKYCView.swift
//  IDigit
//
//  Created by Nikolay Khort on 30.03.2024.
//

import SwiftUI

struct ClickKYCView: View {
    @Binding var isClickKYC: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .fill(Color.black)
                            .opacity(0.0)
                            .frame(width: 300, height: 300)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.green, lineWidth: 2)
                            )
                        Image(systemName: "qrcode.viewfinder")
                            .font(.system(size: 250))
                            .padding(20)
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: ClickKYCRequestInfoView(isClickKYC: $isClickKYC)) {
                            Text("Follow QR-code")
                                .padding(10)
                                .background(Color.yellow)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                        Spacer()
                    }
                    .padding(.bottom, 20)
                }
            }
//            .navigationBarTitle("1-Click KYC")
        }

    }
}


struct ClickKYCRequestInfoView: View {
    @Binding var isClickKYC: Bool
    @State private var showDecline = false
    @State private var showNotification = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Bank requests the following info:")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.bottom)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Documents:")
                            .font(.headline)
                            .foregroundColor(.black)
                        InfoRowClickKYC(title: "Name:", value: "Jon Doe")
                        InfoRowClickKYC(title: "Birth Date:", value: "06/04/1992")
                        InfoRowClickKYC(title: "Nationality:", value: "Luxembourg")
                        InfoRowClickKYC(title: "Country of Residence:", value: "Luxembourg")
                    }
                    
                    Divider()
                        .padding(.vertical)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Documents:")
                            .font(.headline)
                            .foregroundColor(.black)
                        HStack {
                            Text("ID")
                            Spacer()
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        }
                        HStack {
                            Text("Passport")
                            Spacer()
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        }
                        HStack {
                            Text("Driver's License")
                            Spacer()
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        }
                        HStack {
                            Text("Proof of Residence")
                            Spacer()
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
            
            HStack(spacing: 20) {
                
                Button(action: {
                    showDecline.toggle()
                }) {
                    Text("Decline")
                        .foregroundColor(.red)
                }
                .alert(isPresented: $showDecline) {
                    Alert(
                            title: Text("Are you sure you want to decline?"),
                            message: nil,
                            primaryButton: .default(Text("No")) {
                                showDecline = false
                            },
                            secondaryButton: .destructive(Text("Decline")) {
                                isClickKYC.toggle()
                            }
                        )
                }
                Spacer()
                
                Button(action: {
                    showNotification.toggle()
                }) {
                    Text("Confirm")
                        .foregroundColor(.blue)
                }
                .alert(isPresented: $showNotification) {
                    Alert(title: Text("Successfully shared"), message: nil, dismissButton: .default(Text("OK")) {
                        // Reset the view to show the "Upload Document" button again
                        isClickKYC.toggle()
                    })
                }
            }.padding()
            .padding()
        }
    }
}

struct InfoRowClickKYC: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
        }
    }
}

struct ConfirmClickKYCView: View {
    @Binding var isClickKYC: Bool
    
    var body: some View {
        VStack {
            Text("Data was successfully shared")
                .font(.headline)
                .padding()
            Button("Ok") {
                isClickKYC.toggle()
            }
            .padding()
        }
    }
}

struct ClickKYCView_Previews: PreviewProvider {
    static var previews: some View {
        return ClickKYCView(isClickKYC: .constant(false))
    }
}

struct ClickKYCRequestInfoView_Previews: PreviewProvider {
    static var previews: some View {
        return ClickKYCRequestInfoView(isClickKYC: .constant(false))
    }
}
