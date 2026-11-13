//
//  CarView.swift
//  Car Expense Tracker
//
//  Created by Suraj Srivastava on 10/29/26.
//

import SwiftUI
import SwiftData


struct CarView: View {
    
    
     var expenseObjects:[ExpenseCreatorClass]
    var carItem:CarItem
    @State var thisCarExpenses:[ExpenseCreatorClass] = []
    @State var go = false
    @State var total = 0.0
    
    
    @State var over50 = false
    
    var body: some View {
        
        HStack{
            
            
            Spacer()
            Spacer()
            Spacer()
            Text(carItem.name)
                .font(.custom("Times", size: 54))
            
            Spacer()
            Spacer()
            
            VStack{
            Button {
                go = true
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .navigationDestination(isPresented: $go) {
                ExpenseAdderView(attacher: carItem.name)
                
            }
            
                Text("Add Expense")
                    .font(.custom("Times", size: 10))
                    .foregroundStyle(.blue)
            
        }
            Spacer()
        }
        
        VStack{
         
        }
        .onAppear {
            
            for i in 0..<expenseObjects.count{
                if expenseObjects[i].carName == carItem.name {
                    thisCarExpenses.append(expenseObjects[i])
                    total = expenseObjects[i].espenseAmount + total
                }
            }
            
            if total >= (carItem.cost/2){
                over50.toggle()
            }
            
            
        }
        NavigationStack{
            HStack{
                
               // Text(carItem.name)
                Text("Original Cost:")
                Text(carItem.cost,  format: .currency(code: "USD"))
                   
                
            }
            HStack{
                Text("Total Expenses:")
                Text(total, format: .currency(code: "USD"))
            }
            
          
            
            List{
                ForEach(thisCarExpenses){ expense in
                    HStack{
                        Text(expense.forWhat)
                        Text(expense.espenseAmount, format: .currency(code: "USD"))
                        Text(expense.date, format: .dateTime.day().month().year()) 
                        
                    }
                }
            }
            
        }
        .alert("Warning: the expenses on this car exceede 50% of the original purchase price", isPresented: $over50) {
        
    }
    }
        
}

//#Preview {
//    CarView()
//}
