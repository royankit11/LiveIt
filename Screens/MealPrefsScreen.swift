//
//  MealPrefsScreen.swift
//  Live It
//
//  Created by Rik Roy on 8/11/21.
//

import SwiftUI

struct MealPrefsScreen: View {
    
    @State var italian = false
    @State var chinese = false
    @State var american = false
    @State var indian = false
    @State var japanese = false
    @State var mexican = false
    @State var chicken = false
    @State var beef = false
    @State var fish = false
    @State var pork = false
    @State var veggie = false
    
    
    var body: some View {
        VStack {
            Spacer().frame(height: 10)
            
            Text("Meal Preferences").font(.custom("DIN Alternate", size: 45))
            
            Spacer().frame(height: 30)
            
            Group {
                HStack {
                    Text("What cuisines do you like?")
                        .font(.custom("DIN Alternate", size: 25))
                        .padding(.leading, 15)
                        .padding(.top, 5)
                    
                    Spacer()
                }
                
                Spacer().frame(height: 10)
                
                HStack {
                    
                    CheckBoxView(checked: $italian)
                        .padding(.leading, 20)
                    
                    Text("Italian")
                        .font(.custom("DIN Alternate", size: 20))
                    
                    Spacer()
                }
                
                HStack {
                    CheckBoxView(checked: $american)
                        .padding(.leading, 20)
                    
                    Text("American")
                        .font(.custom("DIN Alternate", size: 20))

                    
                    Spacer()
                }
                
                HStack {
                    
                    CheckBoxView(checked: $chinese)
                        .padding(.leading, 20)
                    
                    Text("Chinese")
                        .font(.custom("DIN Alternate", size: 20))
                    
                    Spacer()
                }
                
                HStack {
                    CheckBoxView(checked: $japanese)
                        .padding(.leading, 20)
                    
                    Text("Japanese")
                        .font(.custom("DIN Alternate", size: 20))
                    
                    Spacer()
                }
                
                HStack {
                    
                    CheckBoxView(checked: $indian)
                        .padding(.leading, 20)
                    
                    Text("Indian")
                        .font(.custom("DIN Alternate", size: 20))
                    
                    Spacer()
                }

                HStack {
                    
                    CheckBoxView(checked: $mexican)
                        .padding(.leading, 20)
                    
                    Text("Indian")
                        .font(.custom("DIN Alternate", size: 20))
                    
                    Spacer()
                }
            }
            
            Group {
                
                Spacer().frame(height: 20)
                
                HStack {
                    Text("What proteins do you like?")
                        .font(.custom("DIN Alternate", size: 25))
                        .padding(.leading, 15)
                        .padding(.top, 5)
                    
                    Spacer()
                }
                
                Spacer().frame(height: 10)
                
                HStack {
                    
                    CheckBoxView(checked: $chicken)
                        .padding(.leading, 20)
                    
                    Text("Chicken")
                        .font(.custom("DIN Alternate", size: 20))
                    
                    Spacer()
                }
                
                HStack {
                    CheckBoxView(checked: $beef)
                        .padding(.leading, 20)
                    
                    Text("Beef")
                        .font(.custom("DIN Alternate", size: 20))

                    
                    Spacer()
                }
                
                HStack {
                    
                    CheckBoxView(checked: $fish)
                        .padding(.leading, 20)
                    
                    Text("Fish")
                        .font(.custom("DIN Alternate", size: 20))
                    
                    Spacer()
                }
                
                HStack {
                    CheckBoxView(checked: $pork)
                        .padding(.leading, 20)
                    
                    Text("Pork")
                        .font(.custom("DIN Alternate", size: 20))
                    
                    Spacer()
                }
                
                HStack {
                    CheckBoxView(checked: $veggie)
                        .padding(.leading, 20)
                    
                    Text("No protein (vegetarian)")
                        .font(.custom("DIN Alternate", size: 20))
                    
                    Spacer()
                }
            }
            
                        
            
                
            
            Spacer()
        }
    }
}

struct MealPrefsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MealPrefsScreen()
    }
}
