// Roadfeldt - E3D Chimera / Cyclops - X Carriage Mount for Prusa i3 Rework
//
/*
Copyright (C)2015 Chris Roadfeldt <chris@roadfeldt.com>

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/
//
// Includes E3D Chimera openscad design by Author: Professional 3D - Jons Collasius from Germany/Hamburg
// URL Professional 3D: http://professional3d.de
// http://www.thingiverse.com/thing:1018787
//
// Includes E3D Cyclops openscad design by Author: Professional 3D - Jons Collasius from Germany/Hamburg
// URL Professional 3D: http://professional3d.de
// http://www.thingiverse.com/thing:1018957
//

// Which hotend are we importing? Can only use one at a time, Jons uses the same variable
// and module names and openscad doesn't support conditionally import as far as I can tell.
use<e3d_v6_chimera.scad>;
//use<e3d_vulcano_chimera.scad>;
//use<e3d_cyclops.scad>;

// Bring in the basic delta fan designs I created for visualization.
use<delta_blower_fans.scad>;

// Which part should be displayed.
// xcar = X Carriage mount
// serv = Servo Bracket
// fanm = Fan Mount
// duct = Fan Duct
// mag = Magnetic Z Probe mount
// zpro = Z Probe arm used with servo
// all = All the parts

// Which part should be exported.
which = "all"; // [xcar:X Carriage Chimera Mount, serv:Servo Bracket, fanm:Fan Mount, duct:Fan Duct, zpro:Z Probe, all:All] 

// Which Z Probe type is in use.
servo_mag = "servo"; // [servo:Z Probe Servo, mag:Magnetic Sensor]

// Which hot end is in use.
hotend = "chimera_v6"; // [chimera_v6:Chimera Dual V6, chimera_volcano:Chimera Dual Volcano, cyclops:Cyclops]

// Variables for X Carriage
// How wide to make the X Carriage back plane. Servo mount width is separate and below.
xWidth = 40;

// How high to make the X Carriage back plane. Affects both X Carriage and servo mount.
xHeight = 40;

// How deep the overall X Back Plane should be.
xDepth = 9;

// The radius of the rounded X Back Plane corners.
xCornerRadius = 4;

// How wide to make the X Carriage nut traps, point to point, not flat to flat.
nutDiameter = 8.8;

// How deep to make the X Carriage nut traps.
nutDepth = 4.5;

// How wide to make the X Carriage bolt shaft holes.
boltDiameter = 4.5;

// Distance between mounting bolt holes in the horizontal direction
mountHoleWidth = 23;

// Distance between mounting bolt holes in the vertical direction
mountHoleHeight = 23;

// Width of Chimera is 30, use 31 to account for 3d printer material overage. Use 30.5 for cnc.
chiWidth = 31;

// Horizontal position of Chimera. This postion marks mm from left of backplane. Default middle, (xWidth - chiWidth) / 2
chiPosLR = (xWidth - chiWidth) / 2;

// Vertical position of Chimera. This position marks mm from bottom of backplane. Default 18mm
chiPosUD = 18;

// Height of Chimera cold end. Normally 30, change only if needed.
chiColdHeight = 30;

// Depth of Chimera cold end.
chiColdDepth = 16;

// Extra amount of space add to the rear of the Chimera cold mount. Accounts for 3d printing variances.
chiColdDepthOffset = .5;

// Thickness of Chimera mount vertical brace.
chiBraceThickness = 4;

// How thick the Chimera mount top plate should be.
chiMountThickness = 5;

// Size of hole for screws that mount the Chimera Cold End.
chiScrewHole = 3.2;

// Size of hole for bowden tube fittings.
chiBowdenHole = 8.2;

// Which side should the fan mount to? Be mindful of Z probe clearance.
fanSide = "left"; // [left:Left side of hot end., right:Right side of hot end.]

// Should the fan outlet be towards the left or the right? Be mindful of Z probe clearance.
fanDirection = "right"; // [left:Fan outlet to the left, right:Fan outlet to right]

// How wide to make the tab the cooling fan hangs off of.
fanTabWidth = 8;

// How far out should the  tab the cooling fan hangs off of be. Must be above 0.
fanTabDepth = 8;

// Degrees the fan mount is rotated in the vertical.
fanTabAngle = 0;

// Degrees the fan mount is rotated in the horizontal. Affects fan duct only.
fanTabHorizontalAngle = 0;

// How large to make the bolt hole that the fan bracket will bolt to.
fanTabHole = 3.5;

// How much material should be around the fan bracket screw.
fanTabHoleMat = 2;

// How thick the fan mount should be.
fanMountThickness = 4;

// How wide the nubs on each side of the fan mount tab should be.
fanTabNubWidth = 4;

// How much clearance between the fan mount nubs and the fan tab. Too much of a gap and the fan mount will not snug up properly.
fanTabNubClear = .1;

// How thick should the wall of the fan duct be?
fanDuctThickness = 1;

// How far below the nozzle should the fan outlet point?
fanDuctOutletOffset = 5;

// Which side should the z probe be on? Be mindful of clearance with fan mount.
zProbeSide = "right"; // [right:Right of hot end., left:Left of hot end.]

// How much of a gap from the edge of the X Carriage back plane to the inside of the servo mount.
probeExtWidth = 25;

// How wide the servo housing is when held vertical and mount holes on top and bottom with output facing away.
servoWidth = 12;

// How tall the servo hosting is held in the same orientation as servoWidth.
servoHeight = 23.5;

// Center to center distance for mounting screws on servo.
servoScrewDistance = 28;

// Diameter of screws holes used for mounting servo. Should be slighty smaller than screw.
servoScrewDiameter = 1.5;

// How much material should exist around the servo and servo mount screws.
servoBracketMat = 1.5;

// Diameter of screw holes used for mount bracket that the hold servo bracket.
servoBracketScrewDiameter = 3.5;

// Size of hole for nut trap for servo bracket. Point to point, not flat to flat.
servoBracketNutDiameter = 6.5;

// Depth of hole for nut trap for servo bracket.
servoBracketNutDepth = 2.4;

// Depth of the servo bracket base.
servoBracketBaseDepth = 2;

// Distance between center of servo motor output and side of the servo body.
servoCenterOffset = 5;

// Diameter of whole the servo fits through to mount the arm.
servoShaftDiameter = 6.2;

// Diameter of servo hat where it connects to the servo motor.
servoHatTopDiameter = 6.2;

// Length of servo hat.
servoHatLength = 19;

// Diameter of servo hat at the opposite end of the servo mount, the tip of the servo hat.
servoHatTipDiameter = 4.2;

// Depth the servo hat should recess into the Z Probe Arm.
servoHatRecessDepth = 2;

// Thickness of the Z Probe arm.
zProbeThickness = 4;

// Diameter of Z Probe switch mounting screws.
zProbeScrewDiameter = 2;

// Distance between Z Probe switch mount screws.
zProbeScrewDistance = 10;

// Distance from servo bracket to Z Probe Arm, purely for visualizing how the arm fits in the space provided.
zProbeArmOffset = 4;

// How much material should around the holes in the arm.
zProbeArmMat = 2;

// Distance between the switch mount holes and the side with the switch.
zProbeSwitchHeight = 7.5;

// Distance below nozzle you want the switch to trigger, roughly, depends on switch activation point.
zProbeSwitchActivationDistance = 5;

/* [Hidden] */

