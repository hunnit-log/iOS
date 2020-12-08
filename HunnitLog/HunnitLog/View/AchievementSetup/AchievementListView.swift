//
//  AchievementListView.swift
//  HunnitLog
//
//  Created by seungwook.jung on 2020/12/01.
//

import SwiftUI

struct AchievementListView: View {
    private enum Constants {
        static let contentWidth: CGFloat = 309
        static let cornerRadius: CGFloat = 9
        static let borderWidth: CGFloat = 0.5
        
        static let titleString: String = "어떤 목표를\n이루어볼까요? 🧐"
        static let titleFont: Font = .system(size: 27, weight: .semibold)
        static let titleLetterSpacing: CGFloat = -0.81
        
        static let descriptionString: String = "도전적인 목표를 세워보세요.\n자세히 세울 수 있는 목표는 더욱 좋아요!"
        static let descriptionFont: Font = .system(size: 14, weight: .regular)
        static let descriptionLetterSpacing: CGFloat = -0.42
        
    }
    
    let geometry: GeometryProxy
    @State var isLinkActive: Bool = false
    @State var achievementItems: [AchievementItemViewModel] = [
        AchievementItemViewModel(editable: false, title:  "안녕안녕"),
    ]
    @State var newItem: AchievementItemViewModel = AchievementItemViewModel(editable: true, title: "")
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    Text(Constants.titleString)
                        .font(Constants.titleFont)
                        .kerning(Constants.titleLetterSpacing)
                        .foregroundColor(CustomColor.black)
                        .frame(width: Constants.contentWidth, alignment: .leading)
                        .padding(.bottom, 28)
                    
                    Text(Constants.descriptionString)
                        .font(Constants.descriptionFont)
                        .kerning(Constants.descriptionLetterSpacing)
                        .foregroundColor(CustomColor.coolGray)
                        .frame(width: Constants.contentWidth, alignment: .leading)
                        .padding(.bottom, 80)
                    
                    ForEach(self.achievementItems) { item in
                        AchievementItemView(item: item,
                                            action: {
                                                // 테스트를 위해 추가
                                                self.achievementItems.removeAll(where: {
                                                    $0.id == item.id
                                                })
                                            })
                    }
                    
                    AchievementItemView(item: self.newItem,
                                        action: {
                                            
                                        })
                    
                    Button(action: {
                        self.newItem.editable = false
                        self.achievementItems.append(self.newItem)
                        self.newItem = AchievementItemViewModel(editable: true, title: "")
                        
                    }) {
                        Text("+")
                            .font(Constants.titleFont)
                            .foregroundColor(CustomColor.black)
                    }
                    .frame(width: Constants.contentWidth, height: 67)
                    .background(CustomColor.lightGray)
                    .cornerRadius(Constants.cornerRadius)
                    .padding(.bottom, 100)
                    
                    Text("이런 목표들은 어때요?")
                        .padding(.bottom, 20)
                }
            }
            BottomNextButton(geometry: self.geometry,
                             type: .next) {
                self.isLinkActive = true
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(
            NavigationLink(
                destination: AchievementQuestionView(geometry: geometry),
                isActive: $isLinkActive,
                label: {
                    EmptyView()
                })
                .edgesIgnoringSafeArea(.bottom)
                .navigationBarTitle("", displayMode: .inline)
                .hidden())
    }
}

struct AchievementListView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader(content: { geometry in
            AchievementListView(geometry: geometry)
        })
    }
}
