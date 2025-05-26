//
//  NewDocumentView.swift
//  IDigit
//
//  Created by Nikolay Khort on 25.03.2024.
//

import SwiftUI

struct NewDocumentView: View {
//    @State private var isCameraActive = false
    @State private var isNextButtonActive = false
    @Binding var isNewDocumentViewPresented: Bool
    
//    init(isNewDocumentViewPresented: Binding<Bool> = .constant(false)) {
//            _isNewDocumentViewPresented = isNewDocumentViewPresented
//        }
    
    var body: some View {
        NavigationView {
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.green, lineWidth: 2)
                    .frame(width: 300, height: 200)
                    .padding()
                    // Placeholder image
                    .overlay(
                        Image("residence_permit_image")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 280, height: 180)
                    )
                
                Button(action: {
                    self.isNextButtonActive.toggle()
                }) {
                    Text("Take Photo")
                        .padding(10)
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .padding()
                
                Button(action: {
                    // Enable the "Next" button when taking a photo
                    self.isNextButtonActive = true
                }) {
                    NavigationLink(destination: RecognizedDataView(isNewDocumentViewPresented: $isNewDocumentViewPresented)) {
                        Text("Next >")
                    }
                }
                .padding()
                .disabled(!isNextButtonActive)
            }
            .navigationBarTitle("New Document")
        }
    }
}


struct RecognizedDataView: View {
    @State private var isVerified = false
    @Binding var isNewDocumentViewPresented: Bool
    
//    init(isNewDocumentViewPresented: Binding<Bool> = .constant(false)) {
//            _isNewDocumentViewPresented = isNewDocumentViewPresented
//        }
    
    private var currentDateFormatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: Date())
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Residence Permit")
                .font(.title)
                .bold()
                .padding(.bottom, 5)
            Text("Name: Jon Doe")
                .font(.headline)
            Text("BirthDate: 06/04/1992")
                .font(.headline)
            Text("Issued by: FA Ministry")
                .font(.headline)
            Text("Issue date: 03/01/2024")
                .font(.headline)
            Text("Expiry date: 03/01/2028")
                .font(.headline)
            Image("residence_permit_image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Spacer()
            
            Text(isVerified ? "Verified by iDigit: \(currentDateFormatted)" : "Verification pending")
                .italic()
                .foregroundColor(isVerified ? .green : .red)
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    if isVerified {
                        isNewDocumentViewPresented.toggle()
                    } else {
                        // Action for the "Next" button
                        isVerified.toggle()
                    }
                }) {
                    Text(isVerified ? "Finish" : "Next >")
            }
                Spacer()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        /*var body: some View {
         VStack {
         DocumentsDetailedView(document: Document(name: "Residence Permit",
         fullName: "Jon Doe",
         birthDate: "06/04/1992",
         issueDate: "03/01/2024",
         validTillDate: "03/01/2028",
         issuedBy: "FA Ministry",
         imageName: "residence_permit_image"))
         
         Button(action: {
         self.isVerified.toggle()
         }) {
         Text(isVerified ? "Finish" : "Next")
         }
         .padding()
         .disabled(!isVerified)
         }
         //        .navigationBarTitle("Residence Permit")
         
         }*/
    }
}


struct NewDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        // Simulate the binding using a @State variable
        let isNewDocumentViewPresented = Binding<Bool>(
            get: { false },
            set: { _ in }
        )
        
        return NewDocumentView(isNewDocumentViewPresented: isNewDocumentViewPresented)
    }
}

struct RecognizedDataView_Previews: PreviewProvider {
    static var previews: some View {
        // Simulate the binding using a @State variable
        let isNewDocumentViewPresented = Binding<Bool>(
            get: { false },
            set: { _ in }
        )
        
        return RecognizedDataView(isNewDocumentViewPresented: isNewDocumentViewPresented)
    }
}


//
//#Preview {
//    NewDocumentView()
//}
//
//
//
//
//#Preview {
//    RecognizedDataView()
//}