// Variables used for calculations and not normally change variables..
boltDepth = (xDepth - nutDepth); // How deep the X Carriage bolt shafts hole are.
mountHoleWidthOffset = (xWidth - (mountHoleWidth /2));
mountHoleHeightOffset = (xHeight - (mountHoleHeight /2));

// Variables for Chimera mount
chiBraceLength = chiColdDepth; // Length of brace for chimera mount in the horizontal. From back plane towards the front.
chiBraceHeight = (chiColdHeight / 2); // How long the brace should be in the vertical, from mount down.
chiMountDepth = (chiColdDepthOffset + 20); // How far out the Chimera mount top plate should be.
chiMountWidth = (chiBraceThickness * 2) + chiWidth; // The width of the Chimera mount top plate.
chiMountL =  ((xWidth / 2) - (chiMountWidth / 2)); // Left horizontal position of Chimera Mount.
chiMountR = xWidth - chiMountL - chiBraceThickness; // Right horizontal position of Chimera Mount.
chiMountUD = chiPosUD; // Vertical postion of Chimera Mount. Relative to Chimera Cold End.
chiScrewHoleHeight = chiMountThickness + .2; // How tall to make the Chimera mount screw holes.
chiScrewLocs = [[chiMountL + (chiMountWidth / 2) - 8.5, xDepth + chiColdDepthOffset + 15],
		[chiMountL + (chiMountWidth / 2), xDepth + chiColdDepthOffset + 3],
		[chiMountL + (chiMountWidth / 2) + 8.5, xDepth + chiColdDepthOffset + 15]]; // X,Y locations for Chimera mount screw holes.
chiBowdenHoleHeight = chiMountThickness + .2; // How tall to make the Bowden tube fitting holes.
chiBowdenLocs = [[chiMountL + (chiMountWidth / 2) - 9, xDepth + chiColdDepthOffset + 6],
		 [chiMountL + (chiMountWidth / 2) + 9, xDepth + chiColdDepthOffset + 6]]; // X,Y locations for Bowden tube fitting holes.
chiV6NozzleL = [[6,-6,-49.6],[24,-6,-49.6]]; // Location of Chimera V6 Nozzles in relation to top rear left corner of cold end.
chiVolNozzleL = []; // Location of Chimera Volcano nozzles in relation to the top rear left corner of cold end.
cycNozzleL =[]; // Locatopm Cyclops nozzle in relation to the top rear left corner of cold end.
	  
// Variables for fan mount tab.
// Holds the x,y,z location for the start of fan tab.
fanTabL = [ fanSide == "left" ?
	    chiMountL :
	    chiMountL + chiMountWidth,
	   - xDepth - chiMountDepth,
	   chiMountUD];

// Variables for the fan mount.
fanBarWidth = fanTabWidth + (fanTabNubWidth * 2) + (fanTabNubClear * 2);
fanMountOffset = [2,0,0]; // Offset from center of fan body to center of fan tab. Allows absolute positioning of fan screw holes.
fanCenterOffset = [-2,0,0]; // Offset the center of the fan blower in relation to the overall fan body.
realFanTabAngle = fanSide == "left" ?
     -fanTabAngle :
     fanTabAngle;
fanDimensions = [50,20,50]; // Dimensions of the fan.
fanScrewL = [0,
	     - ((fanTabHole / 2) + fanTabHoleMat + fanTabDepth),
	     (fanTabHole / 2) + fanTabHoleMat]; // Offset of the center of the fan mount screw from fanTabL

// Variables for Fan Duct
fanDuctConnectSize = [[27, 20, 20], // Outside dimensions of fan outlet
		      [23.8, 16.8, 20]]; // Inside dimensions of fan outlet
fanDuctOverlap = 3; // How much to over lap the connection to the fan.
// Fan Duct starting location, left fan orientation in first vector, right in second. This is offset from fanScrewL. Does NOT take angles into account.
fanDuctConnectL = [[-((fanDimensions[0] / 2) + fanDuctThickness + fanMountOffset[0]),
		    - ((fanTabHole / 2) + fanTabHoleMat + fanMountThickness + fanDimensions[1] + fanMountOffset[1] + fanDuctThickness),
		    - (fanDimensions[2] / 2 ) - fanDuctConnectSize[0][2] + fanDuctOverlap + fanMountOffset[2]],
		   [((fanDimensions[0] / 2)  - fanDuctThickness - fanDuctConnectSize[0][0] + fanMountOffset[0]),
		    - ((fanTabHole / 2) + fanTabHoleMat + fanMountThickness + fanDimensions[1] + fanMountOffset[1] + fanDuctThickness),
		    - (fanDimensions[2] / 2 ) - fanDuctConnectSize[0][2] + fanDuctOverlap + fanMountOffset[2]]];
