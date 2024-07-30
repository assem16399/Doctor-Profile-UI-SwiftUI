//
//  DoctorInfoHeader.swift
//  Doctor Profile
//
//  Created by Aasem Hany on 30/07/2024.
//

import SwiftUI

 
struct DoctorProfileHeader: View {
    var body: some View {
        HStack(spacing: 12){
            Image(.profile)
                .resizable()
                .scaledToFill()
                .frame(width: 74, height: 74)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment:.leading){
                
                Text("Dr. Randy Wigham")
                    .font(.headline)
                
                
                Spacer()
                
                Text("General  |  RSUD Gatot Subroto")
                    .font(.caption)
                    .foregroundStyle(Color(red: 97/255, green: 97/255, blue: 97/255))
                
                
                Spacer()
                
                Label {
                    Text("4.8 (4279 reviews)")
                        .font(.caption2)
                        .foregroundStyle(Color(red: 97/255, green: 97/255, blue: 97/255))
                } icon: {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .imageScale(.small)
                }
                
            }
            .lineLimit(1)
            
            Spacer()
            
            Button{
                
            }label: {
                Image(.message)
                    .resizable()
                    .frame(width: 24,height: 24)
                    .padding(.bottom, 28)
                    .foregroundStyle(Color(red:36/255, green: 124/255,blue: 1))
            }
            
            
            
        }
        .frame(height: 74)
    }
}

#Preview {
    DoctorProfileHeader()
}
