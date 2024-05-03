//
//  FinanceViewModel.swift
//  TeenFinance
//
//  Created by MACBOOK PRO on 02/05/24.
//

import Foundation
import GoogleGenerativeAI


@MainActor
class FinanceViewModel: ObservableObject{
    private var geminiModel: GenerativeModel?
     @Published var finance2: [FinanceModel] = []
    @Published var finance: [Finance] = []
    @Published var isReady: Bool = false
    @Published var budget: String = ""
    @Published var prompt: String = ""
     @Published var prompt2: String = ""
    @Published var isLoading: Bool = false
    
    
    init(){
        self.geminiModel = GenerativeModel(name: "gemini-pro", apiKey: Constant.apiKey)
        //configureGenerativeModel()
    }
    
    func configureGenerativeModel() {
        Task{
            do{
                    let apiKey: String = try await RemoteConfigService.shared.fetchConfig(forKey: .apiKey)
                    self.geminiModel = GenerativeModel(name: "gemini-pro", apiKey: apiKey)
                    self.isReady = true
                self.isLoading = true
            }
            catch{
                print("Error configure generative model \(error)")
                self.isLoading = false
            }
        }
        
    }
    
    func ConfirmBudget() async {
        isLoading = true
        defer {
            isLoading = false
        }
//        prompt2 = """
//                        I have an income of \(budget), not married and a teenager. please make a budget allocation for me with financial posts
//                - saving
//                - entertainment
//                - allowances
//                - life style
//                - school
//                as  JSON like this format:
//             
//                "saving": {
//                      "percentage": 25,
//                      "amount": 250000
//                    },
//                "school": {
//                      "percentage": 25,
//                      "amount": 250000
//                    },
//                "allowance": {
//                      "percentage": 20,
//                      "amount": 200000
//                    },
//                "lifestyle": {
//                      "percentage": 20,
//                      "amount": 200000
//                    },
//                "entertainment": {
//                      "percentage": 10,
//                      "amount": 100000
//                    }
//             
//             only. Remove any backticks.
//             """
        prompt = """
                I have an income of \(budget), not married and a teenager. please make a budget allocation for me with financial posts for saving as JSON string format like this format
        [
            {
                "name": "name",
                "percentage": 0.25,
                "amount": "25000"
            }
        ]
             only. Remove any backticks.
        """
        
        guard let geminiModel = self.geminiModel else{
            print("generative model is not configured")
            return
        }
        do{
            let response = try await geminiModel.generateContent(prompt)
            //encoding
            guard let text = response.text, let data = text.data(using: .utf8)
            
            else{
                print("😅 Unable to extract text or convert to data")
                return
            }
//            print("Received JSON: \(String(data: data, encoding: .utf8) ?? "Invalid data")")
            //decoding
            finance = try JSONDecoder().decode([Finance].self, from: data)
            print(finance)
        }
        catch{
            print("🤬 Error fetching budget: \(error.localizedDescription)")
        }
    }
}
