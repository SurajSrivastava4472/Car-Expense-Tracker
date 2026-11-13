//
//  ContentView.swift
//  Car Expense Tracker
//
//  Created by Suraj Srivastava on 10/27/26.
//

import CoreData
import SwiftData
import SwiftUI

struct ContentView: View {

    @Environment(\.modelContext) var context

    @Query var carItems: [CarItem] = []
    @Query var expenseItems: [ExpenseCreatorClass] = []

    @State var creater = false

    var body: some View {
        NavigationStack {

            VStack {
                
            
                

                HStack {

                    Spacer()
                    Text("Car Expense Tracker")
                     .font(.custom("Times", size: 35))

                    Spacer()
                    Button {
                        creater = true
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .navigationDestination(isPresented: $creater) {
                        CreateCarView()
                    }

                    Spacer()
                }
                
                
                ZStack{
                   
                    
                    List {
                        ForEach(0..<carItems.count, id: \.self) { i in
                            HStack{
                                NavigationLink(
                                    carItems[i].name,
                                    destination: CarView(
                                        expenseObjects: expenseItems,
                                        carItem: carItems[i]
                                    )
                                )
                                Text(" Purchased:")
                                Text(carItems[i].purchaseDate, format: .dateTime.day().month().year())
                                
                                
                            }
                            
                        }
                        
                    }
                    
                    
                    if(carItems.count == 0){
                        Spacer()
                        Spacer()
                        Spacer()
                        Text("Press the plus to add a car")
                         .font(.custom("Times", size: 25))
                            .offset(x: 0, y: 20)
                    }
                    
                }
            }

        }

    }

}

#Preview {
    ContentView()
}
