include <settings.scad>;

batteryMount();

camWidth=25;
camHeight=25;
hingeWidth=35;
hingeDepth=10;
hingeHeight=15;
hingeBase=5;

module batteryMount(){
    difference(){
        cylinder(d=baseWidth,h=baseHeight, center=true);
//        
        union(){
            translate([-1*(baseRadius-wheelCutDepth+wheelCutDepth/2),0,0])
                cube([wheelCutDepth+1, wheelCutSize, baseHeight],center=true);
            translate([(baseRadius-wheelCutDepth+wheelCutDepth/2),0,0])
                cube([wheelCutDepth+1, wheelCutSize, baseHeight],center=true);
            
            translate([railWidth/2-railDiameter/2,railPos,0])
                cylinder(d=railDiameter+1,h=100, center=true);
            translate([-1*(railWidth/2-railDiameter/2),railPos,0])
                cylinder(d=railDiameter+1,h=100, center=true);
            
            translate([railWidth/2-railDiameter/2,-railPos,0])
                cylinder(d=railDiameter+1,h=100, center=true);
            translate([-(railWidth/2-railDiameter/2),-railPos,0])
                cylinder(d=railDiameter+1,h=100, center=true);
            
            for (i = [-20, -10, 0, 10, 20]){
                translate([15,i,0])
                    cylinder(d=3.5,h=100, center=true);
                translate([5,i,0])
                    cylinder(d=3.5,h=100, center=true);
                translate([-5,i,0])
                    cylinder(d=3.5,h=100, center=true);
                translate([-15,i,0])
                    cylinder(d=3.5,h=100, center=true);
            
            }
            
            
            for (i = [-15, -5, 5, 15]){
                translate([20,i,0])
                    cylinder(d=3.5,h=100, center=true);
                translate([10,i,0])
                    cylinder(d=3.5,h=100, center=true);
                translate([0,i,0])
                    cylinder(d=3.5,h=100, center=true);
                translate([-10,i,0])
                    cylinder(d=3.5,h=100, center=true);
                translate([-20,i,0])
                    cylinder(d=3.5,h=100, center=true);
            
            }
        }
    }
}


module sonarMount(){
    *difference(){
        cube([20,20,5], center=true);
        union(){
            translate([-5,-5,0])
                cylinder(d=5.5, h=5, center=true);
            
            translate([-5,5,0])
                cylinder(d=3.5, h=5, center=true);
            
            translate([5,-5,0])
                cylinder(d=3.5, h=5, center=true);
            
            translate([0,0,-2.5])
                cube([10,10,5]);
        }
    }
    
    translate([18,0,0])
        difference(){
            cube([12,20,5], center=true);
            union(){
                translate([-1.5,-5,-10])
                    cylinder(d=5.5, h=20);
                
                rotate([0,90,0])
                    translate([-0,3,-15])
                        cylinder(d=2.5, h=30);
                
                translate([3,-10,-3])
                    cube([3,10,10]);
            }
        
        }
        
     translate([34,0,0])
        difference(){
            cube([16,10,5], center=true);
            union(){
                translate([-3,0,-10])
                    cylinder(d=5.5, h=20);
                
                
            }
        
        }
        
}

module camServoMount(){
    difference(){
        cube([6,14,14], center=true);
        union(){
            translate([0,-2,0])
                cylinder(d=3.5, h=20, center=true);
            
            translate([1,0,3])
                rotate([90,0,0])
                    cylinder(d=2.5, h=20, center=true);
            
        }
    }
    translate([10,0,0])
    difference(){
        cube([6,14,14], center=true);
        union(){
            translate([0,-2,0])
                cylinder(d=3.5, h=20, center=true);
            
            translate([-1,0,3])
                rotate([90,0,0])
                    cylinder(d=2.5, h=20, center=true);
            
        }
    }

}

module camHinge(){
    
    translate([0,0,-8])
    rotate([180,0,0])
    difference(){
        cube([hingeWidth,hingeDepth,hingeHeight],center=true);
        union(){
            translate([0,0,hingeBase])
                cube([camWidth+2,hingeDepth,hingeHeight],center=true);
            
            translate([-5,0,0])
                cylinder(d=3.5, h=100,center=true);
            
            translate([5,0,0])
                cylinder(d=3.5, h=100,center=true);
            
            translate([0,0,(hingeHeight-hingeBase)/3])
                rotate([0,90,0])
                    cylinder(d=4, h=100,center=true);
        }
    }
    
