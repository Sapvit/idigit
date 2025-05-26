//
//  KYCView.swift
//  IDigit
//
//  Created by Nikolay Khort on 27.03.2024.
//

import SwiftUI

struct KYCGeneralInfoView: View {
    @State private var name: String
    @State private var middleName: String
    @State private var lastName: String
    @State private var birthDate: String
    @State private var nationality: String
    @State private var countryOfResidence: String
    @Binding var isKYC: Bool
    
    init(isKYC: Binding<Bool>) {
        self._name = State(initialValue: "Jon")
        self._middleName = State(initialValue: "")
        self._lastName = State(initialValue: "Doe")
        self._birthDate = State(initialValue: "04 Jun 1992")
        self._nationality = State(initialValue: "American")
        self._countryOfResidence = State(initialValue: "USA")
        self._isKYC = isKYC
    }
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Name")
                            .font(.caption)
                        TextField("Enter your name", text: $name)
                            .disabled(true)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Middle Name")
                            .font(.caption)
                        TextField("Enter your middle name", text: $middleName)
                            .disabled(true)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Last Name")
                            .font(.caption)
                        TextField("Enter your last name", text: $lastName)
                            .disabled(true)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Date of Birth")
                            .font(.caption)
                        TextField("Enter your birth date", text: $birthDate)
                            .disabled(true)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Nationality")
                            .font(.caption)
                        TextField("Enter your nationality", text: $nationality)
                            .disabled(true)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Country of Residence")
                            .font(.caption)
                        TextField("Enter your country of residence", text: $countryOfResidence)
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
                                    Image("id_image")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(8)
                                        .padding(.bottom, 5)
                                    Text("ID")
                                        .font(.caption)
                                }
                                VStack {
                                    Image("passport_image")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(8)
                                        .padding(.bottom, 5)
                                    Text("Passport")
                                        .font(.caption)
                                }
                            }
                        }
                        Spacer(minLength: 50)
                    }
                    NavigationLink(destination: KYCWealthInfoView(isKYC: $isKYC)) {
                        Text("Next")
                    }
                }
                .padding()
            .navigationBarTitle("General Information")
        .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct KYCWealthInfoView: View {
    @Binding var isKYC: Bool
    @State private var monthlyIncome: String
    @State private var sourceOfIncome: String
    @State private var sourceOfWealth: String
    
    init(isKYC: Binding<Bool>) {
            self._isKYC = isKYC
            self._monthlyIncome = State(initialValue: "$5000")
            self._sourceOfIncome = State(initialValue: "Salary")
            self._sourceOfWealth = State(initialValue: "Investments")
        }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Monthly Income")
                    .font(.caption)
                TextField("Enter your monthly income", text: $monthlyIncome)
                    .disabled(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Source of Income")
                    .font(.caption)
                TextField("Enter your source of income", text: $sourceOfIncome)
                    .disabled(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Source of Wealth")
                    .font(.caption)
                TextField("Enter your source of wealth", text: $sourceOfWealth)
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
                            Image("tax_declaration_2022")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .cornerRadius(8)
                                .padding(.bottom, 5)
                            Text("Tax declaration 2022")
                                .font(.caption)
                        }
                        VStack {
                            Image("tax_declaration_2023")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .cornerRadius(8)
                                .padding(.bottom, 5)
                            Text("Tax declaration 2023")
                                .font(.caption)
                        }
                    }
                }
                
                Spacer()
            }
            NavigationLink(destination: KYCLivenessCheckView(isKYC: $isKYC)) {
                Text("Next")
            }
        }
        .padding()
        .navigationBarTitle("Wealth Information")
    }
}

struct KYCLivenessCheckView: View {
    @Binding var isKYC: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                Circle()
                .fill(Color.white)
                .frame(width: 200, height: 200)
                .overlay(
                    Circle()
                        .stroke(Color.green, lineWidth: 8)
                        .frame(width: 180, height: 180)
                )
                .overlay(
                Image("liveness_check")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 170, height: 170)
                )
            }
            
            Spacer()
            
            NavigationLink(destination: KYCProcessingView(isKYC: $isKYC)) {
                Text("Next")
            }
//            .disabled(isProcessing)
        }
        .padding()
        .navigationBarTitle("Liveness Check")
    }
}

struct KYCProcessingView: View {
//    @Binding var isProcessing: Bool
    @State private var isVerified = false
    @Binding var isKYC: Bool
    
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
                        isKYC.toggle()
                    }
                }) {
                    Text(isVerified ? "Finish" : "Next")
                }
        }
        .padding()
        .navigationBarTitle("Processing")
    }
}

extension Date {
    func formatted(date style: DateFormatter.Style) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        return formatter.string(from: self)
    }
}


struct AttachmentPreview: View {
    var imageName: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: "photo")
                .resizable()
                .frame(width: 50, height: 50)
                .padding()
            Text(title)
                .padding()
            Spacer()
        }
        .padding(.horizontal)
    }
}


struct KYCGeneralInfoView_Previews: PreviewProvider {
    static var previews: some View {
        return KYCGeneralInfoView(isKYC: .constant(false))
    }
}

struct KYCWealthInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            KYCWealthInfoView(isKYC: .constant(false))
        }
    }
}

struct KYCLivenessCheckView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            KYCLivenessCheckView(isKYC: .constant(false))
        }
    }
}

struct KYCProcessingView_Previews: PreviewProvider {
    static var previews: some View {
        KYCProcessingView(isKYC: .constant(false))
    }
}
