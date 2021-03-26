//
//  CompChooseSignView.swift
//  Horoscope
//
//  Created by Никита Фролов  on 02.03.2021.
//

import SwiftUI

struct CompChooseSignView: View {
    @ObservedObject var user: UserDate
    @State var selector1 = 5
    @State var selector2 = 5
    
    let items = arrayOfAllSign.map{CircleComp(imageName: $0)}
    let screenWidht = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            Text("Выберите знаки")
                .font(.custom("Jost-Bold", size: 20))
            ScrollableHStack(items: items, widhtItems: 120, heightItems: 200, spacing: 25, selector: $selector1, startIndex: selector1)
            Image(systemName: "plus")
                .imageScale(.large)
                .padding(.top, 5)
            ScrollableHStack(items: items, widhtItems: 120, heightItems: 200, spacing: 20, selector: $selector2, startIndex: selector2)
                .padding(.bottom, 5)
            NavigationLink(destination: CompView(signsOfPartner: [arrayOfAllSign[11 - selector1], arrayOfAllSign[11 - selector2]], user: user)) {
                Text("Далее")
                    .font(.custom("Jost-Bold", size: 20))
                    .foregroundColor(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 300, height: 50, alignment: .center)
                            .foregroundColor(Color.init("YelowBut"))
                    )
                    .frame(width: 300, height: 50, alignment: .center)
            }
        }
        .navigationTitle("Назад")
    }
}

struct CompChooseSignView_Previews: PreviewProvider {
    static var previews: some View {
        CompChooseSignView(user: UserDate())
    }
}
