//
//  ContentView.swift
//  Doctor Profile
//
//  Created by Aasem Hany on 27/07/2024.
//



import SwiftUI

enum Constants {
    static let backIcon: String = "chevron.backward"
    static let moreIcon: String = "ellipsis"
}

struct DoctorProfileView: View {
    @State private var selectedTabIndex: Int = 0
    var body: some View {
        NavigationStack{
            VStack(spacing:0){
                DoctorProfileHeader()
                    .padding(.bottom,24.0)
                
                TabBarView(currentTabIndex: $selectedTabIndex).padding(.bottom,32)
                
                TabView(selection: $selectedTabIndex){
                    
                    DoctorProfileAboutTab().tag(0)
                    DoctorProfileLocationTab().tag(1)
                    DoctorProfileReviewsTab().tag(2)
                    
                }.tabViewStyle(.page(indexDisplayMode: .never))
                    .padding(.bottom, 16)
                
                Button{
                    print("Make An Appointment")
                }label: {
                    Text("Make An Appointment")
                        .font(.headline)
                        .frame(width: 327,height: 52)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16.0))
                }
                
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
            .navigationTitle("Dr Randy Wigham")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigation){
                    Button{
                        print("Back Icon Pressed")
                    }label: {
                        CustomToolbarItem(icon: Constants.backIcon)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        print("More Icon Pressed")
                    }label: {
                        CustomToolbarItem(icon: Constants.moreIcon)
                    }
                }
            }
        }
    }
}

#Preview {
    DoctorProfileView()
}

struct CustomToolbarItem: View {
    let icon: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 40,height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray.opacity(0.9), lineWidth: 0.2)
                )
                .foregroundStyle(.background)
            
            Image(systemName: icon)
                .imageScale(.medium)
                .fontWeight(.medium)
                .foregroundStyle(Color(uiColor: UIColor(.primary)))
        }
    }
}


struct TabBarView: View {
    @Binding var currentTabIndex: Int
    @Namespace var namespace
    
    let tabBarTitles = ["About", "Location", "Reviews"]
    
    var body: some View{
        HStack(spacing:0){
            ForEach(Array(zip(tabBarTitles.indices, tabBarTitles)), id: \.0){
                (index, title) in
                TabBarItem(currentTabIndex: $currentTabIndex,
                           namespace: namespace.self, 
                           tabTitle: title,
                           tabIndex: index)
            }
        }
        .bold()
        .frame(height: 44)
    }
}

struct TabBarItem: View {
    @Binding var currentTabIndex: Int
    let namespace: Namespace.ID
    
    let tabTitle: String
    let tabIndex: Int
    
    let inactiveTitleColorChannel: Double = 158/255
    let indicatorColorChannel: Double = 237/255
    let blue = Color(red:36/255,green: 124/255,blue: 1)
    
    var indicatorColor: Color{
        currentTabIndex == tabIndex ? blue : Color(red:indicatorColorChannel, green: indicatorColorChannel, blue: indicatorColorChannel)
    }
    
    var titleColor: Color{
        currentTabIndex == tabIndex ? blue : Color(red:inactiveTitleColorChannel, green: inactiveTitleColorChannel, blue: inactiveTitleColorChannel)
    }
    
    var body: some View {
        VStack(spacing: .zero) {
            Button{
                currentTabIndex = tabIndex
            }label: {
                Text(tabTitle)
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                    .foregroundStyle(titleColor)
            }
            
            Color(indicatorColor)
                .frame(height: 1.2)
                .if(currentTabIndex == tabIndex){
                    view in
                    view.matchedGeometryEffect(id: "indicator", in: namespace, properties: .position)
                }
        }.animation(.spring, value: self.currentTabIndex)
    }
}

