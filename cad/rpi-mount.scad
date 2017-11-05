include <settings.scad>
use <parts-lib.scad>

translate([0,0,-1])
    pcb_mount_top(3,3);
translate([0,25,0])
    rotate([90,0,0])
    pcb_mount(3,2,2,49);