fanDuctOutletSize = [15,1,3]; // Size of the fan duct outlets.
fanDuctOutletNozzleOffsetL = [0,-18 - fanDuctThickness,5]; // Offset from the nozzles where the fan duct outlets should be placed.
fanDuctOutletAngle = [- atan((fanDuctOutletNozzleOffsetL[2] + fanDuctOutletOffset) / abs(fanDuctOutletNozzleOffsetL[1])),0,0];
fanDuctConnectRadius = 10;

// Variables for probe extension and servo bracket.
// Which side is the probe to be on?
servoBracketL = [ zProbeSide == "right" ?
		  (xWidth + probeExtWidth - (servoBracketNutDiameter / 2) - servoBracketMat) :
		  (-  probeExtWidth + (servoBracketNutDiameter / 2) + servoBracketMat),
		 -xDepth,
		 - (((servoScrewDistance + (servoBracketMat * 2) + (servoBracketNutDiameter * 2) + (servoBracketMat * 4) + (servoScrewDiameter * 2)) / 2) -
		    (xHeight / 2))]; // Location of the bottom right corner of the z probe extension.

servoBottomLegStartL = [- (servoBracketScrewDiameter / 2) - servoBracketMat,
			- servoBracketMat - servoBracketBaseDepth - servoWidth - .1,
			servoBracketNutDiameter + (servoBracketMat * 2)];
servoLegHeight = (servoBracketMat * 2) + servoScrewDiameter + ((servoScrewDistance / 2) - servoBracketMat - (servoHeight / 2));
servoTopLegStartL = [servoBottomLegStartL[0],
		     servoBottomLegStartL[1],
		     servoBottomLegStartL[2] + servoLegHeight + servoHeight];
servoBracketBotScrewL = [0, 0, (servoBracketNutDiameter / 2) + servoBracketMat];
servoBracketTopScrewL = [0, 0, servoTopLegStartL[2] + servoLegHeight + servoBracketMat + (servoBracketNutDiameter / 2)];

// Variables for Z Probe
zProbeTopL = [zProbeSide == "right" ?
	      servoBracketL[0] - (servoBracketNutDiameter / 2) - servoBracketMat - zProbeArmOffset:
	      servoBracketL[0] + (servoBracketNutDiameter / 2) + servoBracketMat + zProbeArmOffset,
	      - (xDepth + servoBracketBaseDepth + (servoWidth / 2)),
	      servoBracketL[2] + servoBottomLegStartL[2] + servoLegHeight + servoCenterOffset];
zProbeBottomL = [servoBracketL[0] - (servoBracketNutDiameter / 2) - servoBracketMat,
		 - (xDepth + servoBracketBaseDepth + (servoWidth / 2)),
		 - (zProbeTopL[2] - (chiMountUD + chiV6NozzleL[0][2])) + (servoHatTopDiameter / 2) + zProbeArmMat + zProbeSwitchHeight - zProbeSwitchActivationDistance];

// Toggle that controls if fan is shown.
showFan = true;

// X Carriage Mount

if(which == "xcar" || which == "all") {
     // Spin up the Mount.
     difference () {
	  union() {
	       // Create the backplane.
	       xback_plane();
	       
	       // Place the Chimera mount in the correct place on the back plane.
	       chimera_mount();
	       
	       // Place the Fan Tab.
	       fan_tab();
	       
	       // Place the Probe Extension.
	       probe_ext();
	  }
	  
	  // Cut out the wholes needed to mount and use the Chimera.
	  chimera_holes();
	  
	  // Cut out the holes needed to mount the back plane to the X Carriage.
	  xback_holes();
	  
	  // Cut out the holes for the servo bracket.
	  probe_ext_holes();
     }

     // Place the E3D Chimera fron Jons.
     translate([(chiPosLR + (chiWidth /2)),
		- (xDepth + chiColdDepthOffset + 6), // 6 is there to offset the fan in the e3d model, used to line everything up properly
		chiPosUD - chiColdHeight])
	  rotate([0,0,0])
	  %e3d();
}

// Fan Mount

if(which == "fanm" || which == "all") {
     // Spin up the Fan Mount.
     translate(fanTabL) // Use fanTabL here and then translate to correct position to avoid using sin/cos to determine position when rotated vertically
	  rotate([0,0,realFanTabAngle])
	  translate(fanScrewL)
	  rotate([fanTabHorizontalAngle,0,0])
	  fan_mount();
}

// Display fan if needed
if(showFan == true && (which == "all" || which == "fanm")) {
     if(fanDirection == "right") {
	  // Place the fan for reference..
	  translate(fanTabL) // Use fanTabL here and then translate to correct position to avoid using sin/cos to determine position when rotated vertically
	       rotate([0,-90,180 + realFanTabAngle])
	       translate([fanScrewL[2],-fanScrewL[1],fanScrewL[0]])
	       rotate([0,0,fanTabHorizontalAngle])
	       translate([fanMountOffset[2],
			  ((fanTabHole / 2) + fanTabHoleMat + fanMountThickness + fanMountOffset[1]),
			  fanMountOffset[0]])
	       %blower_fan_50_20();
     }
     else {
	  translate(fanTabL) // Use fanTabL here and then translate to correct position to avoid using sin/cos to determine position when rotated vertically
	       rotate([0,-90,realFanTabAngle])
	       translate([fanScrewL[2],fanScrewL[1],fanScrewL[0]])
	       rotate([0,0,-fanTabHorizontalAngle])
	       translate([fanMountOffset[2],
			  -((fanTabHole / 2) + fanTabHoleMat + fanMountThickness + fanMountOffset[1] + fanDimensions[1]),
			  fanMountOffset[0]])
	       %blower_fan_50_20();
     }
}
/*
translate([100,0,0])
     if(fanDirection == "right") {
	  rotate([0,-90,180])
	       blower_fan_50_20();
     }
     else {
	  rotate([0,-90,0])
	       translate([0,-20,0])
	       blower_fan_50_20();
     }
*/

