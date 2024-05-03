//
//  ChartView.swift
//  TeenFinance
//
//  Created by MACBOOK PRO on 03/05/24.
//

import SwiftUI
import Charts

struct ChartView: View {
    @StateObject var financeVM = FinanceViewModel()
    
    let budget: [Budget] = Bundle.main.decode("data.json")
    var body: some View {
        
//        Chart(financeVM.finance, id: \.self) { item in
//            RuleMark(y: .value("Average", average(financeVM.finance)))
//                .accessibilityHidden(true)
//                .foregroundStyle(Color.gray)
//                .lineStyle(StrokeStyle(lineWidth: 1, dash:[5]))
//                .annotation(alignment: .leading){
//                    Text("average")
//                        .font(.caption)
//                        .foregroundStyle(.secondary)
//                }
//            BarMark(
//                x: .value("Name", item.name),
//                y: .value("Percentage", item.percentage)
//            )
//            .cornerRadius(5)
//            .foregroundStyle(by: .value("Name", item.name))
//            .accessibilityLabel("\(item.name): \(Int(item.percentage)) percentage")
//            
//        }
//        .chartPlotStyle { plotContent in
//            plotContent
//                .background(.thinMaterial)
//        }
//        .frame(height: 300)
//        .padding()
        
        NavigationStack {
            Chart(budget) { item in
                RuleMark(y: .value("Average", average(budget)))
                    .accessibilityHidden(true)
                    .foregroundStyle(Color.gray)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash:[5]))
                    .annotation(alignment: .leading){
                        Text("average")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                BarMark(
                    x: .value("Name", item.name),
                    y: .value("Percentage", item.percentage*100)
                )
                .cornerRadius(5)
                .foregroundStyle(by: .value("Name", item.name))
                .accessibilityLabel("\(item.name): \(Int(item.percentage*100)) percentage")
                
            }
            .navigationTitle("Planning Budget")
            .navigationBarTitleDisplayMode(.inline)
            .chartPlotStyle { plotContent in
                plotContent
                    .background(.thinMaterial)
            }
            .frame(height: 300)
        .padding()
        }
        
        
        
        
        
        
        
        //        Chart(financeVM.finance, id: \.self) { item in
        //            RuleMark(y: .value("Average", average(financeVM.finance)))
        //                .accessibilityHidden(true)
        //                .foregroundStyle(Color.gray)
        //                .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
        //                .annotation(alignment: .leading) {
        //                    Text("Average")
        //                        .font(.caption)
        //                        .foregroundStyle(.secondary)
        //                }
        //
        //            BarMark(
        //                x: .value("name", item.name),
        //                y: .value("Percentage", item.percentage)
        //            )
        //            .cornerRadius(5)
        //            .foregroundStyle(by: .value("name", item.name))
        //            .accessibilityLabel("\(item.name): \(Int(item.percentage*100)) percentage")
        //        }
        //
        //        .chartPlotStyle(content: { plotContent in
        //            plotContent
        //                .background(.thinMaterial)
        //        })
        //        .frame(height: 300)
        //        .padding()
        //        .accessibilityLabel("Monthly Listeners Bar Chart")
        //        .accessibilityValue("Shows listeners trend for the first six months. \(accessibilitySummary())")
        //    }
        //
        
        
        //        if increasing > decreasing {
        //            return "Listeners generally increased over the months."
        //        } else if decreasing > increasing {
        //            return "Listeners generally decreased over the months."
        //        } else {
        //            return "Listeners remained relatively stable over the months."
        //        }
    }
    
    //Mark: - FUNCTION
    func average(_ percentage: [Budget]) -> Double {
        var average: Double = 0
        for percent in percentage {
            average += percent.percentage*100
        }
        return average / Double(percentage.count)
    }
    //
//    func accessibilitySummary() -> String {
//        var increasing = 0
//        var decreasing = 0
//        
//        for i in 1..<financeVM.finance.count {
//            if financeVM.finance[i].percentage > financeVM.finance[i - 1].percentage {
//                increasing += 1
//            } else if financeVM.finance[i].percentage < financeVM.finance[i - 1].percentage {
//                decreasing += 1
//            }
//        }
//    }

}



#Preview {
    ChartView()
}
