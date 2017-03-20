include <settings.scad>;

camHinge();

camWidth=25;
camHeight=25;
hingeWidth=40;
hingeDepth=10;
hingeHeight=15;
hingeBase=5;

module camHinge(){
    
    difference(){
        cube([hingeWidth,hingeDepth,hingeHeight],center=true);
        union(){
            translate([0,0,hingeBase])
                cube([camWidth+5,hingeDepth,hingeHeight],center=true);
            
            translate([-5,0,0])
                cylinder(d=3.5, h=100,center=true);
            
            translate([5,0,0])
                cylinder(d=3.5, h=100,center=true);
            
            translate([0,0,(hingeHeight-hingeBase)/3])
                rotate([0,90,0])
                    cylinder(d=4, h=100,center=true);
        }
    }
    
    rotate([0,90,0])
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
                            cylinder(d=2, h=100,center=true);
                    
                    translate([2.5,7.5,7+2+13+3])
                        rotate([0,90,0])
                            cylinder(d=2, h=100,center=true);
                }
            }
    
        
    rotate([0,90,0])
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
                            cylinder(d=2, h=100,center=true);
                    
                    translate([2.5,0,7+2+13])
                        rotate([90,0,0])
                            cylinder(d=2, h=100,center=true);
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
            
            translate([0,20,0])
                cube([30, 10, baseHeight],center=true);
            
            
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
                cylinder(d=railDiameter,h=100, center=true);
            translate([-1*(railWidth/2-railDiameter/2),railPos,0])
                cylinder(d=railDiameter,h=100, center=true);
            
            translate([railWidth/2-railDiameter/2,-railPos,0])
                cylinder(d=railDiameter,h=100, center=true);
            translate([-(railWidth/2-railDiameter/2),-railPos,0])
                cylinder(d=railDiameter,h=100, center=true);
            
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

*translate([0,20,85/2])
    cube([55,1,85], center=true);
