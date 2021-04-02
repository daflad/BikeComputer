import ketai.sensors.KetaiLocation;

KetaiLocation location;
ArrayList<DataPoint> data;
Display display;
HashMap<String, String> hm;

void setup() {
  orientation(PORTRAIT);
  textAlign(CENTER, CENTER);
  data = new ArrayList<DataPoint>();
  data.add(new DataPoint(0.0, 0.0, 0.0, 0.0, 0, 0, 0.0, 0, 0));
  location = new KetaiLocation(this);
  double lastLong = location.getLocation().getLongitude();
  double lastLat = location.getLocation().getLatitude();
  data.add(new DataPoint(0.0, 0.0, 0.0, 0.0, lastLat, lastLong, 0.0, 0, 0));
  display = new Display(3, 3, 10);
  hm = loadTestData();
}

void draw() {
  background(78, 93, 75);
  display.draw(hm);
}

HashMap<String, String> loadTestData() {
  HashMap<String, String> testData = new LinkedHashMap<String, String>();
  testData.put("Speed", "10");
  testData.put("Average", "35");
  testData.put("Distance", "36");
  testData.put("Altitude", "189");
  testData.put("Climbing", "3598");
  testData.put("Heart Rate", "136");
  testData.put("RideTime", "0:01:23");
  testData.put("TimeTime", "15:43");
  testData.put("START", "PAUSE");
  return testData;
}
