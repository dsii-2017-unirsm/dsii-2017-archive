void earth_dots() {
  for (TableRow row : table3.rows()) {

    e_lt1 = row.getFloat("cy");
    e_ln1 = row.getFloat("cx");

    // e_lt1 = 71.0;
    // e_ln1 = 26.1;

    float e_lon1 = map(e_ln1, 0, 360, -180, 180);
    float e_lat1 = map(e_lt1, 0, 180, 90, -90);

    float e_theta = radians(e_lat1) + PI/2;
    float e_phi = radians(-e_lon1) + PI;

    float e_x1 = e_r * sin(e_theta) * cos(e_phi);
    float e_z1 = e_r * sin(e_theta) * sin(e_phi);
    float e_y1 = e_r * cos(e_theta);

    Vec3D e_pos = new Vec3D (e_x1, e_y1, e_z1);
    Vec3D e_alto = new Vec3D (0, 1, 0);
    Vec3D e_tar = e_pos.getNormalized();
    Vec3D e_assi = e_alto.cross( e_tar );
    e_assi.normalize();

    float e_angolo = acos(e_alto.dot(e_tar));

    pushMatrix();
    translate(e_pos.x, e_pos.y, e_pos.z);
    rotate(e_angolo, e_assi.x, e_assi.y, e_assi.z);
    
    stroke(c_e, 100);
    strokeWeight(3);
    noFill();
    point(0, 0);
    
    // rotate(HALF_PI, 1, 0, 0);
    // noStroke();
    // fill(c_e, 100);
    // ellipse(0, 0, 20, 20);

    popMatrix();
  }
}