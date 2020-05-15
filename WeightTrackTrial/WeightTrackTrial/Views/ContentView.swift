import SwiftUI

struct ContentView: View {
    
    @State private var TransformationIsPresented: Bool = false
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
                Text("Goal Weight: \(goalListVM.fetchAnswer())")
                
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
                            NavigationLink(destination: ProgressPicView(entry: entry)) {
                                Text(entry.weight)
                                Spacer()
                                Text((entry.date).toString(dateFormat: "dd-MMM-yyyy"))
                            }
                        }
                    }
                    .onDelete(perform: delete)
                }
                    
                .sheet(isPresented: $isPresented, onDismiss: {
                    self.entryListVM.fetchAllEntries()
                }, content: {
                    AddEntryView(isPresented: self.$isPresented)
                })
            
                .navigationBarItems(leading: EntryButtonView(isPresented: $isPresented), trailing: GoalButtonView(GoalisPresented: $GoalisPresented))
                .navigationBarTitle("Progress")
            }
            
            VStack {
                Button("Compare Transformation") {
                    self.TransformationIsPresented.toggle()
                }
                .sheet(isPresented: $TransformationIsPresented, onDismiss: {
                   
                }, content: {
                    TransformationView(entryListVM: self.entryListVM)
                })
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