// Fan Duct

if(which == "duct" || which == "all") {
     // Place the fan duct.
     translate(fanTabL)
	  rotate([0,0,realFanTabAngle])
	  if(fanDirection == "left") {
	       translate(fanScrewL)
		    rotate([fanTabHorizontalAngle,0,0])
		    translate(fanDuctConnectL[0])
		    difference() {
		    fan_duct();
		    
		    fan_duct_holes();
	       }
	  }
	  else {
	       translate(fanScrewL)
		    rotate([fanTabHorizontalAngle,0,0])
		    translate(fanDuctConnectL[1])
		    difference() {
		    fan_duct();
		    
		    fan_duct_holes();
	       }
	  }
     

}

// Servo Bracket
if(which == "serv" || which == "all") {
     // Place the Servo Bracket.
     difference() {
	  translate(servoBracketL)
	       servo_bracket();
	  
	  translate(servoBracketL)
	       servo_bracket_holes();
     }
}

// Z Probe Arm
if(which == "zpro" || which == "all") {
     // Place the Z Probe Arm
     difference() {
	  translate(zProbeTopL)
	       z_probe_arm();
	  
	  translate(zProbeTopL)
	       z_probe_arm_holes();
     }
}

// Start of code that creates the objects.

// Create module for the X Carriage Mount portion of the back plane.
module xback_plane(xw=xWidth,
		  xh=xHeight,
		  xd=xDepth,
		  xc=xCornerRadius) {
     // Round out the corners, smoothly
     $fn=100;

     // Create the base X Carriage Back Plane
     hull() {
	  // Create the round edges on left edge. Will take care of round corners on right side later.
	  // Bottom Left
	  translate([xCornerRadius,0,xCornerRadius])
	       rotate([90,0,0])
	       cylinder(r=xCornerRadius,h=xDepth);
	  // Top Left
	  translate([xCornerRadius,0,xHeight-xCornerRadius])
	       rotate([90,0,0])
	       cylinder(r=xCornerRadius,h=xDepth);
	  // Bottom Right
	  translate([xWidth - xCornerRadius,0,xCornerRadius])
	       rotate([90,0,0])
	       cylinder(r=xCornerRadius,h=xDepth);
	  // Top Right
	  translate([xWidth - xCornerRadius,0,xHeight-xCornerRadius])
	       rotate([90,0,0])
	       cylinder(r=xCornerRadius,h=xDepth);
	  translate([xCornerRadius,-xDepth,0])
	       cube([xWidth - (xCornerRadius * 2),xDepth,xHeight]);
     }
}

module xback_holes() {
     lrVec = [(xWidth / 2) - (mountHoleWidth / 2),
	      xWidth - ((xWidth / 2) - (mountHoleWidth / 2))];
     udVec = [(xHeight / 2) - (mountHoleHeight / 2),
	      xHeight - ((xHeight / 2) - (mountHoleHeight / 2))];
     
     // Insert the X Carriage bolt holes and nut traps.
     for(lr = lrVec) {
	  for(ud = udVec) {
	       translate([lr,0,ud])
		    rotate([90,90,0])
		    bolt_hole();
	  }
     }
}

// Create module for the bolt hole and nut trap.
module bolt_hole(bdia=boltDiameter,
		 bdep=boltDepth,
		 ndia=nutDiameter,
		 ndep=nutDepth) {
     union() {
	  // Note we shift the cylinders in the z axis by .1 and make then .2 bigger to avoid coincident faces.
	  // Screw hole
	  translate([0,0,-.1])
	       #cylinder(d=bdia,h=bdep + .2,$fn=100);
	  // Nut Trap
	  translate([0,0,bdep - .1])
	       #cylinder(d=ndia,h=ndep + .2,$fn=6);
     }
}

// Chimera Cold End Mount
module chimera_mount() {
     // Create the mount top plate and braces for the Chimera mount plate.
     union() {
	  // Create the top plate to hang the Chimera from.
	  translate([chiMountL,-xDepth - chiMountDepth,chiMountUD])
	       cube([chiMountWidth, chiMountDepth + .1, chiMountThickness]);
	  // Left Brace
	  hull() {
	       // Horizontal
	       translate([chiMountL,-xDepth - chiBraceLength,chiMountUD])
		    cube([chiBraceThickness,chiBraceLength + .1,.1]);
	       // Vertical
	       translate([chiMountL,-xDepth,(chiMountUD - chiBraceHeight)])
		    cube([chiBraceThickness,.1,chiBraceHeight + .1]);
	  }
	  // Right Brace
	  hull() {
	       // Horizontal
	       translate([chiMountR,-xDepth - chiBraceLength,chiMountUD])
		    cube([chiBraceThickness,chiBraceLength + .1,.1]);
	       // Vertical
	       translate([chiMountR,-xDepth,(chiMountUD - chiBraceHeight)])
		    cube([chiBraceThickness,.1,chiBraceHeight + .1]);
	  }	  
     }
}

// Holes for Chimera Cold End Mount and Bowden tubes.
module chimera_holes() {
     // Create the holes, which will be remove from the top plate. Could place screw holes in back plane too,
     // but only useful if mount is rotated 90 degrees in Z. This might be tested as it has advantages for fan placement.
     for(i = chiScrewLocs) {
	  // Create the screw hole and move it to the correct location.
	  translate([i[0],-i[1],chiMountUD - .1])
	       #cylinder(r=(chiScrewHole /2),h=chiScrewHoleHeight, $fn=100);

	  // Create an space for the screw head, used to clear space from the fan tab.
	  translate([i[0],-i[1],chiMountUD + chiMountThickness])
	       cylinder(r=3,
			 h= (chiMountThickness < (fanTabHole + (fanTabHoleMat * 2))) ? ((fanTabHole + (fanTabHoleMat * 2)) - chiMountThickness) + .1 :
			 0,
	                 $fn=100);
     }
     
