//
//  NominationFormViewModel.swift
//  Nominations
//
//  Created by Raju Dhumne on 07/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

/// Rating Enum
enum Rating: String, CaseIterable {
    case veryUnfair = "very_unfair"
    case unfair
    case notSure = "not_sure"
    case fair
    case veryFair = "very_fair"
}

class NominationFormViewModel: ObservableObject {
    
    // Properties
    @Published var nomineesModel: NomineesModel
    @Published var enableCreateNominationButton = false
    @Published var showNominationSubmittedView: Bool = false
    @Published var showAlert: Bool = false
    @Published var ratings: [RatingModel] = [
        RatingModel(image: "very_unfair", title: "Very Unfair", selected: false, rating: .veryUnfair),
        RatingModel(image: "unfair", title: "Unfair", selected: false, rating: .unfair),
        RatingModel(image: "not_sure", title: "Not Sure", selected: false, rating: .notSure),
        RatingModel(image: "fair", title: "Fair", selected: false, rating: .fair),
        RatingModel(image: "very_fair", title: "Very Fair", selected: false, rating: .veryFair),
    ]
    
    @Published var reasonText: String = ""
    var nomineeId: String?
    var selectedRating: String?
    
    // Nomination Form API Calling Service
    let nominationFormService = NominationFormService()
    
    init(nomineesModel: NomineesModel) {
        self.nomineesModel = nomineesModel
    }

    func ratingTapped(index: Int) {
        resetRatings()
        ratings[index].selected = true
        self.selectedRating = ratings[index].rating.rawValue
        validateForm()
    }
    
    private func resetRatings() {
        for index in ratings.indices {
            ratings[index].selected = false
        }
    }
    
    func validateForm() {
        guard let nomineeId = self.nomineeId, !nomineeId.isEmpty, let selectedRating = self.selectedRating, !selectedRating.isEmpty, !reasonText.isEmpty else {
            enableCreateNominationButton = false
            return
        }
        enableCreateNominationButton = true
    }
    
    func resetForm() {
        nomineeId = nil
        reasonText = ""
        selectedRating = nil
        resetRatings()
    }
    
    // API Call
    func submitForm() {
        let nomination = NominationRequestModel(nomineeID: nomineeId ?? "", reason: reasonText, process: selectedRating ?? "")
        nominationFormService.submitForm(model: nomination) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    self?.showNominationSubmittedView = true
                case .failure(_):
                    self?.showAlert = true
                }
            }
        }
    }
}
