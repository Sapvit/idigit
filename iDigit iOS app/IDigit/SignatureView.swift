//
//  SignatureView.swift
//  IDigit
//
//  Created by Nikolay Khort on 15.03.2024.
//

import SwiftUI

struct SignatureView: View {
    @State private var showUploadButton = true
    
    var body: some View {
        VStack {
            Spacer()
            if showUploadButton {
                Button(action: {
                    // Hide the "Upload Document" button
                    showUploadButton.toggle()
                }) {
                    VStack {
                        Image(systemName: "doc")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                        Text("Upload Document")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                    .padding()
                    .foregroundColor(.blue)
                    .background(Color.white)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                }
            } else {
                DocumentUploadView(showUploadButton: $showUploadButton)
            }
            Spacer()
        }
//        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("Sign documents")
    }
}

struct DocumentUploadView: View {
    @Binding var showUploadButton: Bool
    @State private var showSuccessNotification = false
    
    var body: some View {
        VStack {
            MadeUpDocumentView()
                .padding(20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
            Spacer()
            Button(action: {
                // Show the success notification
                showSuccessNotification.toggle()
            }) {
                Text("Sign and Send")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            // Notification view
            .alert(isPresented: $showSuccessNotification) {
                Alert(title: Text("Successfully signed"), message: nil, dismissButton: .default(Text("OK")) {
                    // Reset the view to show the "Upload Document" button again
                    showUploadButton.toggle()
                })
            }
        }
        .navigationBarTitle("Upload Document")
        .padding()
    }
}



struct MadeUpDocumentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Alpha report")
                .font(.title)
            Text("Date: \(formattedDate())")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor erat nec libero sollicitudin, vel eleifend justo convallis. Morbi eget posuere mi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut vehicula tortor non tellus sollicitudin dapibus. Donec aliquam eros quis nunc lacinia interdum. Integer feugiat ligula ut sapien suscipit, et interdum metus cursus. Nullam ut feugiat orci, id vulputate metus. Phasellus nec arcu libero. Donec nec est at leo vehicula semper id et lectus. Fusce laoreet aliquam mi, eget pharetra dui volutpat nec. Donec mattis dignissim purus, eget fermentum odio euismod in. Duis nec velit lorem. Nullam hendrerit sem nec augue maximus, eu gravida nulla pharetra. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec fringilla sodales viverra.")
                .font(.body)
        }
        .padding()
//        .navigationBarTitle("Sign Document")
        .background(Color.white)
        
    }
    
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: Date())
    }
}

#Preview {
    SignatureView()
}
