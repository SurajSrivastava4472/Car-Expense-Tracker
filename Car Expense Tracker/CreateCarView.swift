//
//  CreateCarView.swift
//  Car Expense Tracker
//
//  Created by Suraj Srivastava on 10/28/26.
//

import SwiftUI
import SwiftData

struct CreateCarView: View {
    @Environment(\.modelContext) var context
    
    
    @State var saver = ""
    @State var numSaver = ""
    @State var birthDate = Date.now
    @State var nan = false
    
    @FocusState var focusedSaver
    @FocusState var focusedNumSaver
    
    var body: some View {
        ZStack{
           
           
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.white)
                .onTapGesture{
                    focusedSaver = false
                             focusedNumSaver = false
                    print("he")
                }
            
        VStack{
            
            
            Text("Add Car")
             .font(.custom("Times", size: 35))
            
            
            
        TextField("Input car name", text: $saver)
            .focused($focusedSaver)
            .textFieldStyle(.roundedBorder)
            .frame(width: 300)
            .tint(.black)
        //  .foregroundStyle(.black)
            .keyboardType(.default)
        
        

        Spacer()
        
        TextField("Input car cost", text: $numSaver)
            .focused($focusedNumSaver)
            .textFieldStyle(.roundedBorder)
            .frame(width: 300)
            .tint(.black)
        //  .foregroundStyle(.black)
            .keyboardType(.decimalPad)
        Spacer()
        
       
        
            
            
            HStack{
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
              
                
                
                
                
                
                
                DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date)
                {
                    Text("Date purchased: ")
               
                }
//                .onTapGesture {
//                   focusedSaver = false
//                    focusedNumSaver = false 
//                }
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
        
        Spacer()
        Button("Add"){
            
            if let num = Double(numSaver){
                
                
                var temp = CarItem(name: saver, cost: num, purchaseDate: birthDate)
                
                
                
                print(temp.name)
                context.insert(temp)
                try? context.save()
                
                
                saver = ""
                
                numSaver = ""
                
                focusedSaver = false
                focusedNumSaver = false
            }
            else{
                nan.toggle()
               
                
                numSaver = ""
                focusedNumSaver = false
                
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
    CreateCarView()
}
