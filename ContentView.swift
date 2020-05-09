

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
                Text("Goal: ")
                Text(goalListVM.targetWeight)
            }
            
            NavigationView {
                        
                List {
                    ForEach(self.entryListVM.entries , id: \.weight) { entry in
                        HStack {
                            Text(entry.weight)
                            Spacer()
                            Text((entry.date).toString(dateFormat: "dd-MMM-yyyy"))
                        }
                    }
                    .onDelete(perform: delete)
                }
                .sheet(isPresented: $isPresented, onDismiss: {
                    self.entryListVM.fetchAllEntries()
                }, content: {
                    AddEntryView(isPresented: self.$isPresented)
                })
                /*.navigationBarItems(trailing: Button("Add New Entry") {
                    self.isPresented = true
                })*/
                    
                    .sheet(isPresented: $GoalisPresented, onDismiss: {
                        self.goalListVM.fetchTargetWeight()
                    }, content: {
                    AddGoalView(GoalisPresented: self.$GoalisPresented)
                })
                /*.navigationBarItems(leading: Button("Add New Goal") {
                    self.GoalisPresented = true
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