    *rotate([0,90,0])
        translate([0,10,0])
            difference(){
                cube([5,hingeDepth,camHeight+3]);
                union(){
                    translate([0,-5,7])
                        cube([camWidth+4,hingeDepth,camHeight]);
                    
                    translate([0,hingeDepth/2,(hingeHeight-hingeBase)/3])
                        rotate([0,90,0])
                            cylinder(d=3.5, h=100,center=true);
                    
                    translate([2.5,0,7+2])
                        rotate([90,0,0])
                            cylinder(d=2, h=100,center=true);
                    
                    translate([2.5,0,7+2+13])
                        rotate([90,0,0])
                            cylinder(d=2.5, h=100,center=true);
                    
                    translate([2.5,7.5,7+2+13+3])
                        rotate([0,90,0])
                            cylinder(d=2.5, h=100,center=true);
                }
            }
    
        
    *rotate([0,90,0])
        translate([0,25,0])
            difference(){
                cube([5,hingeDepth,camHeight+3]);
                union(){
                    translate([0,-5,7])
                        cube([camWidth+4,hingeDepth,camHeight]);
                    
                    translate([0,hingeDepth/2,(hingeHeight-hingeBase)/3])
                        rotate([0,90,0])
                            cylinder(d=3.5, h=100,center=true);
                    
                    translate([2.5,0,7+2])
                        rotate([90,0,0])
                            cylinder(d=2.5, h=100,center=true);
                    
                    translate([2.5,0,7+2+13])
                        rotate([90,0,0])
                            cylinder(d=2.5, h=100,center=true);
                }
            }
    
}

module camTop(){
    difference(){
        union(){
            cylinder(d=baseWidth,h=baseHeight, center=true);
            translate([0,0,2])
                cylinder(d=18,h=baseHeight, center=true);
        }
        union(){
            
            translate([0,37,0])
                cube([25, 10, baseHeight],center=true);
            
            
            cylinder(d=8,h=100, center=true);
            
            translate([13/2,1.5,0])
                cylinder(d=1.5,h=100, center=true);
            translate([13/2,-1.5,0])
                cylinder(d=1.5,h=100, center=true);
            
            translate([-13/2,1.5,0])
                cylinder(d=1.5,h=100, center=true);
            translate([-13/2,-1.5,0])
                cylinder(d=1.5,h=100, center=true);
            
            
            translate([15,10,0])
                cylinder(d=3.5,h=100, center=true);
            translate([5,10,0])
                cylinder(d=3.5,h=100, center=true);
            translate([-5,10,0])
                cylinder(d=3.5,h=100, center=true);
            translate([-15,10,0])
                cylinder(d=3.5,h=100, center=true);
                
            translate([15,15,0])
                cylinder(d=3.5,h=100, center=true);
            translate([5,15,0])
                cylinder(d=3.5,h=100, center=true);
            translate([-5,15,0])
                cylinder(d=3.5,h=100, center=true);
            translate([-15,15,0])
                cylinder(d=3.5,h=100, center=true);
            
            translate([15,20,0])
                cylinder(d=3.5,h=100, center=true);
            translate([5,20,0])
                cylinder(d=3.5,h=100, center=true);
            translate([-5,20,0])
                cylinder(d=3.5,h=100, center=true);
            translate([-15,20,0])
                cylinder(d=3.5,h=100, center=true);
                
            translate([15,-10,0])
                cylinder(d=3.5,h=100, center=true);
            translate([5,-10,0])
                cylinder(d=3.5,h=100, center=true);
            translate([-5,-10,0])
                cylinder(d=3.5,h=100, center=true);
            translate([-15,-10,0])
                cylinder(d=3.5,h=100, center=true);
                
            translate([15,-20,0])
                cylinder(d=3.5,h=100, center=true);
            translate([5,-20,0])
                cylinder(d=3.5,h=100, center=true);
            translate([-5,-20,0])
                cylinder(d=3.5,h=100, center=true);
            translate([-15,-20,0])
                cylinder(d=3.5,h=100, center=true);
            
            
            translate([15,-0,0])
                cylinder(d=3.5,h=100, center=true);
            translate([25,-0,0])
                cylinder(d=3.5,h=100, center=true);
            
            
            translate([-15,-0,0])
                cylinder(d=3.5,h=100, center=true);
            translate([-25,-0,0])
                cylinder(d=3.5,h=100, center=true);
            
        }
        
    }
    
}