     for(i = chiBowdenLocs) {
	  // Create the screw hole and move it to the correct location.
	  translate([i[0],-i[1],chiMountUD - .1])
	       #cylinder(r=(chiBowdenHole /2),h=chiBowdenHoleHeight, $fn=100);
     }
}

// Create the fan mount tab
module fan_tab() {
     // Create the tab and screw hole to hang the fan off of.
     hull() {
	  // Hull from the backplane where the cold end mount connects. Works for both left and right mount configurations.
	  translate([chiMountL, -xDepth +.1, chiMountUD])
	       cube([chiMountWidth, .1, chiMountThickness]);

	  // Hull from the front of the cold end mount as well.
	  translate([chiMountL, -xDepth - chiMountDepth, chiMountUD])
	       cube([chiMountWidth, .1, chiMountThickness]);

	  translate(fanTabL)
	       rotate([0,0,realFanTabAngle])
	       translate([-(fanTabWidth / 2), -fanTabDepth + 5, 0])
	       cube([fanTabWidth, fanTabDepth + 5, chiMountThickness]);
     }
     
     difference() {
	  hull() {
	       // Recreate the tab so we can hull to it without hull the whole front and side of Chimera Mount
	       translate(fanTabL)
		    rotate([0,0,realFanTabAngle])
		    translate([-(fanTabWidth / 2), -fanTabDepth + 5, 0])
		    cube([fanTabWidth, fanTabDepth + 5, chiMountThickness]);


	       // Create the cylinder for the fan mount screw.
	       translate(fanTabL)
		    rotate([0,90,realFanTabAngle])
		    translate([-fanScrewL[2],fanScrewL[1],fanScrewL[0]])
			 cylinder(r=(fanTabHole / 2) + fanTabHoleMat, h=fanTabWidth, center=true, $fn=100);
	  }
	  
	  // Carve the hole for the screw on the mount.
	  translate(fanTabL)
	       rotate([0,90,realFanTabAngle])
	       translate([-fanScrewL[2],fanScrewL[1],fanScrewL[0]])
	       #cylinder(r=(fanTabHole / 2), h=fanTabWidth + .2, center=true, $fn=100);
     }
}

// Servo probe extension
module probe_ext() {
     // Create the extension for the z Probe Servo.
     hull() {
	  translate([ zProbeSide == "right" ?
		      servoBracketL[0] - xCornerRadius :
		      servoBracketL[0] + xCornerRadius,
		      0,xCornerRadius])
	       rotate([90,0,0])
	       cylinder(r=xCornerRadius,h=xDepth);
	  
	  translate([ zProbeSide == "right" ?
		      servoBracketL[0] - xCornerRadius :
		      servoBracketL[0] + xCornerRadius,
		      0,xHeight-xCornerRadius])
	       rotate([90,0,0])
	       cylinder(r=xCornerRadius,h=xDepth);
	  
	  translate([ zProbeSide == "right" ?
		      xWidth - probeExtWidth - .1 :
		      -probeExtWidth - .1,
		      -xDepth, 0])
	  cube([probeExtWidth + xCornerRadius + .1, xDepth, xHeight]);
     }
     
     // Create the servo bracket tabs.
     hull () {
	  // Bottom
	  translate([servoBracketL[0],
		     servoBracketL[1] + xDepth,
		     servoBracketL[2] + servoBracketBotScrewL[2]])
	       rotate([90,0,0])
	       cylinder(r=(servoBracketNutDiameter / 2) + servoBracketMat, h=xDepth, $fn=100);

	  // Top
	  translate([servoBracketL[0],
		     servoBracketL[1] + xDepth,
		     servoBracketL[2] + servoBracketTopScrewL[2]])
	       rotate([90,0,0])
	       cylinder(r=(servoBracketNutDiameter / 2) + servoBracketMat, h=xDepth, $fn=100);
     }
}

module probe_ext_holes() {
     // Create the holes needed for the z probe extension.
     // Bottom
     translate([servoBracketL[0],
		servoBracketL[1],
		servoBracketL[2] + servoBracketBotScrewL[2]])
	  rotate([-90,0,0])
	  bolt_hole(servoBracketScrewDiameter, xDepth - servoBracketNutDepth, servoBracketNutDiameter, servoBracketNutDepth);

     // Top
     translate([servoBracketL[0],
		servoBracketL[1],
		servoBracketL[2] + servoBracketTopScrewL[2]])
	  rotate([-90,0,0])
	  bolt_hole(servoBracketScrewDiameter, xDepth - servoBracketNutDepth, servoBracketNutDiameter, servoBracketNutDepth);
}

// Fan Mount for 50x20mm Blower / Centrifugal Fan
module fan_mount() {
     difference() {
	  union() {
	       // Create mount nub and connection to fan mount.
	       fan_mount_nub();
	       
	       // Spin up the base..
	       if(fanDirection == "right") {
		    fan_mount_base();
	       }
	       else {
		    translate([0,- (fanTabHole + (fanTabHoleMat * 2) + fanMountThickness),0])
		    rotate([0,0,180])
			 fan_mount_base();
	       }
	  }
	  // Remove the center of the nub.
	  fan_mount_nub_holes();
	  
	  // Remove the holes and gaps.
	  if(fanDirection == "right") {
	       fan_mount_holes();
	  }
	  else {
	       translate([0,- (fanTabHole + (fanTabHoleMat * 2) + fanMountThickness),0])
		    rotate([0,0,180])
		    fan_mount_holes();
	  }
     }
}

