class Display {
  float NumberOfCols, NumberOfRows, Padding, WidthOfCell, HeightOfCell;

  Display(float numberOfCols, float numberOfRows, float padding) {
    this.NumberOfCols = numberOfCols;
    this.NumberOfRows = numberOfRows;
    this.Padding = padding;
    this.WidthOfCell = width / numberOfCols;
    this.HeightOfCell = height / numberOfRows;
  }
  
  void draw(Map<String, String> hm) {
    float x = 0;
    float y = 0;
    int count = 0;
    int row = 1;
    // Using an enhanced loop to iterate over each entry
    for (Map.Entry<String, String> me : hm.entrySet()) {
      fill(255, 255, 255, 51);
      rect(x+this.Padding, y+this.Padding, this.WidthOfCell - this.Padding*3, this.HeightOfCell - this.Padding*3);
      fill(0, 0, 0, 255);
      textSize(25);
      text(me.getKey(), x+(this.WidthOfCell/2), y + (this.HeightOfCell/3) - (this.Padding*4));
      if (row != int(this.NumberOfRows)) {
        textSize(52);
      }
      text(me.getValue(), x+(this.WidthOfCell/2), y + (this.HeightOfCell/3*2) - this.Padding);
      x += this.WidthOfCell;
      count++;
      if (count == this.NumberOfCols) {
        count = 0;
        x = 0;
        y += this.HeightOfCell;
        row++;
      }
    }
  }
}
