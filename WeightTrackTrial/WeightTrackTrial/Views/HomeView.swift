import SwiftUI

struct HomeView: View {
    
    @State private var TransformationIsPresented: Bool = false
    @State private var isPresented: Bool = false
    @State private var GoalisPresented: Bool = false
    @State private var linkIsPresented: Bool = false
    @State private var targetWeight: String = "TBD"
    @ObservedObject var entryListVM = EntryListViewModel()
    @State private var goalListVM = GoalListViewModel()
    
    private func delete(at offsets: IndexSet) {
        offsets.forEach{ index in
            let entryVM = self.entryListVM.entries[index]
            self.entryListVM.deleteEntry(entryVM: entryVM)
        }
    }
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = UIColor(red: 22.0/255.0, green: 22.0/255.0, blue: 22.0/255.0, alpha: 1.0)
        UITableView.appearance().backgroundColor = UIColor(red: 22.0/255.0, green: 22.0/255.0, blue: 22.0/255.0, alpha: 1.0)
        
    }
    
    
    var body: some View {
        
        
        ZStack {
            ColorManager.BackgroundColor
                .edgesIgnoringSafeArea(.all)
            
            GeometryReader { g in
                
                VStack {
                    
                    Spacer()
                        .frame(height: g.size.height*0.02)
                    
                    //Goal Section
                    GeometryReader { g2 in
                        ZStack(alignment: .top) {
                            Circle()
                                .foregroundColor(ColorManager.CustomBlue)
                            
                            VStack {
                                Spacer()
                                    .frame(height: g2.size.height*0.1656804734)
                                
                                Text("Goal")
                                    .font(.system(size: 30.0, weight: .regular, design: .rounded))
                                    .foregroundColor(ColorManager.CustomWhite)
                                
                                Spacer()
                                    .frame(height: g2.size.height*0.01183431953)
                                
                                Text(self.goalListVM.fetchAnswer())
                                    .font(.system(size: 40.0, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                                
                                Spacer()
                                    .frame(height: g2.size.height*0.1538461538)
                                
                                
                                GoalButtonView(GoalisPresented: self.$GoalisPresented)
                                
                                Spacer()
                                    .frame(height: g2.size.height*0.05)
                                
                            }
                            .sheet(isPresented: self.$GoalisPresented, onDismiss: {
                                self.goalListVM.fetchGoal()
                            }, content: {
                                AddGoalView()
                            })
                        }
                        .frame(height: g.size.height*0.12)
                    }
                    
                    
                    //Weight Section
                    HStack {
                        Spacer()
                        
                        VStack {
                            Text("Start Weight")
                                .font(.system(size: 17.0, weight: .regular, design: .rounded))
                                .foregroundColor(ColorManager.WriteGray)
                                .padding(.bottom, 6)
                            Text(self.entryListVM.fetchFirstEntry())
                                .font(.system(size: 30.0, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        VStack {
                            Text("Current Weight")
                                .font(.system(size: 17.0, weight: .regular, design: .rounded))
                                .padding(.bottom, 6)
                                .foregroundColor(ColorManager.WriteGray)
                            Text(self.entryListVM.fetchLastEntry())
                                .font(.system(size: 30.0, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                    }
                    .frame(height: g.size.height*0.13)
                    
                    
                    //Progress Section
                    VStack(alignment: .leading) {
                        Text("Progress")
                            .font(.system(size: 30.0, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.horizontal, g.size.width*0.05)
                            .offset(x: 10, y: 10)
                        
                        
                        ZStack(alignment: .bottom) {
                            VStack(spacing: g.size.height*0.025) {
                                
                                List {
                                    ForEach(self.entryListVM.entries , id: \.weight) { entry in
                                        ProgressCellView(entry: entry, linkIsPresented: self.$linkIsPresented)
                                            .frame(width: g.size.width*0.74, height: g.size.height*0.01)
                                            .padding(30)
                                            .background(ColorManager.ProgressBackground)
                                            .cornerRadius(12)
                                        
                                    }
                                    .onDelete(perform: self.delete)
                                }
                                    
                                    
                                    
                                    
                                    
                                .sheet(isPresented: self.$isPresented, onDismiss: {
                                    self.entryListVM.fetchAllEntries()
                                }, content: {
                                    AddEntryView(isPresented: self.$isPresented)
                                })
                                
                                //                                    .navigationBarItems(leading: EntryButtonView(isPresented: self.$isPresented), trailing: GoalButtonView(GoalisPresented: self.$GoalisPresented))
                                
                            }
                            
                            EntryButtonView(isPresented: self.$isPresented, g: g.size.height)
                                .offset(y: g.size.height*0.0335)
                            
                        }
                    }
                        
                    .frame(height: g.size.height*0.5)
                    
                    Spacer()
                        .frame(height: g.size.height*0.06)
                }
                
            }
            //.frame(height:320)
            //.offset(y: 50)
        }
        
    }
    
    /*   .sheet(isPresented: $isPresented, onDismiss: {
     self.entryListVM.fetchAllEntries()
     }, content: {
     AddEntryView(isPresented: self.$isPresented)
     })
     
     .navigationBarItems(leading: EntryButtonView(isPresented: $isPresented), trailing: GoalButtonView(GoalisPresented: $GoalisPresented))
     .navigationBarTitle("Progress")
     }
     
     }*/
    
}



struct EntryButtonView: View {
    
    @Binding var isPresented: Bool
    var g: CGFloat
    
    var body: some View {
        
        Button(action: {
            self.isPresented = true
        }) {
            ZStack(alignment: .center) {
                Circle()
                    .frame(width: g*0.07829977629, height: g*0.07829977629)
                    .foregroundColor(ColorManager.CustomBlue)
                Text("+")
                    .font(.system(size: 48.0, weight: .light, design: .rounded))
                    .offset(y: -2)
            }
        }
    }
}

struct GoalButtonView: View {
    
    @Binding var GoalisPresented: Bool
    
    var body: some View {
        Button(action: {
            self.GoalisPresented = true
        }) {
            Text("Edit")
                .font(.system(size: 15.0, weight: .regular, design: .rounded))
                .foregroundColor(.white)
                .underline()
        }
    }
}


extension Date {
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
    
}





