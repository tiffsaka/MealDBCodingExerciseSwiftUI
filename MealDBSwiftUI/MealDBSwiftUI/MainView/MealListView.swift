//
//  MealListView.swift
//  MealDBSwiftUI
//
//  Created by Tiffany Sakaguchi on 7/3/23.
//

import SwiftUI

struct MealListView: View {
    
    @StateObject var viewModel = MealViewModel(service: MealService())
    
    var body: some View {
        List(viewModel.meals) { meal in
            NavigationLink {
                MealDetailView(viewModel: MealDetailViewModel(meal: meal, service: MealService()))
            } label: {
                MealListRow(meal: meal)
            }
        }
        .padding()
        .task {
            await viewModel.fetchMeals()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
