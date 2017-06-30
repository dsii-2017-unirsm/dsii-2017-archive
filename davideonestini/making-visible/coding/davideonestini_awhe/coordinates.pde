void coordinates() {
  for (float i = -90; i < 90; i = i+2) {
    for (float j = -180; j < 180; j = j+4) {

      float e_theta = radians(i) + PI/2;
      float e_phi = radians(-j) + PI;

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
      //rotate(HALF_PI, 1, 0, 0);

      stroke(c_c, 100);
      strokeWeight(1);
      noFill();
      point(0, 0);
      popMatrix();
    }
  }
}