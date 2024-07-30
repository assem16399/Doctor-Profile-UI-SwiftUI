//
//  DoctorInfoAbout.swift
//  Doctor Profile
//
//  Created by Aasem Hany on 30/07/2024.
//

import SwiftUI


struct DoctorProfileAboutTab: View {
    var body: some View{
        ScrollView {
            VStack(alignment:.leading, spacing: 4){
                VStack(alignment:.leading, spacing: 24){
                    ProfileSection(
                        title: "About me",
                        content: "Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. She archived several awards for her wonderful contribution in medical field. She is available for private consultation.")
                    
                    ProfileSection(
                        title: "Working Time",
                        content: "Monday - Friday, 08.00 AM - 20.00 PM")
                    
                    ProfileSection(title: "STR", content: "4726482464")
                    
                    ProfileSection(title: "Pengalaman Praktik", content: "RSPAD Gatot Soebroto",contentColor: .primary)
                    
                }.frame(maxWidth: .infinity)
                
                Text("2017 - sekarang")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
            }
        }
    }
}


#Preview {
    DoctorProfileAboutTab()
}

struct ProfileSection: View {
    let title: String
    let content: String
    let contentColor: Color
    
    init(title: String, content: String, contentColor: Color = .secondary) {
        self.title = title
        self.content = content
        self.contentColor = contentColor
    }
    
    var body: some View {
        VStack(alignment:.leading,spacing: 12){
            Text(title)
                .font(.headline)
            
            Text(content)
                .font(.caption)
                .foregroundStyle(contentColor)
        }
    }
}
