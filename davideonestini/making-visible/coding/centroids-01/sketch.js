var mapimg;

var clat = 0;
var clon = 0;

var zoom = 1;

var centroids;

function preload() {
  mapimg = loadImage('https://api.mapbox.com/styles/v1/mapbox/dark-v9/static/0,0,1,0,0/1024x1024?access_token=pk.eyJ1IjoiZGF2aWRlb25lc3RpbmkiLCJhIjoiY2oyODNoYXl2MDA0ZDJxc2FuazgxYWIxNSJ9.7loO4alT4U_2wniZ-xflNA');
  centroids = loadStrings('https://docs.google.com/spreadsheets/d/1hsnSWgK8jHz0BzqtMcSEsTRxp33EVtvDSPcBvoAzpJU/pub?output=csv');
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
  noStroke();
  imageMode(CENTER);
  image(mapimg,0,0);

  var cx = mercX(clon);
  var cy = mercY(clat);

  for (var i = 0; i < centroids.length; i++) {
    var data = centroids[i].split(/,/);

    //console.log(data);

    if (data[3] == "1981") {

      var lat = data[1];
      var lon = data[2];

      var x = mercX(lon) - cx;
      var y = mercY(lat) - cy;

      ellipse(x,y,10,10);

      if (data[4] == "2") {
        fill(0,255,0,100);
      } else if (data[4] == "1") {
        fill(255,255,0,100);
      } else if (data[4] == "0") {
        fill(255,0,0,100);
      } else {
        fill(0,0,0,100);
      }
    }
  }
}
