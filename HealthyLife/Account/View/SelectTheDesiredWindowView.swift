//
//  SelectTheDesiredWindowView.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 11.06.2023.
//

import SwiftUI

struct SelectTheDesiredWindowView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if viewModel.userSession == nil {
            SignInView()
        } else {
            AccountView()
        }
    }
}

struct selectTheDesiredWindowView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTheDesiredWindowView()
    }
}
