import java.util.*;
import java.lang.*;
import java.io.*;

class DataPoint {
  double longitude, latitude, altitude, accuracy, lastLong, lastLat, speed, bearing;
  long time;

  DataPoint(double longitude, double latitude, double altitude, double accuracy, double lastLong, double lastLat, double speed, long time, double bearing) {
    this.longitude = longitude;
    this.latitude = latitude;
    this.altitude = altitude;
    this.accuracy = accuracy;
    this.lastLong = lastLong;
    this.lastLat = lastLat;
    this.speed = speed;
    this.time = time;
    this.bearing = bearing;
  }
  
  String toString() { 
    return String.format("Lat: %0.2f\nLon: %0.2f\nAcc: %0.2f\nTime %s", this.latitude, this.longitude, this.accuracy, this.cTime());
  }

  String cTime() {
    long second = (this.time / 1000) % 60;
    long minute = (this.time / (1000 * 60)) % 60;
    long hour = (this.time / (1000 * 60 * 60)) % 24;

    String time = String.format("%02d:%02d:%02d", hour, minute, second);
    return time;
  }
}

void onLocationEvent(Location _location) {
  println("onLocation event: " + _location.toString());
  double speed = _location.getSpeed();  //(1) 
  double bearing = _location.getBearing();  //(2)
  double longitude = _location.getLongitude();
  double latitude = _location.getLatitude();
  double altitude = _location.getAltitude();
  double accuracy = _location.getAccuracy();
  long time = _location.getTime();  
  double lastLong = longitude;
  double lastLat = latitude; 
  
  data.add(new DataPoint(longitude, latitude, altitude, accuracy, lastLong, lastLat, speed, time, bearing));
}

// Calculation of great circle distance using earth radius as 3963 miles
// https://en.wikipedia.org/wiki/Great-circle_distance
double distanceTo(double lat1, double lon1, double lat2, double lon2, String unit) {  
  double sinLat = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2));
  double cosLon = Math.cos(deg2rad(lon1)) * Math.cos(deg2rad(lon2));
  double cosLonTheta = Math.cos(deg2rad(lon1 - lon2));
  double centralAngle = Math.acos(sinLat + (cosLon * cosLonTheta));
  double earthRadius = 3963;
  // Distance in miles
  double dist = centralAngle * earthRadius;
  if (unit == "K") {
    dist = dist * 1.609344;
  } else if (unit == "N") {
    dist = dist * 0.8684;
  }
  return dist;  
}

// conver degree value to radians
double deg2rad(double deg) {
  return deg * Math.PI / 180.0;
}
