//
//  ScrollableHStack.swift
//  Horoscope
//
//  Created by Никита Фролов  on 03.03.2021.
//

import SwiftUI

struct ScrollableHStack<Views: View>: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var items: [Views]
    var count: Int
    var widhtItems: CGFloat
    var heightItems: CGFloat
    var spacing: CGFloat
    var contentSize: CGFloat
    var startIndex: Int
    
    @State private var scrollOffset: CGFloat
    @State private var dragOffset: CGFloat
    @Binding var selector: Int
    
    init(items: [Views], widhtItems: CGFloat, heightItems: CGFloat, spacing: CGFloat, selector: Binding<Int>, startIndex: Int) {
        self.items = items
        self.count = items.count
        self.widhtItems = widhtItems
        self.heightItems = heightItems
        self.spacing = spacing
        self.startIndex = startIndex
        
        self.contentSize = CGFloat(count) * widhtItems + CGFloat(count - 1) * spacing
        
        let screenWidth = UIScreen.main.bounds.width
        let indexCG = CGFloat(startIndex)
        
        let newPos = indexCG * widhtItems + (indexCG - 1) * spacing - (contentSize / 2.0) + (screenWidth / 2.0) - ((screenWidth - widhtItems) / 2.0) + spacing
        
        self._scrollOffset = State(initialValue: newPos)
        self._dragOffset = State(initialValue: 0)
        self._selector = selector
    }
    
    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<items.count) { index in
                items[index]
                    .frame(width: widhtItems, height: heightItems)
                    .scaleEffect(calculateIndex() == items.count - 1 - index ? 1.25 : 1)
                    .foregroundColor(calculateIndex() == items.count - 1 - index ? .blue : (colorScheme == .dark ? .white : .black))
                    .onTapGesture {
                        let screenWidth = UIScreen.main.bounds.width
                        let indexCG = CGFloat(items.count - 1 - index)
                        let newOffset = indexCG * widhtItems + (indexCG - 1) * spacing - (contentSize / 2.0) + (screenWidth / 2.0) - ((screenWidth - widhtItems) / 2.0) + spacing
                        
                        withAnimation(.easeOut) {
                            self.selector = items.count - 1 - index
                            scrollOffset = newOffset
                        }
                    }
                    .offset(x: scrollOffset + dragOffset, y: 0)
                    .gesture(
                        DragGesture()
                            .onChanged({ event in
                                dragOffset = event.translation.width
                            })
                            .onEnded({ event in
                                // Scroll to where user dragged
                                scrollOffset += event.translation.width
                                dragOffset = 0
                                let screenWidth = UIScreen.main.bounds.width
                                
                                // Center position of current offset
                                let center = scrollOffset + (screenWidth / 2.0) + (contentSize / 2.0)
                                
                                // Calculate which item we are closest to using the defined size
                                var index = (center + (event.predictedEndTranslation.width / 2.0) - (screenWidth / 2.0)) / (widhtItems + spacing)
                                
                                // Should we stay at current index or are we closer to the next item...
                                if index.remainder(dividingBy: 1) > 0.5 {
                                    index += 1
                                } else {
                                    index = CGFloat(Int(index))
                                }
                                
                                // Protect from scrolling out of bounds
                                index = min(index, CGFloat(count) - 1)
                                index = max(index, 0)
                                self.selector = Int(index)
                                
                                // Set final offset (snapping to item)
                                let newOffset = index * widhtItems + (index - 1) * spacing - (contentSize / 2.0) + (screenWidth / 2.0) - ((screenWidth - widhtItems) / 2.0) + spacing
                                
                                // Animate snapping
                                withAnimation(.easeOut) {
                                    scrollOffset = newOffset
                                }
                            })
                    )
            }
        }
    }
    
    private func calculateIndex()->Int {
        let screenWidth = UIScreen.main.bounds.width
        let center = scrollOffset + dragOffset + (screenWidth / 2.0) + (contentSize / 2.0)
        var index = (center - (screenWidth / 2.0)) / (widhtItems + spacing)
        if index.remainder(dividingBy: 1) > 0.5 {
            index += 1
        } else {
            index = CGFloat(Int(index))
        }
        
        index = min(index, CGFloat(count) - 1)
        index = max(index, 0)
        let indexInt = Int(index)
        return indexInt
    }
}

struct ScrollableHStack_Previews: PreviewProvider {
    static var previews: some View {
        ScrollableHStack(items: dictOfSign.map{CircleComp(imageName: $0.key)}, widhtItems: 120, heightItems: 200, spacing: 15, selector: .constant(0), startIndex: 5)
    }
}
