//
//  CompView.swift
//  Horoscope
//
//  Created by Никита Фролов  on 25.02.2021.
//

import SwiftUI

struct CompView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var user: UserDate
    
    let colorsArray = [
        ["Love", "LoveBackground"],
        ["Fried","FriedBackground"],
        ["Work", "WorkBackground"],
        ["Family", "FamilyBackground"]
    ]
    
    @State var signsOfPartner: [String]
    var info: CompForView
    
    init(signsOfPartner: [String], user: UserDate) {
        self.user = user
        self._signsOfPartner = State(initialValue: signsOfPartner)
        self.info = transformInfoComp(parnter: signsOfPartner, compInfo: user.compData)
    }
    
    let imageName = [
        "heart", "hand.wave", "bag", "house"
    ]
    
    let labelsForRec = [
        "Общая", "Любовь", "Дружба", "Работа", "Семья"
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                ScrollViewReader { proxy in
                    HeaderComp(imageNames: signsOfPartner)
                        .padding()
                    HStack(spacing: 0) {
                        ForEach(0..<4) { i in
                            Button(action: {
                                withAnimation(.easeInOut(duration: 60)) {
                                    if i == 3 {
                                        proxy.scrollTo(i + 1, anchor: .center)
                                    } else {
                                        proxy.scrollTo(i + 1, anchor: .top)
                                    }
                                }
                                
                            }, label: {
                                RectangleWithImage(color: colorsArray[i][1], imageName: imageName[i], imageColor: colorsArray[i][0], percent: info.arrayOfProcent[i + 1], label: labelsForRec[i + 1])
                            })
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        }
                    }
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(0..<5) { j in
                            VStack {
                                HStack {
                                    Text("\(labelsForRec[j]) - ")
                                        .font(.custom("Jost-Bold", size: 20))
                                    +
                                    Text("\(info.arrayOfProcent[j])")
                                        .font(.custom("Jost-Bold", size: 20))
                                        .foregroundColor(Color.init("Fried"))
                                    Spacer()
                                }
                                .id(j)
                                .fixedSize(horizontal: false, vertical: true)
                                Text("\(info.arrayOfText[j])")
                                    .font(.custom("Jost-Light", size: 18))
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.leading, 10)
                                    .padding(.trailing, 10)
                            }
                        }
                    }
                }
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .padding(.top, 10)
                
            }
            .navigationTitle("Совместимость")
        }
    }
}

struct CompView_Previews: PreviewProvider {
    static var previews: some View {
        CompView(signsOfPartner: ["Aries", "Scorpio"], user: UserDate())
    }
}
