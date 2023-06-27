//
//  SelectTheDesiredWindowCalculateView.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 21.06.2023.
//

import SwiftUI

struct SelectTheDesiredWindowCalculateView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if viewModel.userSession != nil && viewModel.currenUser?.calorie == 0 {
            CalculatorView()
        } else {
            CalculatorViewResult(calorie: viewModel.currenUser!.calorie, speedResult: viewModel.currenUser!.speedResult, lightResult: viewModel.currenUser!.lightResult)
        }
    }
}

struct SelectTheDesiredWindowCalculateView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTheDesiredWindowCalculateView()
    }
}
