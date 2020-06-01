/*
 
 else {
    Image(uiImage: (UIImage(data: (self.entry.backImg ?? UIImage(systemName: "person")?.pngData())!)!))
        .resizable()
        .aspectRatio(contentMode: .fit)
        .padding(12)
    .animation(.default).offset(x: self.draggedSize.width, y: 0).scaleEffect(self.scale3).scaleEffect(self.isTapped3 ? 2 : 1, anchor: UnitPoint(x: self.pointTapped3.x / reader.frame(in: .global).maxX, y: self.pointTapped3.y / reader.frame(in: .global).maxY)).gesture(TapGesture(count: 2).onEnded({
                self.isTapped3 = !self.isTapped3
            }).simultaneously(with: DragGesture(minimumDistance: 0, coordinateSpace: .global).onChanged({ (value) in
                self.pointTapped3 = value.startLocation
                self.draggedSize3 = CGSize(width: value.translation.width + self.previousDragged3.width, height: value.translation.height + self.previousDragged3.height)
    //            print(value.startLocation)
            }).onEnded({ (value) in
    //            print(value.location)
                let offsetWidth = (reader.frame(in: .global).maxX * self.scale3 - reader.frame(in: .global).maxX) / 2
                let newDraggedWidth = self.draggedSize.width * self.scale3
                if (newDraggedWidth > offsetWidth) {
                    self.draggedSize = CGSize(width: offsetWidth / self.scale3, height: value.translation.height + self.previousDragged3.height)
                } else if (newDraggedWidth < -offsetWidth) {
                    self.draggedSize = CGSize(width: -offsetWidth / self.scale3, height: value.translation.height + self.previousDragged3.height)
                } else {
                    self.draggedSize = CGSize(width: value.translation.width + self.previousDragged3.width, height: value.translation.height + self.previousDragged3.height)
                }
                self.previousDragged3 = self.draggedSize
                }))).gesture(MagnificationGesture().onChanged({ (scale3) in
                self.scale3 = scale3.magnitude
            }).onEnded({ (scale3Final) in
                self.scale3 = scale3Final.magnitude
            }))
}

*/
