//
//  KYBView.swift
//  IDigit
//
//  Created by Nikolay Khort on 27.03.2024.
//

import SwiftUI

struct KYBGeneralInfoView: View {
    @State private var legalEntityName: String
    @State private var registrationNumber: String
    @State private var incorporationDate: String
    @State private var countryOfIncorporation: String
    @State private var legalEntityType: String
    @State private var legalEntityStatus: String
    @Binding var isKYB: Bool
    
    init(isKYB: Binding<Bool>) {
        self._legalEntityName = State(initialValue: "Tech Innovations Inc.")
        self._registrationNumber = State(initialValue: "REG123456")
        self._incorporationDate = State(initialValue: "January 1, 2000")
        self._countryOfIncorporation = State(initialValue: "USA")
        self._legalEntityType = State(initialValue: "Corporation")
        self._legalEntityStatus = State(initialValue: "Active")
        self._isKYB = isKYB
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Legal Entity Name")
                            .font(.caption)
                        TextField("Enter legal entity name", text: $legalEntityName)
                            .disabled(true)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Registration Number")
                            .font(.caption)
                        TextField("Enter registration number", text: $registrationNumber)
                            .disabled(true)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Incorporation Date")
                            .font(.caption)
                        TextField("Enter incorporation date", text: $incorporationDate)
                            .disabled(true)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Country of Incorporation")
                            .font(.caption)
                        TextField("Enter country of incorporation", text: $countryOfIncorporation)
                            .disabled(true)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Legal Entity Type")
                            .font(.caption)
                        TextField("Enter legal entity type", text: $legalEntityType)
                            .disabled(true)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Legal Entity Status")
                            .font(.caption)
                        TextField("Enter legal entity status", text: $legalEntityStatus)
                            .disabled(true)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Divider()
                        
                        HStack {
                            Text("Attachments")
                                .font(.headline)
                                .foregroundColor(.blue)
                            Spacer()
                            Image(systemName: "plus.circle")
                                .font(.title)
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    // Add attachment action
                                }
                        }
                        ScrollView(.horizontal) {
                            HStack(spacing: 40) {
                                VStack {
                                    Image("commercial_register")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(8)
                                        .padding(.bottom, 5)
                                    Text("Commercial register")
                                        .font(.caption)
                                }
                                VStack {
                                    Image("articles_of_association")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(8)
                                        .padding(.bottom, 5)
                                    Text("AOA")
                                        .font(.caption)
                                }
                            }
                        }
                        Spacer(minLength: 50)
                    }
                    NavigationLink(destination: KYBFinancialInfoView(isKYB: $isKYB)) {
                        Text("Next")
                    }
                }
                .padding()
                .navigationBarTitle("Legal Entity Information")
            .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct KYBFinancialInfoView: View {
    @State private var leiNumber: String
    @State private var vatNumber: String
    @State private var licenseNumber: String
    @Binding var isKYB: Bool
    
    init(isKYB: Binding<Bool>) {
        self._leiNumber = State(initialValue: "LEI123456")
        self._vatNumber = State(initialValue: "VAT123456")
        self._licenseNumber = State(initialValue: "LICENSE123456")
        self._isKYB = isKYB
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("LEI Number")
                    .font(.caption)
                TextField("Enter LEI number", text: $leiNumber)
                    .disabled(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("VAT Number")
                    .font(.caption)
                TextField("Enter VAT number", text: $vatNumber)
                    .disabled(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("License Number")
                    .font(.caption)
                TextField("Enter license number", text: $licenseNumber)
                    .disabled(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Divider()
                
                HStack {
                    Text("Attachments")
                        .font(.headline)
                        .foregroundColor(.blue)
                    Spacer()
                    Image(systemName: "plus.circle")
                        .font(.title)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            // Add attachment action
                        }
                }
                ScrollView(.horizontal) {
                    HStack(spacing: 40) {
                        VStack {
                            Image("financial_statement_2022")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .cornerRadius(8)
                                .padding(.bottom, 5)
                            Text("FS2022")
                                .font(.caption)
                        }
                        VStack {
                            Image("financial_statement_2023")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .cornerRadius(8)
                                .padding(.bottom, 5)
                            Text("FS2023")
                                .font(.caption)
                        }
                    }
                }
                Spacer()
            }
            NavigationLink(destination: KYBDirectorsInfoView(isKYB: $isKYB)) {
                Text("Next")
            }
        }
        .padding()
        .navigationBarTitle("Financial Information")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct KYBDirectorsInfoView: View {
    @Binding var isKYB: Bool
    @State private var director1Name: String
    @State private var director2Name: String
    @State private var ceoName: String
    @State private var uboName: String
    
    init(isKYB: Binding<Bool>) {
        self._director1Name = State(initialValue: "John Smith")
        self._director2Name = State(initialValue: "Emily Johnson")
        self._ceoName = State(initialValue: "Jon Doe")
        self._uboName = State(initialValue: "William Turner")
        self._isKYB = isKYB
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Director 1")
                    .font(.caption)
                TextField("Enter director 1 name", text: $director1Name)
                    .disabled(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Director 2")
                    .font(.caption)
                TextField("Enter director 2 name", text: $director2Name)
                    .disabled(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("CEO")
                    .font(.caption)
                TextField("Enter CEO name", text: $ceoName)
                    .disabled(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("UBO")
                    .font(.caption)
                TextField("Enter UBO name", text: $uboName)
                    .disabled(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Divider()
                
                HStack {
                    Text("Attachments")
                        .font(.headline)
                        .foregroundColor(.blue)
                    Spacer()
                    Image(systemName: "plus.circle")
                        .font(.title)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            // Add attachment action
                        }
                }
                ScrollView(.horizontal) {
                    HStack(spacing: 40) {
                        VStack {
                            Image("bod_resolution")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .cornerRadius(8)
                                .padding(.bottom, 5)
                            Text("BoD Resolution")
                                .font(.caption)
                        }
                        VStack {
                            Image("ubo_register")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .cornerRadius(8)
                                .padding(.bottom, 5)
                            Text("UBO Register")
                                .font(.caption)
                        }
                    }
                }
                Spacer()
            }
            NavigationLink(destination: KYBProcessingView(isKYB: $isKYB)) {
                Text("Next")
            }
        }
        .padding()
        .navigationBarTitle("Directors Information")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct KYBProcessingView: View {
    @State private var isVerified = false
    @Binding var isKYB: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(isVerified ? "Verified by IDigit on \(Date().formatted(date: .long))" : "Your data is being processed")
                .font(.headline)
                .foregroundColor(isVerified ? .green : .red)
            
            Spacer()
            

                Button(action: {
                    if !isVerified {
                        isVerified.toggle()
                    } else {
                        isKYB.toggle()
                    }
                }) {
                    Text(isVerified ? "Finish" : "Next")
                }
        }
        .padding()
        .navigationBarTitle("Processing")
    }
}

//extension Date {
//    func formatted(date style: DateFormatter.Style) -> String {
//        let formatter = DateFormatter()
//        formatter.dateStyle = style
//        return formatter.string(from: self)
//    }
//}


struct KYBGeneralInfoView_Previews: PreviewProvider {
    static var previews: some View {
        KYBGeneralInfoView(isKYB: .constant(false))
    }
}


struct KYBFinancialInfoView_Previews: PreviewProvider {
    static var previews: some View {
        KYBFinancialInfoView(isKYB: .constant(true))
    }
}


struct KYBDirectorsInfoView_Previews: PreviewProvider {
    static var previews: some View {
        KYBDirectorsInfoView(isKYB: .constant(true))
    }
}

struct KYBProcessingView_Previews: PreviewProvider {
    static var previews: some View {
        KYBProcessingView(isKYB: .constant(false))
    }
}