module fan_mount_nub() {
     // Create the cylinder and cube that we hull with so have something to have the mount off of.
     hull() {
	  // Create the nub cylinder.
	  rotate([0,90,0])
	       cylinder(r=(fanTabHole / 2) + fanTabHoleMat, h=fanBarWidth, center=true, $fn=100);
	  
	  // This is what we will hull to, to merge the nubs to the rest of the fan mount.
	  translate([0,
		     -((fanTabHole / 2) + fanTabHoleMat + (fanMountThickness / 2)),
		     0])
	       cube([fanBarWidth,fanMountThickness,fanTabHole + (fanTabHoleMat * 2)], center=true);
     }
}
    
module fan_mount_base() { ///////// TO DO: NEED TO PARAMETIZE THE FAN SCREW LOCATIONS BELOW ///////////////
     hull() {
	  // Need to recreate the cube in the middle of the mount and hull to the fan mount holes to ensure solid contact. Otherwise fan mount to nub contact isn't complete.
	  translate([0,
		     -((fanTabHole / 2) + fanTabHoleMat + (fanMountThickness / 2)),
		     0])
	       cube([fanBarWidth,fanMountThickness,fanTabHole + (fanTabHoleMat * 2)], center=true);

	  fan_screw_hole_single(5.25,fanMountThickness,21.1 + fanMountOffset[0], 0 + fanMountOffset[1], 20 + fanMountOffset[2]);
	  fan_screw_hole_single(5.25,fanMountThickness,-22.1 + fanMountOffset[0], 0 + fanMountOffset[1], 20 + fanMountOffset[2]);
	  fan_screw_hole_single(5.25,fanMountThickness,-22.1 + fanMountOffset[0], 0 + fanMountOffset[1], -18 + fanMountOffset[2]);
     }
}

module fan_mount_nub_holes() {
     // Remove the fan tab to create the separate nubs.
     rotate([0,90,0])
	  cylinder(r=(fanTabHole / 2) + fanTabHoleMat + fanTabNubClear, h=fanTabWidth + (fanTabNubClear * 2), center=true, $fn=100);

     // Carve out the screw / bolt hole.
     rotate([0,90,0])
	  #cylinder(r=(fanTabHole / 2), h=(fanBarWidth + .2), center=true, $fn=100);
}

module fan_mount_holes() {
     // Carve out the fan mounting holes
     #fan_screw_hole_single(2.25,fanMountThickness + .2,21.1 + fanMountOffset[0], 0 + fanMountOffset[1], 20 + fanMountOffset[2]);
     #fan_screw_hole_single(2.25,fanMountThickness + .2,-22.1 + fanMountOffset[0], 0 + fanMountOffset[1], 20 + fanMountOffset[2]);
     #fan_screw_hole_single(2.25,fanMountThickness + .2,-22.1 + fanMountOffset[0], 0 + fanMountOffset[1], -18 + fanMountOffset[2]);

     // Cut out opening for air intake. Leave legs for securing mount to fan tab.
     translate([0 + fanCenterOffset[0] + fanMountOffset[0],
		-((fanTabHole / 2) + fanTabHoleMat) + fanCenterOffset[1] + fanMountOffset[1] +.1,
		fanCenterOffset[2] + fanMountOffset[2]])
	  difference() {
	  #rotate([90,0,0])
	  rotate_extrude($fn=200) {
	       translate([9,0,0])
		    difference() {
		    square([10, fanMountThickness + .2]);
		    
		    translate([-2,2,0])
			 circle(r=3);
		    
		    translate([12,2,0])
			 circle(r=3);
	       }
	  }

	  // Need to move the legs back, otherwise they end up twice as far as they should be
	  // fan_screw_hole_single moves them as well as the translate above.
	  translate([0, (fanTabHole / 2) + fanTabHoleMat, 0]) {
	       hull() {
		    fan_screw_hole_single(2.25,fanMountThickness + .2, 0, -.1, 0);
		    fan_screw_hole_single(2.25,fanMountThickness + .2,21 + fanMountOffset[0], fanMountOffset[1], 20 + fanMountOffset[2]);
	       }
	       hull() {
		    fan_screw_hole_single(2.25,fanMountThickness + .2, 0, -.1, 0);
		    fan_screw_hole_single(2.25,fanMountThickness + .2,-22 + fanMountOffset[0], fanMountOffset[1], 20 + fanMountOffset[2]);
	       }
	       hull() {
		    fan_screw_hole_single(2.25,fanMountThickness + .2, 0, -.1, 0);
		    fan_screw_hole_single(2.25,fanMountThickness + .2,-22 + fanMountOffset[0], fanMountOffset[1], -18 + fanMountOffset[2]);
	       }
	  }
     }
}

module fan_screw_hole_single(radius,height,x,y,z) {
     rotate([90,0,0])
	  translate([x,
		     z,
		     (fanTabHole / 2) + fanTabHoleMat + (fanMountThickness / 2) + y])
	  cylinder(r=radius,h=height,$fn=100,center=true);
}

// Fan Duct
module fan_duct() {
     // Simple fan duct to get something working for now.
     // Create the connection to the fan.
     translate([0,0, fanDuctConnectRadius])
     cube([fanDuctConnectSize[0][0] + (fanDuctThickness * 2),
	   fanDuctConnectSize[0][1] + (fanDuctThickness * 2),
	   fanDuctConnectSize[0][2] - fanDuctConnectRadius + fanDuctOverlap]);

