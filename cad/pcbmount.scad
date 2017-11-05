

union(){
translate([0,0,-1])
    top(3,3);
translate([0,25,0])
    rotate([90,0,0])
    bottom2(3,2,2,49);
}



screwSize=4;
railWidth=75;
railSize=5;
screwSpace=2;
mountHeight=3;
railBlockLength=railSize+2*screwSpace;
screwAreaLength=screwSize+2*screwSpace;
topLength=2*railBlockLength+screwAreaLength;
mountItemSize=screwAreaLength;


module top(d,l){
    difference(){
        cube([topLength,screwAreaLength,screwAreaLength]);
        union(){
            translate([railBlockLength+screwAreaLength/2,screwAreaLength/2,0])
                cylinder(d=screwSize,h=mountHeight*2);
            
            translate([railBlockLength,0,3])
                cube([screwAreaLength,screwAreaLength,screwAreaLength]);
            
            translate([0,0,5])
                cube([railBlockLength,screwAreaLength,screwAreaLength-1]);
            
            translate([railBlockLength+screwAreaLength,0,5])
                cube([railBlockLength,screwAreaLength,screwAreaLength-1]);
            
            translate([railSize/2+screwSpace,screwAreaLength,-0.5])
                rotate([90,0,0])
                cylinder(d=railSize+1,h=10);
            
            translate([topLength-railSize/2-screwSpace,screwAreaLength,-0.5])
                rotate([90,0,0])
                cylinder(d=railSize+1,h=10);
            
            cube([topLength,screwAreaLength,0.5]);
        }
    }
}

module bottom2(d,l,r,pl){
    
    bl=pl+d+2*l;
    mh=railSize/2+screwSpace;
    
    echo(bl);
    difference(){
        difference(){
            cube([bl,mh+5,screwAreaLength]);
            
            union(){
                           
                
                translate([d+l+r,mh,0])
                    cube([bl-2*(d+l+r),topLength,topLength]);
                
                
                *translate([topLength,mountHeight,0])
                    cube([bl-l-d-r-topLength,topLength,topLength]);
                
                translate([bl/2-screwAreaLength/2-railBlockLength/2,-0.5,0])
                    cylinder(d=railSize+1,h=20);
                
                translate([bl/2+screwAreaLength/2+railBlockLength/2,-0.5,0])
                    cylinder(d=railSize+1,h=20);
                
                *translate([0,mh,screwAreaLength-2])
                    cube([l+d+r,d+l+r+mountHeight,screwAreaLength]);
                
                *translate([bl-l-d-r,mh,screwAreaLength-2])
                    cube([topLength,mountHeight+d+l+r,2]);
                
                *translate([bl-l-d/2,mh+l+d/2,0])
                    rotate([0,0,0])
                        cylinder(d=d,h=40);
                        
                *translate([l+d/2,mh+l+d/2,0])
                    rotate([90,0,0])
                        cylinder(d=d,h=40);
                
                translate([bl/2,mh+1,screwAreaLength/2])
                    rotate([90,0,0])
                        cylinder(d=screwSize,h=mh+1);
                        
                translate([bl/2,mh+.01,screwAreaLength/2])
                    rotate([90,0,0])
                        cylinder(d=3+screwSize,h=mountHeight-1,$fn=6);  
                  
                *translate([r+d/2,mh+2.5,r+d/2])
                    difference(){
                        cube([screwAreaLength,mh+1,screwAreaLength+1],center=true);
                        translate([0,0,0])
                            rotate([90,0,0])
                                //cylinder(d=d+r,h=5,center=true);
                                cube([d+r,d+r,5],center=true);
                    }
                    
                *translate([bl-r-d/2,mh+2.5,r+d/2])
                    difference(){
                        cube([screwAreaLength,mh+1,screwAreaLength+1],center=true);
                        translate([0,0,0])
                            rotate([90,0,0])
                                //cylinder(d=d+r,h=5,center=true);
                                cube([d+r,d+r,5],center=true);
                    }
                
                
            }
        }
        union(){
           translate([l+d/2,4,l+d/2])
            rotate([90,0,0])
            cylinder(d=d,h=7+mh,center=true);
            
            translate([bl-l-d/2,4,l+d/2])
            rotate([90,0,0])
            cylinder(d=d,h=7+mh,center=true);
            
        }
    }
}


