include <settings.scad>;

base();


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
