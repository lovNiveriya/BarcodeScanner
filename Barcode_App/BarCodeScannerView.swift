//
//  ContentView.swift
//  Barcode_App
//
//  Created by LOVE  on 02/11/23.
//

import SwiftUI

struct BarCodeScannerView: View {
    @State private var scannedString = ""
    @StateObject var viewModel = BarcodeScannerViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    HStack{
                        Text("Barcode Scanner")
                            .bold()
                            .font(.system(size: 35, weight: .bold, design: .default))
                        Spacer()
                    }.padding()
                    Spacer().frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    ScannerView(scannedCode: $scannedString, alertItem: $viewModel.alertItem)
                        .frame(width: UIScreen.main.bounds.width, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    VStack{
                        Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                            .font(.system(size: 20, weight: .medium, design: .default))
                            .padding()
                        Text(scannedString.isEmpty ? "Not Yet Scanned" : scannedString)
                            .font(.system(size: 25, weight: .medium, design: .default))
                            .foregroundStyle(scannedString.isEmpty ? .red : .green)
                    }.padding()
                    Spacer()
                }
            }.alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: Text(alertItem.title),
                      message: Text(alertItem.message),
                      dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    BarCodeScannerView()
}
