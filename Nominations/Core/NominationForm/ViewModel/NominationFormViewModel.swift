//
//  NominationFormViewModel.swift
//  Nominations
//
//  Created by Raju Dhumne on 07/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

enum Rating: String, CaseIterable {
    case veryUnfair = "very_unfair"
    case unfair
    case notSure = "not_sure"
    case fair
    case veryFair = "very_fair"
}

class NominationFormViewModel: ObservableObject {
    
    @Published var nomineesModel: NomineesModel
    @Published var enableCreateNominationButton = false
    @Published var showNominationSubmittedView: Bool = false
    
    let nominationFormService = NominationFormService()
    
    init(nomineesModel: NomineesModel) {
        self.nomineesModel = nomineesModel
    }
    
    @Published var ratings: [RatingModel] = [
        RatingModel(image: "very_unfair", title: "Very Unfair", selected: false, rating: .veryUnfair),
        RatingModel(image: "unfair", title: "Unfair", selected: false, rating: .unfair),
        RatingModel(image: "not_sure", title: "Not Sure", selected: false, rating: .notSure),
        RatingModel(image: "fair", title: "Fair", selected: false, rating: .fair),
        RatingModel(image: "very_fair", title: "Very Fair", selected: false, rating: .veryFair),
    ]
    
    var nomineeId: String?
    @Published var reasonText: String = ""
    var selectedRating: String?
    
    
    func ratingTapped(index: Int) {
        for index in ratings.indices {
            ratings[index].selected = false
        }
        ratings[index].selected = true
        self.selectedRating = ratings[index].rating.rawValue
    }
    
    func validateForm() {
        if let nomineeId = self.nomineeId,
           let selectedRating = self.selectedRating {
            enableCreateNominationButton = true
            submitForm()
        }else {
            
        }
    }
    
    func submitForm() {
        
        let nomination = NominationRequestModel(nomineeID: nomineeId ?? "", reason: reasonText, process: selectedRating ?? "")
        nominationFormService.submitForm(model: nomination) { [weak self] result in
            switch result {
            case .success(let success):
                self?.showNominationSubmittedView = true
            case .failure(let failure):
                debugPrint(failure)
            }
        }
    }
    
}
