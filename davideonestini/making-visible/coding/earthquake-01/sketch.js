var mapimg;

var clat = 0;
var clon = 0;

// Shanghai 31.2304° N, 121.4737° E
// San Marino 44.6166° N, 11.4166° E
var lat = 44.6166;
var lon = 11.4166;

var zoom = 1;
var earthquakes;

function preload() {
  mapimg = loadImage('https://api.mapbox.com/styles/v1/mapbox/light-v9/static/0,0,1,0,0/1024x1024?access_token=pk.eyJ1IjoiZGF2aWRlb25lc3RpbmkiLCJhIjoiY2oyODNoYXl2MDA0ZDJxc2FuazgxYWIxNSJ9.7loO4alT4U_2wniZ-xflNA');
  earthquakes = loadStrings('https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv');
}

function mercX(lon) {
  lon = radians(lon);
  var a = (256 / PI) * pow(2, zoom);
  var b = lon + PI;
  return a * b;
}

function mercY(lat) {
  lat = radians(lat);
  var a = (256 / PI) * pow(2, zoom);
  var b = tan(PI / 4 + lat / 2);
  var c = PI - log(b);
  return a * c ;
}

function setup() {
  createCanvas(1024, 1024);
  translate(width/2,height/2);
  imageMode(CENTER);
  image(mapimg,0,0);

  var cx = mercX(clon);
  var cy = mercY(clat);

  for (var i = 0; i < earthquakes.length; i++) {
    var data = earthquakes[i].split(/,/);

    //console.log(data);

    var lat = data[1];
    var lon = data[2];
    //var mag = data[4];

    // mag = pow(10, mag);
    //mag = sqrt(mag);
    //var magmax = sqrt(pow(10,10));

    //var d = map(mag, 0, magmax, 0, 100); // diametro

    var x = mercX(lon) - cx;
    var y = mercY(lat) - cy;

    fill(0,0,0,200);
    noStroke();
    ellipse(x,y,5,5);
    //ellipse(x,y,d,d);
  }

}
