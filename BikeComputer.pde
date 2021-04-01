import ketai.sensors.KetaiLocation; 
KetaiLocation location;
ArrayList<DataPoint> data;

void setup() {
  orientation(PORTRAIT);
  textAlign(CENTER, CENTER);
  textSize(72);
  data = new ArrayList<DataPoint>();
  data.add(new DataPoint(0.0, 0.0, 0.0, 0.0, 0, 0, 0.0, 0, 0));
  location = new KetaiLocation(this);
  double lastLong = location.getLocation().getLongitude();
  double lastLat = location.getLocation().getLatitude();
  data.add(new DataPoint(0.0, 0.0, 0.0, 0.0, lastLat, lastLong, 0.0, 0, 0));
  println(width, height);  
}

void draw() {
  background(78, 93, 75);
  drawPrettyShit();
}

void drawPrettyShit() {
  float numberOfCols = 3;
  float numberOfRows = 3;
  float padding = 10;
  float widthOfCell = width / numberOfCols;
  float heightOfCell = height / numberOfRows;
  Map<String, String> hm = new LinkedHashMap<String, String>();
  // Putting key-value pairs in the HashMap
  hm.put("Speed", "10");
  hm.put("Average", "35");
  hm.put("Distance", "36");
  //
  hm.put("Altitude", "189");
  hm.put("Climbing", "3598");
  hm.put("Heart Rate", "136");
  //
  hm.put("RideTime", "0:01:23");
  hm.put("TimeTime", "15:43");
  hm.put("START", "PAUSE");
  float x = 0;
  float y = 0;
  int count = 0;
  int row = 1;
  // Using an enhanced loop to iterate over each entry
  for (Map.Entry<String, String> me : hm.entrySet()) {
    fill(255,255,255,51);
    rect(x+padding, y+padding, widthOfCell - padding*3, heightOfCell - padding*3);
    fill(0,0,0,255);
    textSize(25);
    text(me.getKey(), x+(widthOfCell/2), y + (heightOfCell/3) - (padding*4));
    if (row != 3) {
      textSize(52);
    }
    text(me.getValue(), x+(widthOfCell/2), y + (heightOfCell/3*2) - padding);
    x += widthOfCell;
    count++;    
    if (count == 3) {
      count = 0;
      x = 0;
      y += heightOfCell;
      row++;
    }
  }
}
