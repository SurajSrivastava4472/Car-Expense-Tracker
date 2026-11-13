//
//  ExpenseAdderView.swift
//  Car Expense Tracker
//
//  Created by Suraj Srivastava on 10/29/26.
//

import SwiftUI
import SwiftData



struct ExpenseAdderView: View {
    
    @Environment(\.modelContext) var context
    
    @State var attacher:String
    
    @State var date = Date.now
    @State var amout = ""
    @State var what = ""
    @State var nan = false
    
    
    @FocusState var focusedWhat
    @FocusState var focusedAmount
    
    var body: some View {
        ZStack{
        
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.white)
                .onTapGesture{
                    focusedWhat = false
                    focusedAmount = false
                    print("he")
                }

            
            
            
            
            
        
        VStack{
            Spacer()
            Text(attacher)
                .font(.custom("Times", size: 54))
            
            
            Spacer()
            TextField("What was the expense?", text: $what)
                .focused($focusedWhat)
                .textFieldStyle(.roundedBorder)
                .frame(width: 300)
                .tint(.black)
            //  .foregroundStyle(.black)
                .keyboardType(.default)
            //
            Spacer()
            TextField("How much was the expense?", text: $amout)
                .focused($focusedAmount)
                .textFieldStyle(.roundedBorder)
                .frame(width: 300)
                .tint(.black)
            //  .foregroundStyle(.black)
                .keyboardType(.decimalPad)
            
            Spacer()
            Spacer()
            
            HStack{
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                
                
                
                
                
                
                DatePicker(selection: $date, in: ...Date.now, displayedComponents: .date)
                {
                    Text("Date purchased: ")
                }
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                
            }
            
            Spacer()
            Button("add"){
                
                
                if let doubleAmount = Double(amout){
                    
                    
                    var temp = ExpenseCreatorClass(carName: attacher, espenseAmount: doubleAmount, forWhat: what, date: date)
                    context.insert(temp)
                    try? context.save()
                    focusedWhat = false
                    focusedAmount = false
                    amout = ""
                    what = ""
                }
                else{
                    nan = true
                    focusedWhat = false
                    focusedAmount = false
                    amout = ""
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
            
            
            
            
            
            
        }
        .alert("Please input a number", isPresented: $nan) {
            
        }
        
        
    }
    }
        
}

#Preview {
    ExpenseAdderView(attacher: "Easter")
}
