//
//  CategoryDetailsView.swift
//  TravelDiscovery
//
//  Created by iMac on 07/11/23.
//

import SwiftUI
import Kingfisher

struct ActivityIndicatorView : UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .white
        return aiv
    }
    
    typealias UIViewType = UIActivityIndicatorView
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        Text("")
    }
}

struct CategoryDetailsView : View {
    @ObservedObject private var vm : CategoryDetailsViewModel
    private let name : String
    
    init(name: String) {
        self.name = name
        self.vm = .init(name:name)
    }
    
    var body : some View {
        if vm.isLoading {
            VStack {
                ActivityIndicatorView()
                Text(Constant.loading)
                    .foregroundColor(.white)
                    .font(.system(size: 16,weight: .semibold))
            }
            .padding()
            .background(Color.black)
        } else {
            ZStack {
                if !vm.isError.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: Constant.xmarkOctagonFill)
                            .font(.system(size: 64,weight: .semibold))
                            .foregroundColor(Color.red)
                        Text(vm.isError)
                    }
                }
                ScrollView {
                    ForEach(vm.places,  id: \.self) { num in
                        VStack(alignment: .leading,spacing: 0) {
                            KFImage(URL(string: num.thumbnail ?? ""))
                                .resizable()
                                .scaledToFill()
                            Text(num.name ?? "")
                                .font(.system(size: 12,weight: .semibold))
                                .padding()
                        }
                        .asTile()
                        .padding()
                    }
                }.navigationBarTitle(name , displayMode: .inline)
            }
        }
    }
}

struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailsView(name: "Art")
    }
}
