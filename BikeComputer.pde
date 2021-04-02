import ketai.sensors.KetaiLocation; 
KetaiLocation location;
ArrayList<DataPoint> data;
Display display;
LinkedHashMap<String, String> hm;

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
  display = new Display(3, 3, 10); 
  LinkedHashMap<String, String> hm = new LinkedHashMap<String, String>();
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
}

void draw() {
  background(78, 93, 75);
  display.draw(hm);
}
