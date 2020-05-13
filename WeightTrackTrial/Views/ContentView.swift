import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    @State private var GoalisPresented: Bool = false
    @State private var targetWeight: String = "TBD"
    @ObservedObject var entryListVM = EntryListViewModel()
    @State private var goalListVM = GoalListViewModel()
    
    private func delete(at offsets: IndexSet) {
        offsets.forEach{ index in
            let entryVM = self.entryListVM.entries[index]
            self.entryListVM.deleteEntry(entryVM: entryVM)
        }
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Goal Weight: \(goalListVM.fetchAnswer().targetWeight)")
                
                .sheet(isPresented: $GoalisPresented, onDismiss: {
                    self.goalListVM.fetchGoal()
                }, content: {
                    AddGoalView()
                })
            }.padding()
            
            NavigationView {
                        
                List {
                    ForEach(self.entryListVM.entries , id: \.weight) { entry in
                        HStack {
                            Text(entry.weight)
                            Image(uiImage: (UIImage(data: (entry.frontImg ?? UIImage(systemName: "person")?.pngData())!)!))
                                .resizable()
                                .frame(width: 100, height: 100)
                            Spacer()
                            Text((entry.date).toString(dateFormat: "dd-MMM-yyyy"))
                        }
                    }
                    .onDelete(perform: delete)
                }
                    
                .sheet(isPresented: $isPresented, onDismiss: {
                    print("The sheet is fired")
                    self.entryListVM.fetchAllEntries()
                }, content: {
                    AddEntryView(isPresented: self.$isPresented)
                })
            
                    
                /*.sheet(isPresented: $GoalisPresented, onDismiss: {
                    self.goalListVM.fetchGoal()
                }, content: {
                    AddGoalView()
                })*/
    
                .navigationBarItems(leading: EntryButtonView(isPresented: $isPresented), trailing: GoalButtonView(GoalisPresented: $GoalisPresented))
                .navigationBarTitle("Progress")
            }
        }
    }
}


struct EntryButtonView: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        Button("Add New Entry") {
            self.isPresented = true
            print("i reach here and the value of isPresented is \(self.isPresented)")
        }
    }
}

struct GoalButtonView: View {
    
    @Binding var GoalisPresented: Bool
    
    var body: some View {
        Button("Add New Goal") {
            self.GoalisPresented = true
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


