//
//  SettingsView.swift
//  IDigit
//
//  Created by Nikolay Khort on 21.03.2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var notificationEnabled = true
    @State private var darkModeEnabled = false
    @State private var autoBackupEnabled = true
    
    var body: some View {
        Form {
            Section(header: Text("Notifications")) {
                Toggle(isOn: $notificationEnabled) {
                    HStack {
                        Image(systemName: "bell")
                            .foregroundColor(.blue)
                        Text("Enable Notifications")
                    }
                }
                
                Toggle(isOn: $autoBackupEnabled) {
                    HStack {
                        Image(systemName: "cloud.fill")
                            .foregroundColor(.green)
                        Text("Auto Backup")
                    }
                }
            }
            
            Section(header: Text("Appearance")) {
                Toggle(isOn: $darkModeEnabled) {
                    HStack {
                        Image(systemName: "moon.fill")
                            .foregroundColor(.purple)
                        Text("Dark Mode")
                    }
                }
            }
            
            Section(header: Text("Account")) {
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(.orange)
                        Text("Sign out")
                    }
                }
            }
        }
        .navigationBarTitle("Settings")
    }
}
#Preview {
    SettingsView()
}