module top(){
    difference (){
        
        cylinder(d=baseWidth,h=baseHeight, center=true);
        
        union(){
            translate([baseRadius-wheelCutDepth+wheelCutDepth/2,0,0])
                cube([wheelCutDepth, wheelCutSize, baseHeight],center=true);
            translate([-1*(baseRadius-wheelCutDepth+wheelCutDepth/2),0,0])
                cube([wheelCutDepth, wheelCutSize, baseHeight],center=true);
            
            translate([railWidth/2-railDiameter/2,railPos,0])
                cylinder(d=railDiameter+1,h=100, center=true);
            translate([-1*(railWidth/2-railDiameter/2),railPos,0])
                cylinder(d=railDiameter+1,h=100, center=true);
            
            translate([railWidth/2-railDiameter/2,-railPos,0])
                cylinder(d=railDiameter+1,h=100, center=true);
            translate([-(railWidth/2-railDiameter/2),-railPos,0])
                cylinder(d=railDiameter+1,h=100, center=true);
            
            translate([-servoOffset,0,0])
                cube([servoWidth, servoDepth,100], center=true);
            
            translate([servoOffset+2,0,0])
                cylinder(d=2,h=100, center=true);
            
            translate([servoOffset+6-32,0,0])
                cylinder(d=2,h=100, center=true);
            
        }
    }
}

module base(){
    difference (){
        
        cylinder(d=baseWidth,h=baseHeight, center=true);
        
        union(){
            translate([baseRadius-wheelCutDepth+wheelCutDepth/2-1,0,0])
                cube([wheelCutDepth+1, wheelCutSize, baseHeight],center=true);
            translate([-1*(baseRadius-wheelCutDepth+wheelCutDepth/2-1),0,0])
                cube([wheelCutDepth+1, wheelCutSize, baseHeight],center=true);
            
            translate([railWidth/2-railDiameter/2,railPos,0])
                cylinder(d=railDiameter,h=100, center=true);
            translate([-1*(railWidth/2-railDiameter/2),railPos,0])
                cylinder(d=railDiameter,h=100, center=true);
            
            translate([railWidth/2-railDiameter/2,-railPos,0])
                cylinder(d=railDiameter,h=100, center=true);
            translate([-(railWidth/2-railDiameter/2),-railPos,0])
                cylinder(d=railDiameter,h=100, center=true);
            
            
            translate([baseRadius-wheelCutDepth-motorScrewSize/2-3,23/2,0])
                cylinder(d=motorScrewSize,h=100, center=true);
            translate([baseRadius-wheelCutDepth-motorScrewSize/2-3-13,23/2,0])
                cylinder(d=motorScrewSize,h=100, center=true);
            
            
            translate([baseRadius-wheelCutDepth-motorScrewSize/2-3,-23/2,0])
                cylinder(d=motorScrewSize,h=100, center=true);
            translate([baseRadius-wheelCutDepth-motorScrewSize/2-3-13,-23/2,0])
                cylinder(d=motorScrewSize,h=100, center=true);
            
            translate([-(baseRadius-wheelCutDepth-motorScrewSize/2-3),23/2,0])
                cylinder(d=motorScrewSize,h=100, center=true);
            translate([-(baseRadius-wheelCutDepth-motorScrewSize/2-3-13),23/2,0])
                cylinder(d=motorScrewSize,h=100, center=true);
            
            
            translate([-(baseRadius-wheelCutDepth-motorScrewSize/2-3),-23/2,0])
                cylinder(d=motorScrewSize,h=100, center=true);
            translate([-(baseRadius-wheelCutDepth-motorScrewSize/2-3-13),-23/2,0])
                cylinder(d=motorScrewSize,h=100, center=true);
            

        }
       
    }
}


module pcb_mount_top(d,l){
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

module pcb_mount(d,l,r,pl){
    
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

