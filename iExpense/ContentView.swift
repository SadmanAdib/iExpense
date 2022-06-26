//
//  ContentView.swift
//  iExpense
//
//  Created by Sadman Adib on 26/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    @State private var currencySelection = "USD"
    
    let options = ["CAD", "USD", "AUD", "EUR", "INR", "JPY", "THB"]
    
    var body: some View {
        NavigationView {
            List {
                Section{
                    Picker("Currency Options", selection: $currencySelection){
                        ForEach(options, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }header: {
                    Text("Please select a currency ")
                }

                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        Text(item.amount, format: .currency(code: currencySelection))
                            .foregroundColor(item.amount > 100 ? .red : (item.amount > 10 ? .blue : .green))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
