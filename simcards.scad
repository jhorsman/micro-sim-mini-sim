
microsim_adapter();

module microsim_adapter() {
  difference() {
    minisim();
    // adjust hole y-location based on your extrusion width (should not matter too much, contact areas are big enough)
    // adjust microsim hole size larger based on tolerances and hole shrinkage
    translate([-3.5,-0.4,0]) microsim(15.2,12.2,h=.77);
  }
}


/*
difference(){
minisim();
translate([-3.5,-0.4,0]) microsim(h=.77);
//translate([12.5,-7.5,.38]) rotate([-90,0,90]) import_stl("Simkortadapterprtstl_fixed.stl");
}
*/


module roundcut(r=.5,h=3) {
  translate([r/2,r/2,0])
  difference() {
    cube([r+0.1,r+0.1,h],center=true);
    translate([r/2,r/2,0]) cylinder(r=r,h=h,center=true,$fn=32);
  }
}

module cornercut(r=1,h=3,w=3) {
   linear_extrude(height=3,center=true)
     polygon([[-w,0],[0,-w],[0.1,0.1]]);
}


module minisim(l=25,w=15,h=.76) {
  difference(){
    cube([l,w,h],center=true); 
    translate([-l/2,-w/2,0]) roundcut();
    translate([l/2,-w/2,0]) rotate([0,0,90]) roundcut();
    translate([l/2,w/2,0]) rotate([0,0,180]) roundcut();
    translate([-l/2,w/2,0]) rotate([0,0,-90]) roundcut();
    translate([l/2,w/2,0]) cornercut(r=.6);
  }
}

module microsim(l=15,w=12,h=.76) {
  difference(){
    cube([l,w,h],center=true); 
    translate([-l/2,-w/2,0])                            roundcut(r=.2);
    translate([l/2,-w/2,0]) rotate([0,0,90])  roundcut(r=.2);
    translate([l/2,w/2,0]) rotate([0,0,180]) roundcut(r=.2);
    translate([-l/2,w/2,0]) rotate([0,0,-90]) roundcut(r=.2);
    translate([l/2,w/2,0]) cornercut(r=.6,w=2.8);
  }
}

