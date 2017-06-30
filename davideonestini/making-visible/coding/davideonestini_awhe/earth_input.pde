void earth_input() {
  ee_lt1 = l_latitude;
  ee_ln1 = l_longitude;

  float ee_theta = radians(ee_lt1) + PI/2;
  float ee_phi = radians(-ee_ln1) + PI;

  float ee_x1 = e_r * sin(ee_theta) * cos(ee_phi);
  float ee_z1 = e_r * sin(ee_theta) * sin(ee_phi);
  float ee_y1 = e_r * cos(ee_theta);

  Vec3D ee_pos = new Vec3D (ee_x1, ee_y1, ee_z1);
  Vec3D ee_alto = new Vec3D (0, 1, 0);
  Vec3D ee_tar = ee_pos.getNormalized();
  Vec3D ee_assi = ee_alto.cross( ee_tar );
  ee_assi.normalize();

  float ee_angolo = acos(ee_alto.dot(ee_tar));

  pushMatrix();
  translate(ee_pos.x, ee_pos.y, ee_pos.z); 
  rotate(ee_angolo, ee_assi.x, ee_assi.y, ee_assi.z); 

  stroke(c_ee, 100);
  strokeWeight(3);
  noFill();
  line(0, 0, 0, 40);

  //rotate(HALF_PI, 1, 0, 0); 

  strokeWeight(8);
  point(0, 0);

  popMatrix();
}