import SwiftUI

struct FullBankList: View {
    
    @Environment(\.presentationMode) var presentationMode
    @GestureState private var dragOffset = CGSize.zero
    let banks: [(id: String, name: String, logo: String)]
    let backButton: Bool
    let onBankTap: CommandWith<String>?
    let onCloseTap: Command
    
    var body: some View {
            ZStack {
                Image.Icons.back
                    .frame(width: 24.0, height: 24)
                    .hLeading()
                    .vTop()
                    .opacity(backButton ? 1.0 : 0.0)
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .padding(16)
                    .zIndex(1)
                
                Image.Icons.close
                    .frame(width: 24.0, height: 24)
                    .hTrailing()
                    .vTop()
                    .onTapGesture {
                        onCloseTap()
                    }
                    .padding(16)
                    .zIndex(1)
                
                
                VStack(spacing: 15) {
                    VStack(spacing: 10) {
                        Image.Icons.logo
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 50)
                        
                        Text(Strings.descriptionText)
                            .font(.system(size: 18))
                            .fontWeight(.regular)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 8) {
                            ForEach(banks, id: \.id) { bank in
                                BankButton(id: bank.id, name: bank.name, logo: bank.logo, onBankTap: onBankTap)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.top, 48)
                //            .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
                //                if(value.startLocation.x < 20 &&
                //                   value.translation.width > 100) {
                //                    self.presentationMode.wrappedValue.dismiss()
                //                }
                //            })
                //            )
            }
            //        .navigationBarTitle("", displayMode: .inline)
            //        .navigationBarBackButtonHidden(true)
            //        .navigationBarItems(leading:
            //            Image.Icons.back
            //                .frame(width: 24.0, height: 24)
            //                .hLeading()
            //                .vTop()
            //                .opacity(backButton ? 1.0 : 0.0)
            //                .onTapGesture {
            //                    self.presentationMode.wrappedValue.dismiss()
            //                }
            //                .padding(16)
            ////                .zIndex(1)
            //        )
            .navigationBarHidden(true)
    }
}
    
struct FullBankList_preview: PreviewProvider {
    static var previews: some View {
        
        let installedApps: [(id: String, name: String, logo: String)] = [
            (id: "bank100000000111", name: "Сбербанк", logo: "https://qr.nspk.ru/proxyapp/logo/bank100000000111.png"),
            (id: "bank100000000008", name: "Альфа-банк", logo: "https://qr.nspk.ru/proxyapp/logo/bank100000000008.png"),
            (id: "bank100000000015", name: "Открытие", logo: "https://qr.nspk.ru/proxyapp/logo/bank100000000015.png"),
            (id: "bank100000000004", name: "Тинькофф", logo: "https://qr.nspk.ru/proxyapp/logo/bank100000000004.png")
        ]
        
        return Group {
            FullBankList(banks: installedApps,
                         backButton: true) {
                print($0)
            } onCloseTap: {
                
            }
            .previewDisplayName("Installed apps")
            .previewLayout(.sizeThatFits)
            
            FullBankList(banks: installedApps,
                         backButton: false) {
                print($0)
            } onCloseTap: {
                
            }
            .previewDisplayName("Installed apps")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        }
    }
}
