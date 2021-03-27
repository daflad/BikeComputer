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
}

void draw() {
  background(78, 93, 75);
}