     hull() {
	  // Recreate the body of the fan shroud so we can hull to it.
	  translate([0,0, fanDuctConnectRadius])
	  cube([fanDuctConnectSize[0][0] + (fanDuctThickness * 2),
		fanDuctConnectSize[0][1] + (fanDuctThickness * 2),
		fanDuctConnectSize[0][2] - fanDuctConnectRadius]);

	  // Round out the bottom a bit
	  translate([0,
		     fanDuctConnectRadius - fanDuctThickness,
		     fanDuctConnectRadius - fanDuctThickness])
	       rotate([0,90,0])
	       cylinder(r=fanDuctConnectRadius, h=fanDuctConnectSize[0][0] + (fanDuctThickness * 2),$fn=200);

	  translate([0,
		     fanDuctConnectSize[0][1] - (fanDuctConnectRadius - fanDuctThickness),
		     fanDuctConnectRadius - fanDuctThickness])
	       rotate([0,90,0])
	       cylinder(r=fanDuctConnectRadius, h=fanDuctConnectSize[0][0] + (fanDuctThickness * 2),$fn=200);
	  
	  // Create the outlets.
	  // First determine which hot end is in use.
	  if(hotend == "chimera_v6") {
	       chimera_v6_fan_duct(fanDuctThickness);
	  }
     }
}

module fan_duct_holes() {
     // Carve out the inside part of connection to the fan.
     translate([fanDuctThickness,
		fanDuctThickness,
		fanDuctConnectRadius + fanDuctThickness])
	  #cube([fanDuctConnectSize[0][0],
		 fanDuctConnectSize[0][1],
		 fanDuctConnectSize[0][2] - fanDuctConnectRadius - fanDuctThickness + fanDuctOverlap + .1]);
     #hull () {
	  // Recreate and Carve out the inside part of the body, again so we can hull to it.
	  translate([fanDuctThickness,
		     fanDuctThickness,
		     fanDuctConnectRadius + fanDuctThickness])
	       cube([fanDuctConnectSize[0][0],
		      fanDuctConnectSize[0][1],
		      fanDuctConnectSize[0][2] - fanDuctConnectRadius - fanDuctThickness + .1]);

	  // Round out the bottom a bit
	  translate([fanDuctThickness,
		     fanDuctConnectRadius,
		     fanDuctConnectRadius])
	       rotate([0,90,0])
	       cylinder(r=fanDuctConnectRadius, h=fanDuctConnectSize[0][0],$fn=200);
	  
	  translate([fanDuctThickness,
		     fanDuctConnectSize[0][1] - (fanDuctConnectRadius),
		     fanDuctConnectRadius])
	       rotate([0,90,0])
	       cylinder(r=fanDuctConnectRadius, h=fanDuctConnectSize[0][0],$fn=200);
	  
	  // Carve out the interior of the duct
	  // First determine which hot end is in use.
	  if(hotend == "chimera_v6") {
	       #chimera_v6_fan_duct(0,true);
	  }
     }
}

module chimera_v6_fan_duct(wallThickness,interior=false) {
     // Chimera V6 - Nozzle 1 - Both Nozzles
     for(a=[0:1]) {
	  if(fanDirection == "left") {
	       // Reset position to 0,0,0 so we can properly place the nozzle outlets everytime.
	       translate(-fanDuctConnectL[0]) {
		    rotate([-fanTabHorizontalAngle,0,0]) {
			 translate(-fanScrewL) {
			      rotate([0,0,-realFanTabAngle]) {
				   translate(-fanTabL) {
					// Start the process of placing the nozzles in the correct place. Split up to keep things simpler to understand for now.
					translate([chiPosLR + (chiWidth - 30) / 2, // Account for difference in chiWidth and actual cold end width, reset to left edge
						   -xDepth -chiColdDepthOffset, // reset to rear of cold end
						   chiPosUD]) { // reset to top of cold end
					     translate([chiV6NozzleL[a][0],
							chiV6NozzleL[a][1],
							chiV6NozzleL[a][2]]) {
						  translate(fanDuctOutletNozzleOffsetL) { // Offset from the nozzle where the outlet should be.
						       // Rotate the duct outlets to point to the correct spot.
						       rotate(fanDuctOutletAngle) {
							    cube([fanDuctOutletSize[0] + (wallThickness * 2),
								  fanDuctOutletSize[1] + (interior ? .1 : 0),
								  fanDuctOutletSize[2] + (wallThickness * 2)], center=true);
						       }
						  }
					     }
					}
				   }
			      }
			 }
		    }
	       }
	  }
	  else {
	       translate(-fanDuctConnectL[1]) {
		    rotate([-fanTabHorizontalAngle,0,0]) {
			 translate(-fanScrewL) {
			      rotate([0,0,-realFanTabAngle]) {
				   translate(-fanTabL) {
					// Start the process of placing the nozzles in the correct place. Split up to keep things simpler to understand for now.
					translate([chiPosLR + (chiWidth - 30) / 2, // Account for difference in chiWidth and actual cold end width, reset to left edge
						   -xDepth -chiColdDepthOffset, // reset to rear of cold end
						   chiPosUD]) { // reset to top of cold end
					     translate([chiV6NozzleL[a][0],
							chiV6NozzleL[a][1],
							chiV6NozzleL[a][2]]) {
						  translate(fanDuctOutletNozzleOffsetL) // Offset from the nozzle where the outlet should be.
						       // Rotate the duct outlets to point to the correct spot.
						       rotate(fanDuctOutletAngle) {
						       cube([fanDuctOutletSize[0] + (wallThickness * 2),
							     fanDuctOutletSize[1] + (interior ? .1 : 0),
							     fanDuctOutletSize[2] + (wallThickness * 2)], center=true);
						  }
					     }
					}
				   }
			      }
			 }
		    }
	       }
	  }
     }
}

// Servo Bracket
module servo_bracket() {
     union() {
	  // Create the top and bottom mounting holes.
	  hull () {
	       // Bottom
	       translate(servoBracketBotScrewL)
		    rotate([90,0,0])
		    cylinder(r=(servoBracketScrewDiameter / 2) + servoBracketMat, h=servoBracketBaseDepth, $fn=100);
	       
	       // Top
	       translate(servoBracketTopScrewL)
		    rotate([90,0,0])
		    cylinder(r=(servoBracketScrewDiameter / 2) + servoBracketMat, h=servoBracketBaseDepth, $fn=100);
	  }
	  
