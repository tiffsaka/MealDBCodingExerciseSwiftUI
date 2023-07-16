//
//  MealListRow.swift
//  MealDBSwiftUI
//
//  Created by Tiffany Sakaguchi on 7/5/23.
//

import SwiftUI

struct MealListRow: View {
    
    var meal: Meal
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: meal.strMealThumb ?? "")) { image in
                image
                    .resizable()
                    .cornerRadius(6)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            Text(meal.strMeal?.capitalized ?? "Unnamed Recipe")
        }
    }
}

//struct MealListRow_Previews: PreviewProvider {
//    static var previews: some View {
//        MealListRow()
//    }
//}
