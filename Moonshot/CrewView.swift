//
//  CrewView.swift
//  Moonshot
//
//  Created by Tristin Smith on 7/16/24.
//

import SwiftUI

struct CrewView: View {
    
    let mission: Mission
    let crew: [CrewMember]
    let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    
    var body: some View {
        Text("Crew")
            .font(.title.bold())
            .padding(.leading, 13)
            .frame(maxWidth: .infinity, alignment: .leading)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.circle)
                                .overlay {
                                    Circle()
                                        .strokeBorder(.indigo, lineWidth: 1)
                                    
                                }
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                
                                Text(crewMember.role)
                                    .foregroundStyle(crewMember.role == "Command Pilot" ? skyBlue : .gray)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}


