//
//  MealDetailView.swift
//  MealDBSwiftUI
//
//  Created by Tiffany Sakaguchi on 7/5/23.
//

import SwiftUI

struct MealDetailView: View {
    
    @StateObject var viewModel: MealDetailViewModel
    
    var body: some View {
        List {
            VStack(alignment: .center, spacing: 16) {
                AsyncImage(url: viewModel.imageURL) { image in
                    image
                        .resizable()
                        .padding(.top)
                } placeholder: {
                      ProgressView()
                }
                .frame(width: 200, height: 200)
                Text(viewModel.strMeal)
                    .font(.title)
                Text(viewModel.formattedInstructions)
                    .font(.caption)
            }
            
            ForEach(Array(zip(viewModel.filteredIngredients.indices, viewModel.filteredIngredients)), id: \.0) { index, ingredient in
                HStack {
                    Text(ingredient)
                    Spacer()
                    Text(viewModel.filteredMeasures[index])
                }
            }
        }
        .onAppear {
            viewModel.fetchSingleMeal()
        }
    }
}

//struct MealDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MealDetailView()
//    }
//}