	  // Create the servo enclosure.
	  // Spin up a cube that we will punch a hole in for servo later.
	  translate(servoBottomLegStartL)
	       cube([(servoBracketMat * 2) + servoBracketScrewDiameter,
		     servoBracketMat + servoWidth + .2,
		     servoTopLegStartL[2] - servoBottomLegStartL[2] + servoLegHeight]);
     }
}

module servo_bracket_holes() {
     // Create the holes needed for the bracket mount and servo.
     // Bottom
     translate([servoBracketBotScrewL[0],
		servoBracketBotScrewL[1] +.1,
		servoBracketBotScrewL[2]])
	  rotate([90,0,0])
	  #cylinder(d=servoBracketScrewDiameter, h=servoBracketBaseDepth + .2, $fn=100);

     // Top
     translate([servoBracketTopScrewL[0],
		servoBracketTopScrewL[1] +.1,
		servoBracketTopScrewL[2]])
	  rotate([90,0,0])
	  #cylinder(d=servoBracketScrewDiameter, h=servoBracketBaseDepth + .2, $fn=100);

     // Servo hole
     translate([servoBottomLegStartL[0] - .1,
		servoBottomLegStartL[1] + servoBracketMat,
		servoBottomLegStartL[2] + servoLegHeight])
	  #cube([(servoBracketMat * 2) + servoBracketScrewDiameter + .2,
		 servoWidth,
		 servoHeight]);

     // Servo Screw Holes
     // Bottom
     translate([servoBottomLegStartL[0] - .1,
		servoBottomLegStartL[1] + servoBracketMat + (servoWidth / 2),
		servoBottomLegStartL[2] + servoLegHeight - ((servoScrewDistance - servoHeight) / 2)])
	  rotate([-90,0,-90])
	  #cylinder(d=servoScrewDiameter,h=((servoBracketMat * 2) + servoBracketScrewDiameter + .2), $fn=100);

     // Top
     translate([servoTopLegStartL[0] - .1,
		servoTopLegStartL[1] + servoBracketMat + (servoWidth / 2),
		servoTopLegStartL[2] + ((servoScrewDistance - servoHeight) / 2)])
	  rotate([-90,0,-90])
	  #cylinder(d=servoScrewDiameter,h=((servoBracketMat * 2) + servoBracketScrewDiameter + .2), $fn=100);
}

// Z Probe Arm
module z_probe_arm() { //////// WARNING: NEED TO MAKE THIS NOZZLE AWARE, ASSUMES CHIMERA V6 FOR NOW//////////
     // Create a couple of cylinders, hull them together to create the servo arm.
     hull() {
	  // Create the top of the Z Probe Arm
	  translate([-(zProbeThickness / 2),0,0])
	       rotate([0,90,0])
	       cylinder(r=(servoHatTopDiameter / 2) + zProbeArmMat, h=zProbeThickness, $fn=100);
	  
	  // Create the bottom of the Z Probe Arm
          translate([-(zProbeThickness / 2),0,zProbeBottomL[2]])
		  rotate([0,90,0])
		  cylinder(r=(servoHatTopDiameter / 2) + zProbeArmMat, h=zProbeThickness, $fn=100);
     }

     // Create the switch mount.
     hull() {
	  // Recreate the bottom of the Z Probe Arm so we can hull to it.
	  translate([-(zProbeThickness / 2),0,zProbeBottomL[2]])
	       rotate([0,90,0])
	       cylinder(r=(servoHatTopDiameter / 2) + zProbeArmMat, h=zProbeThickness, $fn=100);

	  // Create the cylinders for the switch mount.
	  for(b=[0:1]) {
	       translate([-(zProbeThickness / 2),
			  b==0 ? -(zProbeScrewDistance / 2) + (zProbeScrewDiameter / 2) :
			  (zProbeScrewDistance / 2) - (zProbeScrewDiameter / 2),
			  zProbeBottomL[2] - (servoHatTopDiameter / 2)])
		    rotate([0,90,0])
		    cylinder(r=(zProbeScrewDiameter / 2) + zProbeArmMat, h=zProbeThickness, $fn=100);
	       }
     }	       
}

module z_probe_arm_holes() {
     // Create the servo shaft whole.
     translate([- (zProbeThickness / 2) - .1,0,0])
     rotate([0,90,0])
	  #cylinder(r=(servoShaftDiameter / 2), h=zProbeThickness + .2, $fn=100);
     
     // Create the servo hat recess.
     #hull() {
	  // Create the servo hat recess, top first.
	  translate([zProbeSide == "right" ? - servoHatRecessDepth - .1 :
		     (zProbeThickness / 2) - servoHatRecessDepth,
		     0,0])
	  rotate([0,90,0])
	       cylinder(r=(servoHatTopDiameter / 2), h=servoHatRecessDepth + .1, $fn=100);
	  
	  // Create the bottom of servo hat recess.
	  translate([zProbeSide == "right" ? - servoHatRecessDepth - .1 :
		     (zProbeThickness / 2) - servoHatRecessDepth,
		     0,- (servoHatLength - (servoHatTopDiameter / 2) - (servoHatTipDiameter / 2))])
	       rotate([0,90,0])
	       cylinder(r=(servoHatTipDiameter / 2), h=servoHatRecessDepth + .1, $fn=100);
     }

     // Create the holes that mount the switch.
     	  // Create the cylinders for the switch mount.
     for(b=[0:1]) {
	  translate([-(zProbeThickness / 2) - .1,
		     b==0 ? -(zProbeScrewDistance / 2) + (zProbeScrewDiameter / 2) :
		     (zProbeScrewDistance / 2) - (zProbeScrewDiameter / 2),
		     zProbeBottomL[2] - (servoHatTopDiameter / 2)])
	       rotate([0,90,0])
	       #cylinder(r=(zProbeScrewDiameter / 2), h=zProbeThickness + .2, $fn=100);
     }
}
