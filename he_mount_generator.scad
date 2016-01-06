 // Roadfeldt - Hot End Mount Generator
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
// Includes E3D V6 openscad design by Author: Professional 3D - Jons Collasius from Germany/Hamburg
// URL Professional 3D: http://professional3d.de
// http://www.thingiverse.com/thing:548237
//
// Includes E3D V6 w/ Volcano openscad design by Author: Professional 3D - Jons Collasius from Germany/Hamburg
// URL Professional 3D: http://professional3d.de                                                                                                          // http://www.thingiverse.com/thing:862716
//
// Includes Lulzbot Hexagon Hot End openscad design by andreas.thorn@gmail.com -- This model is inaccurate according to lulzbot documentation. Mount is correct.
// https://www.youmagine.com/designs/hexagon-hotend-visualization

// Which hotend are we importing? Can only use one at a time, Jons uses the same variable
// and module names and openscad doesn't support conditionally import as far as I can tell.
use<e3d_v6_chimera.scad>;
//use<e3d_vulcano_chimera.scad>;
//use<e3d_cyclops.scad>;
//use<e3d_v6_all_metall_hotend.scad>;
//use<e3d_v6_volcano_all_metall_hotend.scad>;
use<Hexagon-102.scad>;

// Bring in the basic delta fan designs I created for visualization.
use<delta_blower_fans.scad>;

/* [Features] */

// What type of Carriage do you use / need?
carriage = "cbot"; // [cbot:C Bot style, prusai3:Prusa i3]

// Which hot end is in use. Ensure you enter height from top of mount to tip of nozzle if you select generic J Head.
hotend = "e3d_v6"; // [chimera_v6:Chimera Dual V6, chimera_vol:Chimera Dual Volcano, cyclops:Cyclops, e3d_v6:E3D V6, e3d_v6_vol:E3D V6 w/ Volcano, jhead_mkv:J Head Mark V, hexagon:Hexagon, gen_jhead:Generic J Head]

// Which Z Probe type is in use. Select Servo here if you want to if you Servo Bracket selected above, otherwise it won't appear.
servoInduct = "induct"; // [servo:Servo w/ Arm, induct:Inductive / Capacitive Sensor, none:Neither/None]

// Which side should the z probe be on? Be mindful of clearance with fan mount.
zProbeSide = "right"; // [right:Right of hot end., left:Left of hot end.]

// Which side should the fan mount to? Be mindful of Z probe clearance.
printFanSide = "left"; // [left:Left side of hot end., right:Right side of hot end., none:No print cooling fan.]

// Should the fan outlet point towards the left or the right? Be mindful of Z probe clearance.
printFanDirection = "right"; // [left:Fan outlet to the left, right:Fan outlet to right]

// Should the nut traps be closed, so printing support is not needed? This will mean the holes with nut traps will be closed with .1mm amount of material which will need to be removed prior to use.
boltHoleSupportFix = 1; // [ 1:Yes, 0:No]

// Should the parts be exploded, do this before producing the stl file. You will still receive a single STL file with all the parts, but they will be separated so you can split them up with Cura or NetFabb. Select no if you want to see the parts fit together as they would on the printer. Selecting no will NOT produce a valid STL for printing as the parts will be inseparable.
explodeParts = 1; // [1:Yes, 0:No]

/* [Prusa i3] */

// Which part should be displayed.
// xcar = X Carriage mount
// serv = Servo Bracket
// fanm = Fan Mount
// fant = Fan Bracket
// duct = Fan Duct
// mag = Magnetic Z Probe mount
// zpro = Z Probe arm used with servo
// jhead_col = J Head style collar
// all = All parts

// Which Prusa i3 part should be exported.
prusai3Which = "all"; // [hotm:Back Plane & Cold / Hot End  Mount, jhead_col: J Head Style Collar, servo:Servo Bracket, fanm:Fan Mount, fant:Fan Bracket, duct:Fan Duct, zarm:Z Probe Servo Arm, induct:Inductive / Capacitive Sensor, all:All Parts ] 

// How wide to make the X Carriage back plane.
xMountWidth = 40;

// How high to make the X Carriage back plane. Affects both X Carriage and servo mount.
xMountHeight = 40;

// How deep the overall X Back Plane should be.
xMountDepth = 9;

// The radius of the rounded X Back Plane corners.
xMountCornerRadius = 4;

// How wide to make the X Carriage nut traps, point to point, not flat to flat.
xMountNutDiameter = 8.8;

// How deep to make the X Carriage nut traps.
xMountNutDepth = 4.5;

// How wide to make the X Carriage bolt shaft holes.
xMountBoltDiameter = 4.5;

// Distance between mounting bolt holes in the horizontal direction
xMountHoleWidth = 23;

// Distance between mounting bolt holes in the vertical direction
xMountHoleHeight = 23;

// How wide to make the tab the cooling fan hangs off of.
prusai3FanTabWidth = 8;

// How far out should the tab the cooling fan hangs off of be. Must be above 0.
prusai3FanTabDepth = 4;

// Degrees the fan mount is rotated in the vertical.
prusai3FanTabVerticalAngle = 0;

// Degrees the fan mount is rotated in the horizontal. Affects fan duct only.
prusai3FanTabHorizontalAngle = 0;

// How large to make the bolt hole that the fan bracket will bolt to.
prusai3FanTabHole = 3.5;

// How much material should be around the fan bracket screw.
prusai3FanTabMat = 2;

// How wide the nubs on each side of the fan mount tab should be.
prusai3FanTabNubWidth = 4;

// How deep the fan bracket should be.
prusai3FanBracketDepth = 3;

/* [C Bot Carriage] */

// Which part should be displayed.
// hotm = Carriage side with hot end
// carrside = Carriage side opposite hot end side. This one is for accessories.
// serv = Servo Bracket
// fanm = Fan Mount
// fant = Fan Bracket
// duct = Fan Duct
// mag = Magnetic Z Probe mount
// zpro = Z Probe arm used with servo
// jhead_col = J Head style collar
// all = All parts

// Which C Botpart should be exported.
cBotWhich = "all"; // [hotm:Carriage with Cold / Hot End  Mount, carrside: Carriage Side, jhead_col:J Head Style Collar, belth:Belt Holder, servo:Servo Bracket, fant:Fan Mount Bracket, fanm:Fan Mount, duct:Fan Duct, zarm:Z Probe Servo Arm, induct:Inductive / Capacitive Sensor, all:All Parts] 

// Do you want a carriage mount axis limit switch?
cBotXAxisSwitch = "none"; // [yl99:YL-99, keyes:Keyes, gen:Generic Mini Switch, none:None]

// Which side should have the endstop mount?
cBotXAxisSwitchSide = "acc"; // [he:Hot End, acc:Accessory, both:Both]

// How deep into the carriage should the switch be recessed?
cBotXAxisSwitchDepth = 1;

// How far should the switch stick out from the carriage?
cBotXAxisSwitchOffset = 2;

// How far in should the cutout for the through hole cavity be?
cBotXAxisSwitchTHOffset = 2;

// Minimum width of carriage, will be increase if needed.
cBotCarriageMinWidth = 72;

// Height of carriage.
cBotCarriageHeight = 65;

// Depth of carriage.
cBotCarriageDepth = 5;

// Diameter of screw holes for carriage idler wheels.
cBotCarriageIdlerScrewDiameter = 5;

// Amount of material around screw holes for carriage idler wheels.
cBotCarriageIdlerScrewMat = 3.3;

// Diameter of screw holes that mounts back plane to carriage.
cBotCarriageMountScrewDiameter = 4;

// Horizontal distance of screw holes for back plane mount. Not used if hot end mount is integrated.
cBotCarriageMountScrewHorizontalDistance = 30;

// Vertical distance of screw holes for back plane mount. Not used if hot end mount is integrated.
cBotCarriageMountScrewVerticalDistance = 30;

// Vertical position of back plane mount from bottom of carriage. Not used if hot end mount is integrated.
cBotBackMountVertPosition = 40;

// Vertical position of fan bracket.
cBotFanMountPos = 25;

// Vertical position of accessory mount holes. Offset from top and bottom respectively.
cBotAccessoryMountPos = 7;

// Vertical position of cable tie locations. Offset from top down.
cBotCableTieVerticalPos = 4.5;

// Vertical distance of cable tie locations. Offset from top down.
cBotCableTieVerticalDistance = 15;

// How many rows of cable tie cut outs should there be?
cBotCableTieVerticalCount = 3;

// How many columns of cable tie cut outs should there be?
cBotCableTieHorizontalCount = 3;

// How much to shrink the horizontal spacing of the cable ties?
cBotCableTieHorizontalOffset = 5;

/* [Hot End Settings] */

// How far out to offset the Hot End from the rear of the mount.
heDepthOffset = 0.1;

// Hot end mount height offset. Positive number = higher, negative = lower.
heHeightOffset = 0;

// Thickness of Chimera mount vertical brace.
chiBraceThickness = 4;

// How thick the Chimera mount top plate should be.
chiMountHeight = 5;

// Enter height in millimeters from the top of the J Head mount, usually that is the top of the cold end itself. The top of the mount is 3.7 mm from the top of the inner groove of the J Head mount.
genJHeadHeight = 0;

// J Head adjustments. How much to adjust the J Head mount. Really dependent on your printer. Print a calibration cube and enter the adjustments in size here. These are mm and will be added to their respective parameters. eg; you want to make the height of the collar in the middle smaller by .2mm, enter -.2 in innerCollarHeightAdjustment. If you want to make that same collar a larger hole by .2mm, enter .2 in innerCollarDiameterAdjustment.

upperCollarDiameterAdjustment = 0;
upperCollarHeightAdjustment = 0;
innerCollarDiameterAdjustment = 0;
innerCollarHeightAdjustment = 0;
lowerCollarDiameterAdjustment = 0;
lowerCollarHeightAdjustment = 0;

/* [Print Cooling Fan] */

// How thick the fan mount should be.
fanMountThickness = 4;

// Diameter of the hole for the screws that hold the fan on to the mount.
fanMountScrewDiameter = 4.5;

// Amount of material around the fan screw holes.
fanMountScrewMat = 3;

// X,Y coordinates of holes for fan screw relative to the center of the fan. Top right, top left, bottom left. Leave the negative signs.
fanMountScrews = [[21,20],[-22,20],[-22,-18]];

// Dimensions of the fan. Width, depth, height when looking at it from the side.
fanDimensions = [50,20,50];

// Outside dimensions of fan outlet
fanDuctConnectSize = [27, 20, 20];

// Offset from center of fan body to center of fan tab. Left / Right, Forward / Back, Up / Down. Usually only need Left / Right.
fanMountOffset = [2,0,0];

// Offset the center of the fan blower in relation to the overall fan body. Usually negative value of fanMountOffset.
fanCenterOffset = [-2,0,0];

// Diameter of fan opening. If your fan has air intakes on both sides, enter the diameter of that opening here.
fanIntakeDiameter = 20;

// How much clearance between the fan mount nubs and the fan tab. Too much of a gap and the fan mount will not snug up properly.
fanTabNubClear = .1;

// How far below the bottom of the fan should the bowl of the duct be.
fanDuctBowlDepth = 5;

// How thick should the wall of the fan duct be?
fanDuctThickness = 1;

// How far the fan duct should overlap the inside edge of the fan itself when connected.
fanDuctOverlap = 2.75;

// How far the fan duct should overlap the outside edge of the fan itself when connected.
fanDuctOutsideOverlap = 6;

// How far below the nozzle should the fan outlet point?
fanDuctOutletOffset = 5;

 // Offset from the nozzles where the fan duct outlets should be placed. Leave named variables in place.
fanDuctOutletNozzleOffsetL = [0,-18 - fanDuctThickness,5];

// Size of the fan duct outlets.
fanDuctOutletSize = [15,1,3];

/* [Z Probe / Servo] */

// How much of a gap from the edge of the X Carriage back plane to the inside of the servo mount.
probeExtWidth = 25;

// How wide the servo body is when held vertical and mount holes on top and bottom with output facing away.
servoWidth = 12;

// How tall the servo body is held in the same orientation as servoWidth.
servoHeight = 23.5;

// How tall the servo mounting bracket is. Held in the same orientation as servoWidth.
servoMountPlateHeight = 32;

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

// Offset of servo mount from the bracket. Allows for C Bot bracket screws to clear. Keep in mind the fan mount probably needs to be adjusted as well so servo and fan mount and fan duct don't interfere with each other.
servoBracketOffset = 1;

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

/* [Inductive / Capacitive Sensor] */

// Distance between hot end mount and side of induct mount. Only applicable to Prusa i3.
inductMountDistance = 8;

// Diameter of sensor.
inductDiameter = 12;

// Amount of material around sensor, account for nuts and washers around the sensor.
inductMat = 3;

// Offset of mount from back of X Carriage back plane.
inductOffset = 0;

// Thickness of sensor mount plate.
inductMountThickness = 3;

// Height of mount plate above nozzle tip.
inductHeight = 20;

// Depth of back plate of induct mount.
inductBracketDepth = 3;

// Height of sensor mount braces.
inductBraceHeight = 20;

// Width of braces.
inductBraceWidth = 3;

// Diameter of screws that hold bracket on.
inductBracketScrewDiameter = 3.2;

// Diameter of nuts that hold bracket on.
inductBracketNutDiameter = 6.5;

// Depth of hole for nut trap for inductive sensor bracket.
inductBracketNutDepth = 2.4;

// Mount inductive sensor with a removable bracket?
inductMountBracketed = 1; // [0:No, 1:Yes]

/* [Prusa i3 Carriage Advanced] */

// Variables used for calculations and not normally change variables..
xMountBoltDepth = (xMountDepth - xMountNutDepth); // How deep the X Carriage bolt shafts hole are.
xMountHoleWidthOffset = (xMountWidth - (xMountHoleWidth /2));
xMountHoleHeightOffset = (xMountHeight - (xMountHoleHeight /2));

/* [Chimera / Cyclops Advanced] */

// Variables for E3D Chimera / Cyclops
chiColdHeight = 30;
chiColdDepth = 16;
chiScrewHole = 3.2; // Size of hole for screws that mount the Chimera Cold End.
chiBowdenHole = 8.2; // Size of hole for bowden tube fittings.
chiHEPosUD = (carriage == "prusai3" ? 15 : 20);
chiBraceLength = chiColdDepth; // Length of brace for chimera mount in the horizontal. From back plane towards the front.
chiBraceHeight = (chiColdHeight / 2) - (carriage == "prusai3" ? (chiHEPosUD - (chiColdHeight / 2) < xMountCornerRadius ? xMountCornerRadius - (chiHEPosUD - (chiColdHeight / 2)) : 0) : 0);
chiWidth = 31; // Width of Chimera is 30, use 31 to account for 3d printer material overage. Use 30.5 for cnc.
chiMountDepth = (heDepthOffset + 20); // How far out the Chimera mount top plate should be.
chiMountWidth = (chiBraceThickness * 2) + chiWidth; // The width of the Chimera mount top plate.
chiScrewHoleHeight = chiMountHeight + .2; // How tall to make the Chimera mount screw holes.
chiScrewLocs = [[(chiMountWidth / 2) - 8.5, chiMountDepth - (heDepthOffset + 15)],
		[(chiMountWidth / 2), chiMountDepth - (heDepthOffset + 3)],
		[(chiMountWidth / 2) + 8.5, chiMountDepth - (heDepthOffset + 15)]]; // X,Y locations for Chimera mount screw holes.
chiBowdenHoleHeight = chiMountHeight + .2; // How tall to make the Bowden tube fitting holes.
chiBowdenLocs = [[(chiMountWidth / 2) - 9, chiMountDepth - (heDepthOffset + 6)],
		 [(chiMountWidth / 2) + 9, chiMountDepth - (heDepthOffset + 6)]]; // X,Y locations for Bowden tube fitting holes.
chiV6NozzleL = [[6,-6,-49.6],[24,-6,-49.6]]; // Location of Chimera V6 Nozzles in relation to top rear left corner of cold end.
chiVolNozzleL = [[6,-6,-59.6],[24,-6,-59.6]]; // Location of Chimera Volcano nozzles in relation to the top rear left corner of cold end.
cycNozzleL = [[15,-6,-50.1]]; // Location of Cyclops nozzle in relation to the top rear left corner of cold end.

/* [J Head Mount Advanced */

// Variables for J Head Mount
jHeadWidth = 26;
jHeadHEPosUD = (carriage == "prusai3" ? 14 : 20);
jHeadUpperCollarDiameter = 16 + upperCollarDiameterAdjustment;
jHeadUpperCollarHeight = (hotend == "hexagon" ? 4.7 : (hotend == "jhead_mkv" ? 4.76 : 3.7)) + upperCollarHeightAdjustment;
jHeadInnerCollarDiameter = 12 + innerCollarDiameterAdjustment;
jHeadInnerCollarHeight = (hotend == "hexagon" ? 4.5 : (hotend == "jhead_mkv" ? 4.64 : 6)) + innerCollarHeightAdjustment;
jHeadLowerCollarDiameter = 16 + lowerCollarDiameterAdjustment;
jHeadLowerCollarHeight = (hotend == "hexagon" ? 4.6 : 3) + lowerCollarHeightAdjustment;
jHeadMountWidth = 36;
jHeadMountHeight = jHeadUpperCollarHeight + jHeadInnerCollarHeight + jHeadLowerCollarHeight;
jHeadMountDepth = 25;
jHeadCollarCornerRadius = 3;
jHeadMountBoltDiameter = 3.2;
jHeadMountNutDiameter = 6.5;
jHeadMountNutDepth = 2.4;
jHeadFanScrewOffset = 5;
jHeadMountScrewHorizontalOffset = (jHeadWidth / 4);
jHeadMountScrewVerticalOffset = (jHeadMountHeight / 2);

/* [E3D V6 Advanced] */

// Variables for E3D V6
v6NozzleL = [[0, 0, -62.3]]; // This must be a vector of vectors. If only one nozzle, enter x,y,z in [[ ]]
v6VolNozzleL = [[0,0,-72.3]]; // This must be a vector of vectors. If only one nozzle, enter x,y,z in [[ ]]

/* [J Head Mark V Advanced] */

// Variables for J Head Mark V
jheadMkVNozzleL = [[0, 0, -51]]; // This must be a vector of vectors. If only one nozzle, enter x,y,z in [[ ]]

/* [Hexagon Advanced] */

// Variables for Hexagon Hot End
hexagonNozzleL = [[0, 0, -55]]; // This must be a vector of vectors. If only one nozzle, enter x,y,z in [[ ]]

/* [Generic J Head Advanced] */

// Variables for Generic J Head Hot End
genericJHeadNozzleL = [[0, 0, -genJHeadHeight]]; // This must be a vector of vectors. If only one nozzle, enter x,y,z in [[ ]]

/* [Hidden] */

// Collision switch variables
ylSwitchDimensions = [[31,5,14],[4,12,2.5,4,1.8]]; //[x,y,z],[hole x, hole z, hole d, nut dia, nut depth],[hole.....
keyesSwitchDimensions = [[35,10,21],[2.25,19,2.5,4,1.8],[2.25,2,2.5,4,1.8]];
genSwitchDimensions = [[15,7,20],[2.5,5,2.5,4,1.8],[2.5,15,2.5,4,1.8]];
cBotXAxisSwitchDimensions = (cBotXAxisSwitch == "yl99" ? ylSwitchDimensions :
			     (cBotXAxisSwitch == "keyes" ? keyesSwitchDimensions :
				  (cBotXAxisSwitch == "gen" ? genSwitchDimensions : [])));
echo("cBotXAxisSwitchDimensions[0][0]",cBotXAxisSwitchDimensions[0][0]);
echo("cBotXAxisSwitchDimensions[0][1]",cBotXAxisSwitchDimensions[0][1]);
echo("cBotXAxisSwitchDimensions[0][2]",cBotXAxisSwitchDimensions[0][2]);

// Display parts offset
partsOffset = [0,10,0];

// Generic Hot End Variables
heNozzleL = (hotend == "chimera_v6" ? chiV6NozzleL
	     : (hotend == "chimera_vol" ? chiVolNozzleL
		: (hotend == "cyclops" ? cycNozzleL
		   : (hotend == "e3d_v6" ? v6NozzleL
		      : (hotend == "e3d_v6_vol" ? v6VolNozzleL
			 : (hotend == "jhead_mkv" ? jheadMkVNozzleL
			    : (hotend == "hexagon" ? hexagonNozzleL
			       : (hotend == "gen_jhead" ? genericJHeadNozzleL
				  : [[0]])))))))); // This must be a vector of vectors. If only one nozzle, enter x,y,z in [[ ]]

// Prusa i3 variant carriage specific positioning variables.
prusai3FanBarWidth = prusai3FanTabWidth + (prusai3FanTabNubWidth * 2) + (fanTabNubClear * 2);
prusai3FanTabHeight = chiMountHeight;
prusai3FanScrewOffset = (((prusai3FanTabHole / 2) + prusai3FanTabMat) - prusai3FanTabHeight);
prusai3RealFanTabVerticalAngle = printFanSide == "left" ?
     - prusai3FanTabVerticalAngle :
     prusai3FanTabVerticalAngle;
prusai3ChiMountL = [((xMountWidth / 2) - (chiMountWidth / 2)),
		    - (xMountDepth + chiMountDepth),
		    chiHEPosUD + heHeightOffset]; // Position of Chimera Mount.
prusai3ChiAnchorL = [((xMountWidth / 2) - (chiWidth / 2)),
		    - (xMountDepth + heDepthOffset),
		    prusai3ChiMountL[2]]; // Position of Chimera Mount Anchor point.
prusai3JHeadMountL =  [((xMountWidth / 2) - (jHeadMountWidth / 2)),
		    - (xMountDepth + jHeadMountDepth + heDepthOffset),
		    jHeadHEPosUD + heHeightOffset]; // Position of J Head Mount.
prusai3JHeadAnchorL = [(xMountWidth / 2),
		    - (xMountDepth + (jHeadMountDepth / 2) + heDepthOffset),
		    prusai3JHeadMountL[2] + jHeadMountHeight]; // Position of J Head Anchor point..

prusai3HEMountL = (hotend == "chimera_v6" || hotend == "chimera_vol" || hotend == "cyclops")
     ? prusai3ChiMountL
     : (hotend == "e3d_v6" || hotend == "e3d_v6_vol" || hotend == "jhead_mkv" || hotend == "hexagon" || hotend == "gen_jhead")
     ? prusai3JHeadMountL
     : 0;
prusai3HEAnchorL = (hotend == "chimera_v6" || hotend == "chimera_vol" || hotend == "cyclops")
     ? prusai3ChiAnchorL
     : (hotend == "e3d_v6" || hotend == "e3d_v6_vol" || hotend == "jhead_mkv" || hotend == "hexagon" || hotend == "gen_jhead")
     ? prusai3JHeadAnchorL
     : 0;
prusai3ChiFanScrewL = [printFanSide == "left" ?
		       prusai3ChiMountL[0] + (sin(prusai3RealFanTabVerticalAngle) * ((prusai3FanTabHole / 2) + prusai3FanTabMat + prusai3FanTabDepth)) :
		       prusai3ChiMountL[0] + chiMountWidth + (sin(prusai3RealFanTabVerticalAngle) * ((prusai3FanTabHole / 2) + prusai3FanTabMat + prusai3FanTabDepth)),
		       prusai3ChiMountL[1] - (cos(prusai3RealFanTabVerticalAngle) * ((prusai3FanTabHole / 2) + prusai3FanTabMat + prusai3FanTabDepth)),
		       prusai3ChiMountL[2] + (prusai3FanTabHole / 2) + prusai3FanTabMat]; // Offset of the center of the fan mount screw from prusai3FanTabL
prusai3JHeadFanScrewL = [prusai3JHeadMountL[0] + (jHeadMountWidth / 2) + (sin(prusai3RealFanTabVerticalAngle) * ((prusai3FanTabHole / 2) + prusai3FanTabMat + prusai3FanTabDepth)),
		      prusai3JHeadMountL[1] - prusai3FanBracketDepth - (cos(prusai3RealFanTabVerticalAngle) * ((prusai3FanTabHole / 2) + prusai3FanTabMat + prusai3FanTabDepth)),
		      prusai3JHeadMountL[2] + (jHeadMountHeight / 2) + ((prusai3FanTabHeight / 2) + prusai3FanScrewOffset)]; // Offset of the center of the fan mount screw from prusai3FanTabL
prusai3FanScrewL = (hotend == "chimera_v6" || hotend == "chimera_vol" || hotend == "cyclops")
     ? prusai3ChiFanScrewL
     : (hotend == "e3d_v6" || hotend == "e3d_v6_vol" || hotend == "jhead_mkv" || hotend == "hexagon" || hotend == "gen_jhead")
     ? prusai3JHeadFanScrewL
     : 0;
prusai3DuctConnectL = fan_duct_connect(prusai3FanScrewL, prusai3FanTabHorizontalAngle, prusai3RealFanTabVerticalAngle, fanDimensions, fanCenterOffset, fanMountOffset, fanMountThickness, prusai3FanTabHole, prusai3FanTabMat, fanDuctConnectSize);

/* [C Bot Carriage Advanced] */

// Variables for C Bot Carriage.
cBotCarriageSideDistance = 20;
cBotTopHoleLength = 2;
cBotTopHoleAngle = 4.1;
cBotTopHoleDepth = 6;
cBotMountScrewDepth = cBotCarriageDepth - 2.5;
cBotBeltDepth = 3;
cBotBeltToothHeight = 1;
cBotBeltToothSpacing = 2;
cBotBeltToothLength = 10;
cBotBeltLength = 13;
cBotBeltHeight = 7;
cBotBeltBottomPos = 7; // Distance from center of carriage side.
cBotBeltTopPos = 6; // Distance from center of carriage side.
cBotBeltScrewDiameter = 3.2;
cBotBeltScrewDistance = 3;
cBotBeltScrewNutDiameter = 6.5;
cBotBeltScrewNutDepth = 2.4;
cBotBeltHolderHeight = 19;
cBotBeltHolderDepth = 3;
cBotBeltHolderNubDepth = 2;
cBotBeltHolderNubHeight = 6.2;
cBotBeltHolderCornerRadius = 1;
cBotCenterHoleDiameter = 25;
cBotCenterHoleWidth = 30;
cBotCarriageCornerRadius = (cBotCarriageIdlerScrewDiameter / 2) + cBotCarriageIdlerScrewMat;
cBotFanTabVerticalAngle = 0;
cBotFanTabHorizontalAngle = 0;
cBotRealFanTabVerticalAngle = printFanSide == "left" ?
     cBotFanTabVerticalAngle :
     - cBotFanTabVerticalAngle;
cBotFanMountDistance = 10;
cBotFanBracketWidth = 20;
cBotFanBracketHeight = 8;
cBotFanBracketDepth = 3;
cBotFanTabHeight = 8;
cBotFanTabWidth = 5;
cBotFanTabDepth = 4;
cBotFanTabAngle = 0;
cBotFanTabHole = 3.2;
cBotFanTabMat = 2;

/* [Hidden] */
inductMountWidth = inductDiameter + (inductBraceWidth * 2) + (inductMat * 2);
cBotCarriageWidth = cBotCarriageMinWidth + (servoInduct == "servo" ? servoHeight :
					    (servoInduct == "induct" ? inductMountWidth :
					    0));
cBotFanBarWidth = cBotFanTabWidth + (cBotFanTabWidth * 2) + (fanTabNubClear * 2);
cBotFanScrewL = [printFanSide == "left" ? cBotCarriageWidth - (fanDimensions[0] / 2) :
		 (fanDimensions[0] / 2),
		 cBotCarriageSideDistance + cBotCarriageDepth + cBotFanBracketDepth + cBotFanTabDepth + (cBotFanTabHole / 2) + cBotFanTabMat,
		 cBotFanMountPos];
cBotFanScrewOffset = 0;
cBotTempDuctConnectL = fan_duct_connect(cBotFanScrewL, cBotFanTabHorizontalAngle, cBotRealFanTabVerticalAngle, fanDimensions, fanCenterOffset, fanMountOffset, fanMountThickness, cBotFanTabHole, cBotFanTabMat, fanDuctConnectSize, true);
cBotDuctConnectL = [cBotTempDuctConnectL[1],cBotTempDuctConnectL[0]];
cBotChiMountL = [(cBotCarriageWidth / 2) - (chiMountWidth / 2),
		 - (cBotCarriageDepth + chiMountDepth),
		 chiHEPosUD + heHeightOffset];
cBotChiAnchorL = [cBotChiMountL[0] + ((chiMountWidth - chiWidth) / 2),
		  - (cBotCarriageDepth + heDepthOffset),
		    cBotChiMountL[2]]; // Position of Chimera Mount.
cBotJHeadMountL = [(cBotCarriageWidth / 2) - (jHeadMountWidth / 2),
		   - (cBotCarriageDepth + jHeadMountDepth + heDepthOffset),
		   jHeadHEPosUD + heHeightOffset];
cBotJHeadAnchorL = [cBotJHeadMountL[0] + (jHeadMountWidth / 2),
		    - (cBotCarriageDepth + (jHeadMountDepth / 2) + heDepthOffset),
		    cBotJHeadMountL[2] + jHeadMountHeight]; // Position of E3D V6 Mount.
cBotHEMountL = (hotend == "chimera_v6" || hotend == "chimera_vol" || hotend == "cyclops")
     ? cBotChiMountL
     : (hotend == "e3d_v6" || hotend == "e3d_v6_vol" || hotend == "jhead_mkv" || hotend == "hexagon" || hotend == "gen_jhead")
     ? cBotJHeadMountL
     : 0;
cBotHEAnchorL = (hotend == "chimera_v6" || hotend == "chimera_vol" || hotend == "cyclops")
     ? cBotChiAnchorL
     : (hotend == "e3d_v6" || hotend == "e3d_v6_vol" || hotend == "jhead_mkv" || hotend == "hexagon" || hotend == "gen_jhead")
     ? cBotJHeadAnchorL
     : 0;
cBotCableTieHorizontalDistance = (cBotCarriageWidth / (cBotCableTieHorizontalCount + 1));
echo("cBotCableTieHorizontalDistance", cBotCableTieHorizontalDistance);

// Generic variables that are hot end and carriage dependent.
heMountL = (carriage == "prusai3" ? prusai3HEMountL : (carriage == "cbot" ? cBotHEMountL : 0));
heAnchorL =  (carriage == "prusai3" ? prusai3HEAnchorL : (carriage == "cbot" ? cBotHEAnchorL : 0));
fanScrewL = (carriage == "prusai3" ? prusai3FanScrewL : (carriage == "cbot" ? cBotFanScrewL : 0));
tempDuctConnectL = (carriage == "prusai3" ? prusai3DuctConnectL : (carriage == "cbot" ? cBotDuctConnectL : 0));
ductConnectL = (printFanDirection == "left" ? tempDuctConnectL[0] : tempDuctConnectL[1]);
heMountWidth = (hotend == "chimera_v6" || hotend == "chimera_vol" || hotend == "cyclops")
     ? chiMountWidth
     : (hotend == "e3d_v6" || hotend == "e3d_v6_vol" || hotend == "jhead_mkv" || hotend == "hexagon" || hotend == "gen_jhead")
     ? jHeadMountWidth
     : 0;
prusai3InductMountL = [ zProbeSide == "right" ?
			heMountL[0] + heMountWidth + inductMountDistance:
			heMountL[0] - (inductMountWidth + inductMountDistance),
			-xMountDepth,
			heAnchorL[2] + heNozzleL[0][2] + inductHeight];
cBotInductMountL = [ zProbeSide == "right" ?
		     (cBotCarriageWidth / 2) - (cBotFanMountDistance / 2) - (cBotFanMountDistance * 2) + (inductMountWidth / 2) :
		     (cBotCarriageWidth / 2) + (cBotFanMountDistance / 2) + (cBotFanMountDistance * 2) + (inductMountWidth / 2),
		     cBotCarriageSideDistance + cBotCarriageDepth,
		     heAnchorL[2] + heNozzleL[0][2] + inductHeight];
inductMountL = (carriage == "prusai3" ? prusai3InductMountL : (carriage == "cbot" ? cBotInductMountL : 0));

// Variables for Fan Duct
fanDuctOutletAngle = [- atan((fanDuctOutletNozzleOffsetL[2] + fanDuctOutletOffset + fanDuctOutletSize[2]) / abs(fanDuctOutletNozzleOffsetL[1])),0,0];
fanDuctConnectRadius = fanDuctConnectSize[2] / 2; // Radius of the bottom of the fan duct below housing.


// Variables for probe extension and servo bracket.
prusai3ServoBracketL = [ zProbeSide == "right" ?
			 (xMountWidth + probeExtWidth - (servoBracketNutDiameter / 2) - servoBracketMat) :
			 (- probeExtWidth + (servoBracketNutDiameter / 2) + servoBracketMat),
			 -xMountDepth,
			 - (((servoMountPlateHeight + (servoBracketNutDiameter * 2) + (servoBracketMat * 4)) / 2) - (xMountHeight / 2))];
cBotServoBracketL = [(zProbeSide == "right" ?
		      (cBotCarriageWidth / 2) - ((cBotFanMountDistance / 2) + (cBotFanMountDistance * 2)):
		      (cBotCarriageWidth / 2) + (cBotFanMountDistance / 2) + (cBotFanMountDistance * 2)),
		     cBotCarriageSideDistance + cBotCarriageDepth,
		     - ((servoBracketMat * 2) + servoWidth + ((servoMountPlateHeight - servoHeight) / 2))];
servoBracketL = (carriage == "prusai3" ? prusai3ServoBracketL : cBotServoBracketL);
servoMountL = [-(servoBracketMat + (servoBracketScrewDiameter / 2)),
	       -((servoBracketMat * 2) + servoWidth + servoBracketBaseDepth + (carriage == "cbot" ? servoBracketOffset : 0)),
	       (servoBracketMat * 2) + servoBracketNutDiameter];
prusai3ServoBracketBotScrewL = [0,0,(servoBracketMat + (servoBracketNutDiameter / 2))];
prusai3ServoBracketTopScrewL = [0,0,(servoBracketMat * 3) + (servoBracketNutDiameter * 1.5) + servoMountPlateHeight];
cBotServoBracketBotScrewL = [zProbeSide == "right" ?
			     cBotFanMountDistance :
			     - cBotFanMountDistance,
			     servoBracketBaseDepth,
			     -servoBracketL[2] + cBotAccessoryMountPos];
cBotServoBracketTopScrewL = [cBotServoBracketBotScrewL[0],
			     cBotServoBracketBotScrewL[1],
			     cBotServoBracketBotScrewL[2] + cBotAccessoryMountPos];
servoBracketBotScrewL = (carriage == "prusai3" ? prusai3ServoBracketBotScrewL : cBotServoBracketBotScrewL);
servoBracketTopScrewL = (carriage == "prusai3" ? prusai3ServoBracketTopScrewL : cBotServoBracketTopScrewL);

/*cBotServoMountL =  [-(servoBracketMat + (servoBracketScrewDiameter / 2)),
		    -((servoBracketMat * 2) + servoWidth + servoBracketBaseDepth),
		    (servoBracketMat * 2) + servoBracketNutDiameter];
servoMountL = (carriage == "prusai3" ? prusai3ServoMountL : cBotServoMountL);
*/

// Variables for Z Probe
prusai3ZProbeTopL = [zProbeSide == "right" ?
		     servoBracketL[0] + servoMountL[0] - zProbeArmOffset:
		     servoBracketL[0] + servoMountL[0] + zProbeArmOffset,
		     servoBracketL[1] + servoMountL[1] + servoBracketMat + (servoWidth / 2),
		     servoBracketL[2] + servoMountL[2] + ((servoMountPlateHeight - servoHeight) / 2) + servoCenterOffset];
cBotZProbeTopL = [zProbeSide == "right" ?
		  servoBracketL[0] + servoMountL[0] - zProbeArmOffset:
		  servoBracketL[0] - servoMountL[0] + zProbeArmOffset,
		  servoBracketL[1] - servoMountL[1] - servoBracketMat - (servoWidth / 2),
		  servoBracketL[2] + servoMountL[2] + ((servoMountPlateHeight - servoHeight) / 2) + servoCenterOffset];
zProbeTopL = (carriage == "prusai3" ? prusai3ZProbeTopL : cBotZProbeTopL);
zProbeBottomL = -zProbeTopL[2] + (heAnchorL[2] + heNozzleL[0][2]) + (servoHatTopDiameter / 2) + zProbeArmMat + zProbeSwitchHeight - zProbeSwitchActivationDistance;

// Toggle that controls if fan is shown.
showFan = true;
showHE = true;

//////////// Prusa i3 Carriage //////////
if (carriage == "prusai3") {
     // X Carriage Mount     
     if(prusai3Which == "hotm" || prusai3Which == "all") {
	  // Spin up the Mount.
	  difference () {
	       union() {
		    // Create the backplane.
		    xback_plane();
		    
		    // Place the hot end mount, need to do here so holes are cut correctly.
		    // Chimera Mount
		    if(hotend == "chimera_v6" || hotend == "chimera_vol" || hotend == "cyclops") {
			 // Place the Chimera mount
			 translate(heMountL)
			      chimera_mount("below",
					    prusai3RealFanTabVerticalAngle, prusai3FanTabWidth, prusai3FanTabDepth,
					    prusai3FanTabHeight, prusai3FanTabHole, prusai3FanTabMat, printFanSide);
		    }

		    // J Head style mount
		    if(hotend == "e3d_v6" || hotend == "e3d_v6_vol" || hotend == "jhead_mkv" || hotend == "hexagon" || hotend == "gen_jhead") {
			 // Place the J Head style mount
			 translate(heMountL)
			      jhead_mount(xMountDepth);
		    }
		    
		    // Attach fan tab if needed.
		    if((printFanSide != "none") && (hotend == "chimera_v6" || hotend == "chimera_vol" || hotend == "cyclops")) {
			 translate(fanScrewL)
			      rotate([0,0,prusai3RealFanTabVerticalAngle])
			      fan_tab(prusai3FanScrewOffset,prusai3FanTabWidth,
				      prusai3FanTabDepth,prusai3FanTabHeight,prusai3FanTabHole,prusai3FanTabMat);
		    }
		    
		    // Servo Extension
		    if(servoInduct == "servo") {
			 // Place the servo extension.
			 servo_ext(servoBracketL);
		    }
		    
		    // Inductive / Capacitive Extension
		    if(servoInduct == "induct") {
			 // Place the Inductive / Capacitive Sensor extension.
			 induct_ext();

			 // Place the induct mount itself
			 difference() {
			      // Place the mount.
			      translate(inductMountL)
				   induct_mount(inductMountBracketed, xMountDepth);
			      
			      // Carve out the wholes for the mount.
			      translate(inductMountL)
				   induct_mount_holes(inductMountBracketed);
			 }
		    }
	       }
	       
	       // Cut out the holes needed to mount the back plane to the X Carriage.
	       xback_holes();
	       
	       // Cut out the wholes for the appropriate cold / hot end.
	       if(hotend == "chimera_v6" || hotend == "chimera_vol" || hotend == "cyclops") {
		    // Cut out the wholes needed to mount and use the Chimera.
		    translate(heMountL)
			 chimera_mount_holes();
	       }
	       
	       // Carve J Head style mount holes, if needed.
	       if(hotend == "e3d_v6" || hotend == "e3d_v6_vol" || hotend == "jhead_mkv" || hotend == "hexagon" || hotend == "gen_jhead") {
		    translate(heMountL)
			 jhead_holes(xMountDepth);
	       }
	       
	       // Servo Extension Holes
	       if(servoInduct == "servo") {
		    // Cut out the holes for the servo bracket.
		    servo_ext_holes(servoBracketL);
	       }
	  
	       // Inductive / Capacitive Extension
	       if(servoInduct == "induct") {
		    // Place the Inductive / Capacitive sensor holes.
		    translate(inductMountL)
			 induct_ext_holes(inductMountBracketed, xMountDepth);
	       }
	  }
     }

     // J Head style mount collar
     if((hotend == "e3d_v6" || hotend == "e3d_v6_vol" || hotend == "jhead_mkv" || hotend == "hexagon" || hotend == "gen_jhead") && (prusai3Which == "jhead_col" || prusai3Which == "all")) {
	  // Place the J Head collar.
	  translate(explodeParts == 1 ? (heMountL - partsOffset) : heMountL)
	       jhead_collar(xMountDepth);
     }
    
     // Display cold / hot end model.
     if((prusai3Which == "hotm" || prusai3Which == "all") && (hotend == "chimera_v6" || hotend == "chimera_vol" || hotend == "cyclops") && (showHE == true)) {
	  // Place the E3D Chimera fron Jons.
	  translate([((xMountWidth - chiWidth) / 2) + (chiWidth /2),
		     - (xMountDepth + heDepthOffset + 6), // 6 is there to offset the fan in the e3d model, used to line everything up properly
		     heMountL[2] - chiColdHeight])
	       %e3d();
     }

     // Display E3D V6 if needed.
     if((prusai3Which == "hotm" || prusai3Which == "all") && (hotend == "e3d_v6" || hotend == "e3d_v6_vol") && (showHE == true)) {
	  // Place the E3D V6.
	  translate([heMountL[0] + (jHeadMountWidth / 2),
		     heMountL[1] + (jHeadMountDepth / 2),
		     heMountL[2] + 16])
	       rotate([0,180,0])
	       %e3d();
     }

     // Display Hexagon if needed.
     if((prusai3Which == "hotm" || prusai3Which == "all") && (hotend == "hexagon") && (showHE == true)) {
	  // Place the E3D V6.
	  translate([heMountL[0] + (jHeadMountWidth / 2),
		     heMountL[1] + (jHeadMountDepth / 2),
		     heMountL[2] + hexagonNozzleL[0][2] + 12.7])
	       rotate([0,0,0])
	       %hexagon_hotend();
     }

     // Fan Bracket, if needed.
     if((prusai3Which == "fant" || prusai3Which == "all") && (hotend == "e3d_v6" || hotend == "e3d_v6_vol" || hotend == "jhead_mkv" || hotend == "hexagon" || hotend == "gen_jhead"))  {
	  // Place the fan tab.
	  translate(explodeParts == 1 ? (fanScrewL - (partsOffset * 2)) : fanScrewL)
	       bracket_fan_tab(jHeadMountWidth - (jHeadCollarCornerRadius * 2), prusai3FanBracketDepth, jHeadMountHeight, jHeadMountBoltDiameter,
			       (jHeadMountWidth / 2),
			       prusai3FanTabWidth, prusai3FanTabDepth, prusai3FanTabHeight,
			       prusai3FanTabHole, prusai3FanTabMat, prusai3FanScrewOffset);
     }
     
     // Fan Mount
     if((prusai3Which == "fanm" || prusai3Which == "all") && printFanSide != "none") {
	  // Spin up the Fan Mount.
	  translate(explodeParts == 1 ? (fanScrewL - (partsOffset * 3)) : fanScrewL)
	       rotate([prusai3FanTabHorizontalAngle,0,prusai3RealFanTabVerticalAngle])
	       fan_mount(prusai3FanTabHole, prusai3FanTabMat, prusai3FanTabWidth, fanTabNubClear, fanMountThickness, prusai3FanBarWidth, fanMountOffset, fanCenterOffset, fanMountScrewDiameter, fanMountScrewMat, fanMountScrews, fanIntakeDiameter, printFanDirection);
     }
     
     // Display fan if needed
     if(showFan == true && (prusai3Which == "all" || prusai3Which == "fanm")) {
	  if(printFanDirection == "left") {
	       // Place the fan for reference.
	       translate(explodeParts == 1 ? (fanScrewL - (partsOffset * 3)) : fanScrewL)
		    rotate([prusai3FanTabHorizontalAngle,0,prusai3RealFanTabVerticalAngle])
		    rotate([0,-90,0])
		    translate([fanMountOffset[2],
			       -((prusai3FanTabHole / 2) + prusai3FanTabMat + fanMountThickness + fanMountOffset[1] + fanDimensions[1]),
			       fanMountOffset[0]])
		    %blower_fan_50_20();
	  }
	  else {
	       translate(explodeParts == 1 ? (fanScrewL - (partsOffset * 3)) : fanScrewL)
		    rotate([-prusai3FanTabHorizontalAngle,0,180 + prusai3RealFanTabVerticalAngle])
		    rotate([0,-90,0])
		    translate([fanMountOffset[2],
			       ((prusai3FanTabHole / 2) + prusai3FanTabMat + fanMountThickness + fanMountOffset[1]),
			       fanMountOffset[0]])
		    %blower_fan_50_20();
	  }
     }

     // Display fan duct if needed
     if((prusai3Which == "all" || prusai3Which == "duct") && printFanSide != "none") {
	  // Place the fan duct.
	  translate(explodeParts == 1 ? (fanScrewL - (partsOffset * 3)) : fanScrewL)
	       rotate([prusai3FanTabHorizontalAngle,0,prusai3RealFanTabVerticalAngle])
	       translate(ductConnectL)
	       difference() {
	       fan_duct(ductConnectL, fanScrewL, heAnchorL, prusai3FanTabHorizontalAngle, prusai3RealFanTabVerticalAngle, printFanDirection, false);
	       
	       fan_duct_holes(ductConnectL, fanScrewL, heAnchorL, prusai3FanTabHorizontalAngle, prusai3RealFanTabVerticalAngle, printFanDirection, false);
	  }
     }

     // Servo Bracket
     if((prusai3Which == "servo" || prusai3Which == "all") && servoInduct == "servo") {
	  // Place the Servo Bracket.
	  translate(explodeParts == 1 ? (servoBracketL - partsOffset) : servoBracketL)
	       difference() {
	       servo_bracket();
	       
	       servo_bracket_holes();
	  }
     }
     
     // Z Probe Arm
     if((prusai3Which == "zarm" || prusai3Which == "all") && servoInduct == "servo" && servoInduct != "none") {
	  // Place the Z Probe Arm
	  translate(explodeParts == 1 ? (zProbeTopL - partsOffset) : zProbeTopL)
	       difference() {
	       z_probe_arm(zProbeBottomL);
	       
	       z_probe_arm_holes(zProbeBottomL);
	  }
     }

     // Inductive / Capacitive Extension
     if((prusai3Which == "induct" || prusai3Which == "all") && servoInduct == "induct") {
	  // Place the induct mount itself
	  difference() {
	       // Place the mount.
	       translate(inductMountL)
		    induct_mount(inductMountBracketed, xMountDepth);
	       
	       // Carve out the wholes for the mount.
	       translate(inductMountL)
		    induct_mount_holes(inductMountBracketed);
	  }
     }
}

////////// C Bot //////////
if(carriage == "cbot") {
     // Carriage side with hot end mount.
     if(cBotWhich == "hotm" || cBotWhich == "all") {
	  difference() {
	       union() {
		    // Display C Bot Hot End Carriage Side.
		    cbot_carriage_side(true);

		    // Replace material behind the mount.
		    if(hotend == "chimera_v6" || hotend == "chimera_vol" || hotend == "cyclops") {
			 translate([(cBotCarriageWidth / 2) - (cBotCenterHoleWidth / 2),
				    heMountL[1] + chiMountDepth,
				    heMountL[2]])
			      cube([cBotCenterHoleWidth, cBotCarriageDepth, chiMountHeight]);
		    }

		    // Replace material behind the mount.
		    if(hotend == "e3d_v6" || hotend == "e3d_v6_vol" || hotend == "jhead_mkv" || hotend == "hexagon" || hotend == "gen_jhead") {
			 translate([(cBotCarriageWidth / 2) - (cBotCenterHoleWidth / 2),
				    heMountL[1] + jHeadMountDepth + heDepthOffset,
				    heMountL[2]])
			      cube([cBotCenterHoleWidth, cBotCarriageDepth, jHeadMountHeight]);
		    }
	       }

	       // Carve J Head style mount holes, if needed.
	       if(hotend == "e3d_v6" || hotend == "e3d_v6_vol" || hotend == "jhead_mkv" || hotend == "hexagon" || hotend == "gen_jhead") {
		    translate(heMountL)
			 jhead_holes(cBotCarriageDepth);
	       }
	  }
		    
	  // Place the Chimera / Cyclops hot end.
	  if(hotend == "chimera_v6" || hotend == "chimera_vol" || hotend == "cyclops") {
	       // Place the hot end mount.
	       translate(heMountL) {		    
		    // Place the mount and carve out the wholes.
		    difference() {
			 chimera_mount();
			 
			 chimera_mount_holes();
		    }
		    
		    // Display cold / hot end model.
		    if((hotend == "chimera_v6" || hotend == "chimera_vol" || hotend == "cyclops") && (showHE == true)) {
			 // Place the E3D Chimera fron Jons.
			 translate([(chiWidth / 2) + chiBraceThickness,
				    chiColdDepth - 2, // 6 is there to offset the fan in the e3d model, used to line everything up properly
				    -chiColdHeight])
			      %e3d();
		    }
	       }
	  }
	       
	  // J Head style mount
	  if(hotend == "e3d_v6" || hotend == "e3d_v6_vol" || hotend == "jhead_mkv" || hotend == "hexagon" || hotend == "gen_jhead") {
	       // Place the J Head style mount
	       translate(heMountL)
		    jhead_mount(cBotCarriageDepth);

	  }

	  // Display E3D V6 if needed.
	  if((hotend == "e3d_v6" || hotend == "e3d_v6_vol") && (showHE == true)){
	       // Place the E3D V6
	       translate([heMountL[0] + (jHeadMountWidth / 2),
			  heMountL[1] + (jHeadMountDepth / 2),
			  heMountL[2] + 16])
		    rotate([0,180,0])
		    %e3d();
	  }

	  // Display Hexagon if needed.
	  if((cBotWhich == "hotm" || cBotWhich == "all") && (hotend == "hexagon") && (showHE == true)) {
	       // Place the E3D V6.
	       translate([heMountL[0] + (jHeadMountWidth / 2),
			  heMountL[1] + (jHeadMountDepth / 2),
			  heMountL[2] + hexagonNozzleL[0][2] + 12.7])
		    rotate([0,0,0])
		    %hexagon_hotend();
	  }
     }
     

     // J Head style mount collar
     if((hotend == "e3d_v6" || hotend == "e3d_v6_vol" || hotend == "jhead_mkv" || hotend == "hexagon" || hotend == "gen_jhead") && (cBotWhich == "jhead_col" || cBotWhich == "all")) {
	  translate(explodeParts == 1 ? (heMountL - partsOffset) : heMountL)
	       jhead_collar(cBotCarriageDepth);
     }

     // Opposite side carriage plate.
     if(cBotWhich == "carrside" || cBotWhich == "all") {
	  // Non hot end carriage side.
	  translate([cBotCarriageWidth, cBotCarriageSideDistance, 0])
	       rotate([0, 0, 180])
	       cbot_carriage_side(false);
     }
     
     // Fan Mount Bracket
     if(cBotWhich == "fant" || cBotWhich == "all") {
	  // Place the fan tab.
	  translate(explodeParts == 1 ? (fanScrewL + partsOffset) : fanScrewL)
	       rotate([0, 0, 180])
	       bracket_fan_tab(cBotFanBracketWidth, cBotFanBracketDepth, cBotFanBracketHeight, cBotBeltScrewDiameter,
			       cBotFanMountDistance,
			       cBotFanTabWidth, cBotFanTabDepth, cBotFanTabHeight,
			       cBotFanTabHole, cBotFanTabMat, cBotFanScrewOffset);
     }
     
     // Fan Mount
     if(cBotWhich == "fanm" || cBotWhich == "all") {
	  translate(explodeParts == 1 ? (fanScrewL + (partsOffset * 2)) : fanScrewL)
	       rotate([0, 0, 180])
	       fan_mount(cBotFanTabHole, cBotFanTabMat, cBotFanTabWidth, fanTabNubClear, fanMountThickness, cBotFanBarWidth, fanMountOffset, fanCenterOffset, fanMountScrewDiameter, fanMountScrewMat, fanMountScrews, fanIntakeDiameter, printFanDirection);
     }
     
     // Display fan if needed
     if(showFan == true && (cBotWhich == "all" || cBotWhich == "fanm")) {
	  if(printFanDirection == "left") {
	       // Place the fan for reference..
	       rotate([0,-90,180 + cBotRealFanTabVerticalAngle])
		    translate([explodeParts == 1 ? (fanScrewL[2] + (partsOffset[2] * 2)) : fanScrewL[2],
			       explodeParts == 1 ? -(fanScrewL[1] + (partsOffset[1] * 2)) : -fanScrewL[1],
			       explodeParts == 1 ? (fanScrewL[0] + (partsOffset[0] * 2)) : fanScrewL[0]])
		    rotate([0,0,cBotFanTabHorizontalAngle])
		    translate([fanMountOffset[2],
			       -((cBotFanTabHole / 2) + cBotFanTabMat + fanMountThickness + fanMountOffset[1] + fanDimensions[1]),
			       fanMountOffset[0]])
		    %blower_fan_50_20();
	  }
	  else {
	       rotate([0,-90,cBotRealFanTabVerticalAngle])
		    translate([explodeParts == 1 ? (fanScrewL[2] + (partsOffset[2] * 2)) : fanScrewL[2],
			       explodeParts == 1 ? (fanScrewL[1] + (partsOffset[1] * 2)) : fanScrewL[1],
			       explodeParts == 1 ? -(fanScrewL[0] + (partsOffset[0] * 2)) : -fanScrewL[0]])
		    rotate([0,0,-cBotFanTabHorizontalAngle])
		    translate([fanMountOffset[2],
			       ((cBotFanTabHole / 2) + cBotFanTabMat + fanMountThickness + fanMountOffset[1]),
			       fanMountOffset[0]])
		    %blower_fan_50_20();
	  }
     }
     
     // Display fan duct if needed
     if((cBotWhich == "all" || cBotWhich == "duct") && printFanSide != "none") {
	  // Place the fan duct.
	  translate(explodeParts == 1 ? (fanScrewL + (partsOffset * 2)) : fanScrewL)
	       rotate([cBotFanTabHorizontalAngle,0,cBotFanTabVerticalAngle])
	       translate(ductConnectL)
	       difference() {
	       fan_duct(ductConnectL, fanScrewL, heAnchorL, cBotFanTabHorizontalAngle, cBotRealFanTabVerticalAngle, printFanDirection, true);
	       
	       fan_duct_holes(ductConnectL, fanScrewL, heAnchorL, cBotFanTabHorizontalAngle, cBotRealFanTabVerticalAngle, printFanDirection, true);
	  }
     }

     // Inductive / Capacitive Extension
     if((cBotWhich == "induct" || cBotWhich == "all") && servoInduct == "induct") {
	  // Place the induct mount itself
	  difference() {
	       // Place the mount.
	       translate(inductMountBracketed == 1 ?
			 (explodeParts == 1 ? (inductMountL + partsOffset) :
			  inductMountL) :
			 inductMountL)
		    rotate([0,0,180])
		    induct_mount(inductMountBracketed, cBotCarriageDepth,true);
	       
	       // Carve out the wholes for the mount.
	       translate(inductMountBracketed == 1 ?
			 (explodeParts == 1 ? (inductMountL + partsOffset) :
			  inductMountL) :
			 inductMountL)
		    rotate([0,0,180])
		    induct_mount_holes(inductMountBracketed,true);
	  }
     }

     // Servo Bracket
     if((cBotWhich == "servo" || cBotWhich == "all") && servoInduct == "servo") {
	  // Place the Servo Bracket.
	  translate(explodeParts == 1 ? (servoBracketL + partsOffset) : servoBracketL)
	       difference() {
	       servo_bracket(true);

	       servo_bracket_holes(true);
	  }
     }

     // Z Probe Arm
     if((cBotWhich == "zarm" || cBotWhich == "all") && servoInduct == "servo" && servoInduct != "none") {
	  // Place the Z Probe Arm
	  translate(explodeParts == 1 ? (zProbeTopL + partsOffset) : zProbeTopL)
	       rotate([-90,0,180])
	       difference() {
	       z_probe_arm(zProbeBottomL);
	       
	       z_probe_arm_holes(zProbeBottomL);
	  }
     }

     // Belt holders.
     if(cBotWhich == "belth" || cBotWhich == "all") {
	  translate([-15,0,0])
	       cbot_belt_holder();
     }
}

//////// Component Modules /////////

// Prusa i3 X Carriage back plane for the mount.
module xback_plane(xw=xMountWidth,
		   xh=xMountHeight,
		   xd=xMountDepth,
		   xc=xMountCornerRadius) {
     // Round out the corners, smoothly
     $fn=100;

     // Create the base X Carriage Back Plane
     hull() {
	  // Create the round edges on left edge. Will take care of round corners on right side later.
	  // Bottom Left
	  translate([xMountCornerRadius,0,xMountCornerRadius])
	       rotate([90,0,0])
	       cylinder(r=xMountCornerRadius,h=xMountDepth);
	  // Top Left
	  translate([xMountCornerRadius,0,xMountHeight-xMountCornerRadius])
	       rotate([90,0,0])
	       cylinder(r=xMountCornerRadius,h=xMountDepth);
	  // Bottom Right
	  translate([xMountWidth - xMountCornerRadius,0,xMountCornerRadius])
	       rotate([90,0,0])
	       cylinder(r=xMountCornerRadius,h=xMountDepth);
	  // Top Right
	  translate([xMountWidth - xMountCornerRadius,0,xMountHeight-xMountCornerRadius])
	       rotate([90,0,0])
	       cylinder(r=xMountCornerRadius,h=xMountDepth);
	  translate([xMountCornerRadius,-xMountDepth,0])
	       cube([xMountWidth - (xMountCornerRadius * 2),xMountDepth,xMountHeight]);
     }
}

module xback_holes() {
     lrVec = [(xMountWidth / 2) - (xMountHoleWidth / 2),
	      xMountWidth - ((xMountWidth / 2) - (xMountHoleWidth / 2))];
     udVec = [(xMountHeight / 2) - (xMountHoleHeight / 2),
	      xMountHeight - ((xMountHeight / 2) - (xMountHoleHeight / 2))];
     
     // Insert the X Carriage bolt holes and nut traps.
     for(lr = lrVec) {
	  for(ud = udVec) {
	       translate([lr,0,ud])
		    rotate([90,90,0])
		    bolt_hole(xMountBoltDiameter,
			      xMountBoltDepth,
			      xMountNutDiameter,
			      xMountDepth);
	  }
     }
}

// Create module for the bolt hole and nut trap.
module bolt_hole(bdia=xMountBoltDiameter,
		 bdep=xMountBoltDepth,
		 ndia=xMountNutDiameter,
		 ndep=xMountNutDepth) {
     union() {
	  // Note we shift the cylinders in the z axis by .1 and make then .2 bigger to avoid coincident faces.
	  // Screw hole
	  translate([0,0,-.1])
	       cylinder(d=bdia,h=bdep + (boltHoleSupportFix == 1 ? 0 : .2),$fn=100);
	  // Nut Trap
	  translate([0,0,bdep])
	       cylinder(d=ndia,h=ndep + .1,$fn=6);
     }
}

// Chimera Cold End Mount
module chimera_mount(bracePos="below", fanTabAngle, fanTabWidth, fanTabDepth, fanTabHeight, fanTabHole, fanTabHoleMat, fanSide) {
     // Create the mount top plate and braces for the Chimera mount plate.
     union() {
	  // Create the top plate to hang the Chimera from.
	  hull() {
	       cube([chiMountWidth, chiMountDepth + .1, chiMountHeight]);

	       // Attach fan tab if needed.
	       if(carriage == "prusai3" && printFanSide != "none") {
		    translate([fanSide == "left" ? 0 : chiMountWidth, 0, 0])
			 rotate([0, 0, fanTabAngle])
			 translate([- (fanTabWidth / 2), - fanTabDepth, 0])
			 cube([fanTabWidth, fanTabDepth, fanTabHeight]);
		    
	       }
	  }	       
	  // Left Brace
	  hull() {
	       // Horizontal
	       translate([0,
			  (chiMountDepth - chiBraceLength),
			  bracePos == "below" ? 0 : chiMountHeight - .1])
		    cube([chiBraceThickness, chiBraceLength + .1, .1]);

	       // Vertical
	       translate([0,
			  chiMountDepth,
			  bracePos == "below" ? -chiBraceHeight : chiMountHeight - .1])
		    cube([chiBraceThickness, .1, chiBraceHeight + .1]);
	  }
	  // Right Brace
	  hull() {
	       // Horizontal
	       translate([chiMountWidth - chiBraceThickness,
			  (chiMountDepth - chiBraceLength),
			  bracePos == "below" ? 0 : chiMountHeight - .1])
		    cube([chiBraceThickness, chiBraceLength + .1, .1]);

	       // Vertical
	       translate([chiMountWidth - chiBraceThickness,
			  chiMountDepth,
			  bracePos == "below" ? -chiBraceHeight : chiMountHeight - .1])
		    cube([chiBraceThickness, .1, chiBraceHeight + .1]);
	  }	  
     }
}

// Holes for Chimera Cold End Mount and Bowden tubes.
module chimera_mount_holes() {
     // Create the holes, which will be remove from the top plate. Could place screw holes in back plane too,
     // but only useful if mount is rotated 90 degrees in Z. This might be tested as it has advantages for fan placement.
     for(i = chiScrewLocs) {
	  // Create the screw hole and move it to the correct location.
	  translate([i[0], i[1], -.1])
	       cylinder(r=(chiScrewHole /2),h=chiScrewHoleHeight, $fn=100);

	  // Create an space for the screw head, used to clear space from the fan tab.
	  translate([i[0], i[1], chiMountHeight])
	       cylinder(r=3, h=5, 0, $fn=100);
     }
     
     for(i = chiBowdenLocs) {
	  // Create the screw hole and move it to the correct location.
	  translate([i[0], i[1], -.1])
	       cylinder(r=(chiBowdenHole /2),h=chiBowdenHoleHeight, $fn=100);
     }
}

// J Head style mount
module jhead_mount(carriageDepth) {
     difference() {
	  // Create the base block which the holes will be carved out of.
	  jhead_base();

	  jhead_holes(carriageDepth);
     }
}


module jhead_base() {
     // Create the base block which the holes will be carved out of.
     translate([0, (jHeadMountDepth / 2), 0])
	  cube([jHeadMountWidth, (jHeadMountDepth / 2) + heDepthOffset + .1, jHeadMountHeight]);
}

module jhead_collar(carriageDepth) {
     difference() {
	  hull() {
	       // Create the base collar which the holes will be carved out of.
	       translate([jHeadCollarCornerRadius, jHeadCollarCornerRadius, 0])
		    cylinder(r=jHeadCollarCornerRadius, h=jHeadMountHeight, $fn=100);

	       translate([jHeadMountWidth - jHeadCollarCornerRadius, jHeadCollarCornerRadius, 0])
		    cylinder(r=jHeadCollarCornerRadius, h=jHeadMountHeight, $fn=100);
	       
	       translate([0,(jHeadMountDepth / 4),0])
		    cube([jHeadMountWidth, (jHeadMountDepth / 4), jHeadMountHeight]);
	  }
	  
	  // Carve out the holes.
	  jhead_holes(carriageDepth);
     }
}
	  
module jhead_holes(carriageDepth) {
     // Carve out the holes for the mount.
     // Upper collar hole
     translate([(jHeadMountWidth / 2), (jHeadMountDepth / 2), jHeadMountHeight - jHeadUpperCollarHeight])
	  cylinder(d=jHeadUpperCollarDiameter, h=jHeadUpperCollarHeight + .1, $fn=100);

     // Inner collar hole.
     translate([(jHeadMountWidth / 2), (jHeadMountDepth / 2), jHeadMountHeight - jHeadUpperCollarHeight - jHeadInnerCollarHeight - .1])
	  cylinder(d=jHeadInnerCollarDiameter, h=jHeadInnerCollarHeight + .2, $fn=100);

     // Lower collar hole.
     translate([(jHeadMountWidth / 2),
		(jHeadMountDepth / 2),
		jHeadMountHeight - jHeadUpperCollarHeight - jHeadInnerCollarHeight - jHeadLowerCollarHeight - .1])
	  cylinder(d=jHeadLowerCollarDiameter, h=jHeadLowerCollarHeight + .1, $fn=100);
     

     // Left Mounting Screw
     translate([jHeadMountScrewHorizontalOffset,
		-.1,
		jHeadMountScrewVerticalOffset])
	  rotate([-90,0,0])
	  bolt_hole(jHeadMountBoltDiameter, jHeadMountDepth + heDepthOffset + carriageDepth - jHeadMountNutDepth, jHeadMountNutDiameter, jHeadMountNutDepth + .1);

     // Right Mount Screw
     translate([jHeadMountWidth - jHeadMountScrewHorizontalOffset,
		-.1,
		jHeadMountScrewVerticalOffset])
	  rotate([-90,0,0])
	  bolt_hole(jHeadMountBoltDiameter, jHeadMountDepth + heDepthOffset + carriageDepth - jHeadMountNutDepth, jHeadMountNutDiameter, jHeadMountNutDepth + .1);
		
}

// Fan tab items.
module bracket_fan_tab(bracketWidth, bracketDepth, bracketHeight, bracketScrewDiameter, screwDistance,
		       tabWidth, tabDepth, tabHeight, tabHole, tabHoleMat, screwOffset) {
     difference() {
	  union() {
	       // Create the bracket.
	       translate([-(bracketWidth / 2), (tabHole / 2) + tabHoleMat + tabDepth, - (bracketHeight / 2) + screwOffset])
	       cube([bracketWidth, bracketDepth, bracketHeight]);
	       
	       // Add the fan tab.
	       fan_tab(screwOffset, tabWidth, tabDepth + .1, tabHeight, tabHole, tabHoleMat);
	  }

	  // Carve out the holes for the fan tab.
	  fan_tab_holes(tabWidth, tabDepth, tabHeight, tabHole, tabHoleMat);

	  // Carve hole the mount holes.
	  translate([- (screwDistance / 2), (tabHole / 2) + tabHoleMat + tabDepth + bracketDepth + .1, screwOffset])
	       rotate([90,0,0])
	       cylinder(d=bracketScrewDiameter, h=bracketDepth + .2, $fn=100);

	  translate([(screwDistance / 2), (tabHole / 2) + tabHoleMat + tabDepth + bracketDepth + .1, screwOffset])
	       rotate([90,0,0])
	       cylinder(d=bracketScrewDiameter, h=bracketDepth + .2, $fn=100);
     }
}

module fan_tab(screwOffset, tabWidth, tabDepth, tabHeight, tabHole, tabHoleMat) {
     difference() {
	  fan_tab_base(screwOffset, tabWidth, tabDepth, tabHeight, tabHole, tabHoleMat);

	  fan_tab_holes(tabWidth, tabDepth, tabHeight, tabHole, tabHoleMat);
     }
}

module fan_tab_base(screwOffset, tabWidth, tabDepth, tabHeight, tabHole, tabHoleMat) {
     hull() {
	  // Recreate the tab so we can hull to it without hull the whole front and side of Hot End Mount
	  translate([-(tabWidth / 2), (tabHole / 2) + tabHoleMat, - (tabHeight / 2) + screwOffset])
	       cube([tabWidth, tabDepth +.1, tabHeight]);
	  
	  // Create the cylinder for the fan mount screw.
	  rotate([0,90,0])
	       translate([0, 0, -(tabWidth / 2)])
	       cylinder(r=(tabHole / 2) + tabHoleMat, h=tabWidth, $fn=100);
     }
}

module fan_tab_holes(tabWidth, tabDepth, tabHeight, tabHole, tabHoleMat) {
     // Create the cylinder for the fan mount screw.
     rotate([0,90,0])
	  translate([0, 0, -((tabWidth / 2) + .1)])
	  cylinder(d=tabHole, h=tabWidth + .2, $fn=100);
     
     // Carve out the sides of the screw nub.
     rotate([0,90,0])
	  translate([0, 0, - ((tabWidth / 2) + 10)])
	  cylinder(d=tabHole + (tabHoleMat * 2), h=10, $fn=100);
     
     rotate([0,90,0])
	  translate([0, 0, (tabWidth / 2)])
	  cylinder(d=tabHole + (tabHoleMat * 2), h=10, $fn=100);
}

// Servo probe extension
module servo_ext(servoBracketL) {
     // Create the extension for the z Probe Servo.
     hull() {
	  translate([ zProbeSide == "right" ?
		      servoBracketL[0] - xMountCornerRadius :
		      servoBracketL[0] + xMountCornerRadius,
		      0,xMountCornerRadius])
	       rotate([90,0,0])
	       cylinder(r=xMountCornerRadius, h=xMountDepth, $fn=100);
	  
	  translate([ zProbeSide == "right" ?
		      servoBracketL[0] - xMountCornerRadius :
		      servoBracketL[0] + xMountCornerRadius,
		      0,xMountHeight-xMountCornerRadius])
	       rotate([90,0,0])
	       cylinder(r=xMountCornerRadius, h=xMountDepth, $fn=100);
	  
	  translate([ zProbeSide == "right" ?
		      xMountWidth - probeExtWidth - .1 :
		      -probeExtWidth - .1,
		      -xMountDepth, 0])
	       cube([probeExtWidth + xMountCornerRadius + .1, xMountDepth, xMountHeight]);
     }
     
     // Create the servo bracket tabs.
     hull () {
	  // Bottom
	  translate([servoBracketL[0],
		     servoBracketL[1] + xMountDepth,
		     servoBracketL[2] + servoBracketBotScrewL[2]])
	       rotate([90,0,0])
	       cylinder(r=(servoBracketNutDiameter / 2) + servoBracketMat, h=xMountDepth, $fn=100);

	  // Top
	  translate([servoBracketL[0],
		     servoBracketL[1] + xMountDepth,
		     servoBracketL[2] + servoBracketTopScrewL[2]])
	       rotate([90,0,0])
	       cylinder(r=(servoBracketNutDiameter / 2) + servoBracketMat, h=xMountDepth, $fn=100);
     }
}

module servo_ext_holes(servoBracketL) {
     // Create the holes needed for the z probe extension.
     // Bottom
     translate(servoBracketL + servoBracketBotScrewL)
	  rotate([-90,0,0])
	  bolt_hole(servoBracketScrewDiameter, xMountDepth - servoBracketNutDepth, servoBracketNutDiameter, servoBracketNutDepth);

     // Top
     translate(servoBracketL + servoBracketTopScrewL)
	  rotate([-90,0,0])
	  bolt_hole(servoBracketScrewDiameter, xMountDepth - servoBracketNutDepth, servoBracketNutDiameter, servoBracketNutDepth);
}

// Fan Mount for Blower / Centrifugal Fan
module fan_mount(tabHole, tabHoleMat, tabWidth, tabClear, thickness, barWidth, mountOffset, centerOffset, fanScrewDiameter, fanScrewMat, fanScrews, intakeDiameter, fanDirection) {
     difference() {
	  union() {
	       // Create mount nub and connection to fan mount.
	       fan_mount_nub(tabHole, tabHoleMat, thickness, barWidth);
	       
	       // Spin up the base..
	       if(fanDirection == "right") {
		    fan_mount_base(tabHole, tabHoleMat, thickness, barWidth, mountOffset, fanScrewDiameter, fanScrewMat, fanScrews);
	       }
	       else {
		    translate([0,- (tabHole + (tabHoleMat * 2) + thickness),0])
			 rotate([0,0,180])
			 fan_mount_base(tabHole, tabHoleMat, thickness, barWidth, mountOffset, fanScrewDiameter, fanScrewMat, fanScrews);
	       }
	  }
	  // Remove the center of the nub.
	  fan_mount_nub_holes(tabHole, tabHoleMat, tabWidth, tabClear, barWidth);
	  
	  // Remove the holes and gaps.
	  if(fanDirection == "right") {
	       fan_mount_holes(tabHole, tabHoleMat, thickness, mountOffset, centerOffset, fanScrewDiameter, fanScrewMat, fanScrews, intakeDiameter);
	  }
	  else {
	       translate([0,- (tabHole + (tabHoleMat * 2) + thickness),0])
		    rotate([0,0,180])
		    fan_mount_holes(tabHole, tabHoleMat, thickness, mountOffset, centerOffset, fanScrewDiameter, fanScrewMat, fanScrews, intakeDiameter);
	  }
     }
}

module fan_mount_nub(tabHole, tabHoleMat, thickness, barWidth) {
     // Create the cylinder and cube that we hull with so have something to have the mount off of.
     hull() {
	  // Create the nub cylinder.
	  rotate([0,90,0])
	       cylinder(r=(tabHole / 2) + tabHoleMat, h=barWidth, center=true, $fn=100);
	  
	  // This is what we will hull to, to merge the nubs to the rest of the fan mount.
	  translate([0,
		     -((tabHole / 2) + tabHoleMat + (thickness / 2)),
		     0])
	       cube([barWidth,thickness,tabHole + (tabHoleMat * 2)], center=true);
     }
}
    
module fan_mount_base(tabHole, tabHoleMat, thickness, barWidth, mountOffset, fanScrewDiameter, fanScrewMat, fanScrews) {
     hull() {
	  translate([0,
		     -((tabHole / 2) + tabHoleMat + (thickness / 2)),
		     0])
	       cube([barWidth,thickness,tabHole + (tabHoleMat * 2)], center=true);

	  // Create the fan mount.
	  fan_screw_hole_single(tabHole,
				tabHoleMat,
				fanScrewDiameter + fanScrewMat,
				thickness,
				thickness,
				fanScrews[0][0] + .1 + mountOffset[0],
				mountOffset[1],
				fanScrews[0][1] + mountOffset[2]);
	  fan_screw_hole_single(tabHole,
				tabHoleMat,
				fanScrewDiameter + fanScrewMat,
				thickness,
				thickness,
				- abs(fanScrews[1][0] + .1) + mountOffset[0],
				mountOffset[1],
				fanScrews[1][1] + mountOffset[2]);
	  fan_screw_hole_single(tabHole,
				tabHoleMat,
				fanScrewDiameter + fanScrewMat,
				thickness,
				thickness,
				- abs(fanScrews[2][0] + .1) + mountOffset[0],
				mountOffset[1],
				- abs(fanScrews[2][1]) + mountOffset[2]);
     }
}

module fan_mount_nub_holes(tabHole, tabHoleMat, tabWidth, tabClear, barWidth) {
     // Remove the fan tab to create the separate nubs.
     rotate([0,90,0])
	  cylinder(r=(tabHole / 2) + tabHoleMat + tabClear, h=tabWidth + (tabClear * 2), center=true, $fn=100);

     // Carve out the screw / bolt hole.
     rotate([0,90,0])
	  cylinder(d=tabHole, h=(barWidth + .2), center=true, $fn=100);
}

module fan_mount_holes(tabHole, tabHoleMat, thickness, mountOffset, centerOffset, fanScrewDiameter, fanScrewMat, fanScrews, intakeDiameter) {
     // Carve out the fan mounting holes
     fan_screw_hole_single(tabHole,
			   tabHoleMat,
			   fanScrewDiameter,
			   thickness,
			   thickness + .2,
			   fanScrews[0][0] + .1 + mountOffset[0],
			   mountOffset[1],
			   fanScrews[0][1] + mountOffset[2]);
     fan_screw_hole_single(tabHole,
			   tabHoleMat,
			   fanScrewDiameter,
			   thickness,
			   thickness + .2,
			   - abs(fanScrews[1][0] + .1) + mountOffset[0],
			   mountOffset[1],
			   fanScrews[1][1] + mountOffset[2]);
     fan_screw_hole_single(tabHole,
			   tabHoleMat,
			   fanScrewDiameter,
			   thickness,
			   thickness + .2,
			   - abs(fanScrews[2][0] + .1) + mountOffset[0],
			   mountOffset[1],
			   - abs(fanScrews[2][1]) + mountOffset[2]);

     // Cut out opening for air intake. Leave legs for securing mount to fan tab.
     translate([centerOffset[0] + mountOffset[0],
		-((tabHole / 2) + tabHoleMat) + centerOffset[1] + mountOffset[1] +.1,
		centerOffset[2] + mountOffset[2]])
	  difference() {
	  rotate([90,0,0])
	       rotate_extrude($fn=200) {
	       translate([9,0,0])
		    difference() {
		    square([(intakeDiameter / 2), thickness + .2]);
		    
		    translate([-2,2,0])
			 circle(r=3);
		    
		    translate([(intakeDiameter / 2) + 2,2,0])
			 circle(r=3);
	       }
	  }

	  // Need to move the legs back, otherwise they end up twice as far as they should be
	  // fan_screw_hole_single moves them as well as the translate above.
	  translate([0, (tabHole / 2) + tabHoleMat, 0]) {
	       hull() {
		    fan_screw_hole_single(tabHole,
					  tabHoleMat,
					  fanScrewDiameter + fanScrewMat,
					  thickness,
					  thickness + .2,
					  0,
					  -.1,
					  0);
		    fan_screw_hole_single(tabHole,
					  tabHoleMat,
					  fanScrewDiameter + fanScrewMat,
					  thickness,
					  thickness + .2,
					  fanScrews[0][0] + mountOffset[0],
					  mountOffset[1],
					  fanScrews[0][1] + mountOffset[2]);
	       }
	       hull() {
		    fan_screw_hole_single(tabHole,
					  tabHoleMat,
					  fanScrewDiameter + fanScrewMat,
					  thickness,
					  thickness + .2,
					  0,
					  -.1,
					  0);
		    fan_screw_hole_single(tabHole,
					  tabHoleMat,
					  fanScrewDiameter + fanScrewMat,
					  thickness,
					  thickness + .2,
					  - abs(fanScrews[1][0]) + mountOffset[0],
					  mountOffset[1],
					  fanScrews[1][1] + mountOffset[2]);
	       }
	       hull() {
		    fan_screw_hole_single(tabHole,
					  tabHoleMat,
					  fanScrewDiameter + fanScrewMat,
					  thickness,
					  thickness + .2,
					  0,
					  -.1,
					  0);
		    fan_screw_hole_single(tabHole,
					  tabHoleMat,
					  fanScrewDiameter + fanScrewMat,
					  thickness,
					  thickness + .2,
					  - abs(fanScrews[2][0]) + mountOffset[0],
					  mountOffset[1],
					  - abs(fanScrews[2][1]) + mountOffset[2]);
	       }
	  }
     }
}

module fan_screw_hole_single(tabHole, tabHoleMat, diameter, thickness, height, x, y, z) {
     rotate([90,0,0])
	  translate([x,
		     z,
		     (tabHole / 2) + tabHoleMat + (thickness / 2) + y])
	  cylinder(d=diameter,h=height,$fn=100,center=true);
}

// Fan Duct
module fan_duct(ductConnectL, fanScrewL, heAnchorL, tabHorizontalAngle, tabVerticalAngle, fanDirection, reverseY=false) {
     // Simple fan duct to get something working for now.
     // Create the connection to the fan.
echo("fanDirection:",fanDirection);
echo("reverseY",reverseY);
     translate([-fanDuctThickness, -fanDuctThickness, 0])
	  difference() {
	  cube([fanDuctConnectSize[0] + (fanDuctThickness * 2),
		fanDuctConnectSize[1] + (fanDuctThickness * 2),
		fanDuctOutsideOverlap]);

	  hull() {
	       translate([-.1,
			  -.1,
			  ((fanDirection == "left" && reverseY == true) || (fanDirection == "right" && reverseY == false)) ? fanDuctOverlap
			      : fanDuctOutsideOverlap])
		    cube([.1, fanDuctConnectSize[1] + (fanDuctThickness * 2) + .2,
			  ((fanDirection == "left" && reverseY == true) || (fanDirection == "right" && reverseY == false)) ? fanDuctOutsideOverlap
			  : fanDuctOverlap]);
	       
	       translate([(fanDuctConnectSize[0] + (fanDuctThickness * 2)),
			  -.1,
			  ((fanDirection == "left" && reverseY == true) || (fanDirection == "right" && reverseY == false)) ? fanDuctOutsideOverlap
			  : fanDuctOverlap])
		    cube([.1, fanDuctConnectSize[1] + (fanDuctThickness * 2) + .2,
			  ((fanDirection == "left" && reverseY == true) || (fanDirection == "right" && reverseY == false)) ? fanDuctOverlap
			  : fanDuctOutsideOverlap]);
	  }
     }
     
     hull() {
	  // Recreate the body of the fan shroud so we can hull to it.
	  translate([-fanDuctThickness, -fanDuctThickness, 0])
	       cube([fanDuctConnectSize[0] + (fanDuctThickness * 2),
		     fanDuctConnectSize[1] + (fanDuctThickness * 2),
		     .1]);

	  // Round out the bottom a bit
	  translate([-fanDuctThickness,
		     fanDuctConnectRadius,
		     - (fanDuctBowlDepth - fanDuctConnectRadius) - fanDuctConnectRadius - fanDuctThickness])
	       difference() {
	       rotate([0,90,0])
		    cylinder(r=(fanDuctConnectRadius + fanDuctThickness), h=fanDuctConnectSize[0] + (fanDuctThickness * 2),$fn=100);
		    
		    translate([- .1, - (fanDuctConnectRadius + 2.5), 0])
		    cube([fanDuctConnectSize[0] + (fanDuctThickness * 2) + .2, (fanDuctConnectRadius * 2) + 5, fanDuctConnectRadius + fanDuctThickness + 5]);
	  }

	  // Create the outlets.
	  fan_duct_nozzle(ductConnectL, fanScrewL, heAnchorL, tabHorizontalAngle, tabVerticalAngle, fanDuctThickness, false, reverseY);
     }
}

module fan_duct_holes(ductConnectL, fanScrewL, heAnchorL, tabHorizontalAngle, tabVerticalAngle, fanDirection, reverseY=false) {
     // Carve out the inside part of connection to the fan.
     translate([0, 0, -.1])
	  cube([fanDuctConnectSize[0],
		fanDuctConnectSize[1],
		fanDuctOutsideOverlap + .2]);
     hull() {
	  // Recreate the body of the fan shroud so we can hull to it.
	  translate([0,0, -.1])
	       cube([fanDuctConnectSize[0],
		     fanDuctConnectSize[1],
		     .2]);

	  // Round out the bottom a bit
	  translate([0,
		     fanDuctConnectRadius,
		     - (fanDuctBowlDepth - fanDuctConnectRadius) - fanDuctConnectRadius])
	       difference() {
	       rotate([0,90,0])
		    cylinder(r=fanDuctConnectRadius, h=fanDuctConnectSize[0],$fn=100);
	       
	       translate([- .1, - (fanDuctConnectRadius + 2.5), 0])
		    cube([fanDuctConnectSize[0] + .2, (fanDuctConnectRadius * 2) + 5, fanDuctConnectRadius + 5]);
	  }
	  
	  // Create the outlets.
	  fan_duct_nozzle(ductConnectL, fanScrewL, heAnchorL, tabHorizontalAngle, tabVerticalAngle, 0, true, reverseY);
     }
}

module fan_duct_nozzle(ductConnectL, fanScrewL, heAnchorL, tabHorizontalAngle, tabVerticalAngle, wallThickness, interior=false, reverseY=false) {
     // Loop through the nozzles, create duct for each one.
     for(a=[0: 1: len(heNozzleL) - 1]) {
	  // Start the process of placing the nozzles in the correct place. Split up to keep things simpler to understand for now.
	  echo("ductConnectL", ductConnectL);
	  echo("heAnchorL", heAnchorL);
	  echo("fanDuctOutletNozzleOffsetL", fanDuctOutletNozzleOffsetL);
	  echo("reverseY", reverseY);
	  echo("heNozzleL",heNozzleL[a]);
	  echo("heNozzleL", heNozzleL);
	  translate(-ductConnectL)
	       rotate([-tabHorizontalAngle,0,0])
	       rotate([0,0,-tabVerticalAngle])
	       translate(-fanScrewL)
	       translate(heAnchorL)
	       translate(heNozzleL[a])
	       translate([0,0,3]) {
	       translate([fanDuctOutletNozzleOffsetL[0],
			 reverseY == false ? fanDuctOutletNozzleOffsetL[1] : - fanDuctOutletNozzleOffsetL[1],
			 fanDuctOutletNozzleOffsetL[2] - (fanDuctOutletSize[2]) ]) { // Offset from the nozzle where the outlet should be.
	       // Rotate the duct outlets to point to the correct spot.
	       rotate(reverseY == false ? fanDuctOutletAngle : - fanDuctOutletAngle)
		    cube([fanDuctOutletSize[0] + (wallThickness * 2),
			  fanDuctOutletSize[1] + (interior ? .1 : 0),
			  fanDuctOutletSize[2] + (wallThickness * 2)], center=true);
	       }
	  }
     }
}

// Servo Bracket
module servo_bracket(cbot=false) {
     // Check if we are building bracket for prusa i3 or cbot.
     if(cbot == true) {
	  // Build bracket for cbot.
	  union() {
	       // Create the top and bottom mounting holes.
	       hull () {
		    // Bottom
		    translate(servoBracketBotScrewL)			       
			 rotate([90,0,0])
			 cylinder(r=(cBotBeltScrewDiameter / 2) + servoBracketMat, h=servoBracketBaseDepth, $fn=100);
		    
		    // Top
		    translate(servoBracketTopScrewL)			       
			 rotate([90,0,0])
			 cylinder(r=(cBotBeltScrewDiameter / 2) + servoBracketMat, h=servoBracketBaseDepth, $fn=100);

		    // Connection to servo bracket.
		    translate([servoMountL[0],
			       0,
			       servoMountL[2]])
			 cube([(servoBracketMat * 2) + servoBracketScrewDiameter,
			       servoBracketBaseDepth,
			       servoMountPlateHeight]);
	       }
	       
	       // Create the servo enclosure.
	       rotate([0,0,180])
		    translate(servoMountL)
		    servo_mount();
	  }
     }
     else {
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
	  }

	  // Create the servo enclosure.
	  translate(servoMountL)
	       servo_mount();
     }
}

module servo_bracket_holes(cbot=false) {
     // Check if we are building a bracket for prusa i3 or cbot.
     if(cbot == true) {
	  // Carve out holes for cbot.
	  // Bottom
	  translate([servoBracketBotScrewL[0],
		     servoBracketBotScrewL[1] + .1,
		     servoBracketBotScrewL[2]])			       
	       rotate([90,0,0])
	       cylinder(d=cBotBeltScrewDiameter, h=servoBracketBaseDepth + .2, $fn=100);
	  
	  // Top
	  translate([servoBracketTopScrewL[0],
		     servoBracketTopScrewL[1] + .1,
		     servoBracketTopScrewL[2]])
	       rotate([90,0,0])
	       cylinder(d=cBotBeltScrewDiameter, h=servoBracketBaseDepth + .2, $fn=100);
	  
	  // Carve out the holes for the servo mount.
	  rotate([0,0,180])
	  translate([servoMountL[0],
		     servoMountL[1] + (servoBracketMat + (servoWidth / 2)),
		     servoMountL[2]])
	       servo_mount_holes();

     }
     else {
	  // Create the holes needed for the bracket mount and servo.
	  // Bottom
	  translate([servoBracketBotScrewL[0],
		     servoBracketBotScrewL[1] +.1,
		     servoBracketBotScrewL[2]])
	       rotate([90,0,0])
	       cylinder(d=servoBracketScrewDiameter, h=servoBracketBaseDepth + .2, $fn=100);
	  
	  // Top
	  translate([servoBracketTopScrewL[0],
		     servoBracketTopScrewL[1] +.1,
		     servoBracketTopScrewL[2]])
	       rotate([90,0,0])
	       cylinder(d=servoBracketScrewDiameter, h=servoBracketBaseDepth + .2, $fn=100);
	  
	  // Carve out the holes for the servo mount.
	  translate([servoMountL[0],
		     servoMountL[1] + (servoBracketMat + (servoWidth / 2)),
		     servoMountL[2]])
	       servo_mount_holes();

     }
}

module servo_mount() {
     // Spin up a cube that we will punch a hole in for servo later.
     cube([(servoBracketMat * 2) + servoBracketScrewDiameter,
	   (servoBracketMat * 2) + servoWidth + .1 + (carriage == "cbot" ? servoBracketOffset : 0),
	   servoMountPlateHeight]);
}


module servo_mount_holes(cbot=false) {
     // Servo hole
     translate([-.1,
		- (servoWidth / 2),
		(servoMountPlateHeight / 2) - (servoHeight / 2)])
	  cube([(servoBracketMat * 2) + servoBracketScrewDiameter + .2,
		servoWidth,
		servoHeight]);
     
     // Servo Screw Holes
     // Bottom
     translate([-.1,
		0,
		(servoMountPlateHeight / 2) - (servoScrewDistance / 2)])
	  rotate([-90,0,-90])
	  cylinder(d=servoScrewDiameter,h=((servoBracketMat * 2) + servoBracketScrewDiameter + .2), $fn=100);
     
     // Top
     translate([-.1,
		0,
		(servoMountPlateHeight / 2) + (servoScrewDistance / 2)])
	  rotate([-90,0,-90])
	  cylinder(d=servoScrewDiameter,h=((servoBracketMat * 2) + servoBracketScrewDiameter + .2), $fn=100);
}

// Z Probe Arm
module z_probe_arm(zpl) {
     // Create a couple of cylinders, hull them together to create the servo arm.
     hull() {
	  // Create the top of the Z Probe Arm
	  translate([-(zProbeThickness / 2),0,0])
	       rotate([0,90,0])
	       cylinder(r=(servoHatTopDiameter / 2) + zProbeArmMat, h=zProbeThickness, $fn=100);
	  
	  // Create the bottom of the Z Probe Arm
	  translate([-(zProbeThickness / 2),0,zpl])
	       rotate([0,90,0])
	       cylinder(r=(servoHatTopDiameter / 2) + zProbeArmMat, h=zProbeThickness, $fn=100);
     }

     // Create the switch mount.
     hull() {
	  // Recreate the bottom of the Z Probe Arm so we can hull to it.
	  translate([-(zProbeThickness / 2),0,zpl])
	       rotate([0,90,0])
	       cylinder(r=(servoHatTopDiameter / 2) + zProbeArmMat, h=zProbeThickness, $fn=100);

	  // Create the cylinders for the switch mount.
	  for(b=[0:1]) {
	       translate([-(zProbeThickness / 2),
			  b==0 ? -(zProbeScrewDistance / 2) :
			  (zProbeScrewDistance / 2),
			  zpl - (servoHatTopDiameter / 2)])
		    rotate([0,90,0])
		    cylinder(r=(zProbeScrewDiameter / 2) + zProbeArmMat, h=zProbeThickness, $fn=100);
	  }
     }	       
}

module z_probe_arm_holes(zpl) {
     // Create the servo shaft whole.
     translate([- (zProbeThickness / 2) - .1,0,0])
	  rotate([0,90,0])
	  cylinder(r=(servoShaftDiameter / 2), h=zProbeThickness + .2, $fn=100);
     
     // Create the servo hat recess.
     hull() {
	  // Create the servo hat recess, top first.
	  translate([((zProbeSide == "right" && carriage == "prusai3") ||
		      (zProbeSide == "left" && carriage == "cbot")) ?
		     - servoHatRecessDepth - .1 :
		     (zProbeThickness / 2) - servoHatRecessDepth,
		     0,
		     0])
	       rotate([0,90,0])
	       cylinder(r=(servoHatTopDiameter / 2), h=servoHatRecessDepth + .1, $fn=100);
	  
	  // Create the bottom of servo hat recess.
	  translate([((zProbeSide == "right" && carriage == "prusai3") ||
		      (zProbeSide == "left" && carriage == "cbot")) ?
		     - servoHatRecessDepth - .1 :
		     (zProbeThickness / 2) - servoHatRecessDepth,
		     0
		     ,- (servoHatLength - (servoHatTopDiameter / 2) - (servoHatTipDiameter / 2))])
	       rotate([0,90,0])
	       cylinder(r=(servoHatTipDiameter / 2), h=servoHatRecessDepth + .1, $fn=100);
     }

     // Create the holes that mount the switch.
     // Create the cylinders for the switch mount.
     for(b=[0:1]) {
	  translate([-(zProbeThickness / 2) - .1,
		     b==0 ? -(zProbeScrewDistance / 2) :
		     (zProbeScrewDistance / 2),
		     zpl - (servoHatTopDiameter / 2)])
	       rotate([0,90,0])
	       cylinder(r=(zProbeScrewDiameter / 2), h=zProbeThickness + .2, $fn=100);
     }
}

// Inductive / Capacitive extension
module induct_ext() {
     // Create the extension for the inductive / capacitive sensor.
     hull() {
	  // Bottom corner of X Carriage back plane.
	  translate([ zProbeSide == "right" ?
		      xMountWidth - xMountCornerRadius
		      : xMountCornerRadius,
		      0,xMountCornerRadius])
	       rotate([90,0,0])
	       cylinder(r=xMountCornerRadius, h=xMountDepth, $fn=100);

	  // Top corner of X Carriage back plane.
	  translate([ zProbeSide == "right" ?
		      xMountWidth - xMountCornerRadius
		      : xMountCornerRadius,
		      0,xMountHeight - xMountCornerRadius])
	       rotate([90,0,0])
	       cylinder(r=xMountCornerRadius, h=xMountDepth, $fn=100);

	  // Induct mount top outside corner.
	  translate([ zProbeSide == "right" ?
		      heMountL[0] + heMountWidth + inductMountDistance + inductMountWidth - (inductBraceWidth / 2):
		      heMountL[0] - (inductMountDistance + inductMountWidth - (inductBraceWidth / 2)),
		      0,
		      heAnchorL[2] + heNozzleL[0][2] + inductHeight + inductMountThickness + inductBraceHeight - (inductBraceWidth / 2)])
	       rotate([90,0,0])
	       cylinder(d=inductBraceWidth, h=xMountDepth, $fn=100);

	  // Induct mount top inside corner.
	  translate([ zProbeSide == "right" ?
		      heMountL[0] + heMountWidth + inductMountDistance + (inductBraceWidth / 2):
		      heMountL[0] - inductMountDistance - (inductBraceWidth / 2),
		      0,
		      heAnchorL[2] + heNozzleL[0][2] + inductHeight + inductMountThickness + inductBraceHeight - (inductBraceWidth / 2)])
	       rotate([90,0,0])
	       cylinder(d=inductBraceWidth, h=xMountDepth, $fn=100);

	  // Induct mount bottom outside corner.
	  translate([ zProbeSide == "right" ?
		      heMountL[0] + heMountWidth + inductMountDistance + inductMountWidth - (inductBraceWidth / 2):
		      heMountL[0] - (inductMountDistance + inductMountWidth - (inductBraceWidth / 2)),
		      0,
		      heAnchorL[2] + heNozzleL[0][2] + inductHeight + (inductBraceWidth / 2)])
	       rotate([90,0,0])
	       cylinder(d=inductBraceWidth, h=xMountDepth, $fn=100);

	  // Induct mount bottom inside corner.
	  translate([ zProbeSide == "right" ?
		      heMountL[0] + heMountWidth + inductMountDistance + (inductBraceWidth / 2):
		      heMountL[0] - inductMountDistance - (inductBraceWidth / 2),
		      0,
		      heAnchorL[2] + heNozzleL[0][2] + inductHeight + (inductBraceWidth / 2)])
	       rotate([90,0,0])
	       cylinder(d=inductBraceWidth, h=xMountDepth, $fn=100);
     }
}

module induct_mount(bracket=0,carriageDepth,cbot=false) {
     hull() {
	  // Induct mount top outside corner.
	  translate([ inductMountWidth - (inductBraceWidth / 2),
		      -(bracket == 0 ? 0 : inductBracketDepth),
		      cbot == true ? -(heAnchorL[2] + heNozzleL[0][2] + inductHeight) + (cBotAccessoryMountPos * 2) + (inductBraceWidth / 2) :
		      inductMountThickness + inductBraceHeight - (inductBraceWidth / 2)])
	       rotate([-90,0,0])
	       cylinder(d=inductBraceWidth, h=(bracket == 0 ? carriageDepth : inductBracketDepth), $fn=100);
	  
	  // Induct mount top inside corner.
	  translate([ (inductBraceWidth / 2),
		      -(bracket == 0 ? 0 : inductBracketDepth),
		      cbot == true ? -(heAnchorL[2] + heNozzleL[0][2] + inductHeight) + (cBotAccessoryMountPos * 2) + (inductBraceWidth / 2) :
		      inductMountThickness + inductBraceHeight - (inductBraceWidth / 2)])
	       rotate([-90,0,0])
	       cylinder(d=inductBraceWidth, h=(bracket == 0 ? carriageDepth : inductBracketDepth), $fn=100);
	  
	  // Induct bracket bottom outside corner.
	  translate([ inductMountWidth - (inductBraceWidth / 2),
		      -(bracket == 0 ? 0 : inductBracketDepth),
		      (inductMountThickness / 2)])
	       rotate([-90,0,0])
	       cylinder(d=inductMountThickness, h=(bracket == 0 ? carriageDepth : inductBracketDepth), $fn=100);
	  
	  // Induct bracket bottom inside corner.
	  translate([ (inductBraceWidth / 2),
		      -(bracket == 0 ? 0 : inductBracketDepth),
		      (inductMountThickness / 2)])
	       rotate([-90,0,0])
	       cylinder(d=inductMountThickness, h=(bracket == 0 ? carriageDepth : inductBracketDepth), $fn=100);
     }
     
     // Create mounting plate
     // This will stick out a bit further than expected to accomodate the desire to have inductMat flat around the induct sensor and still have round corner.
     // Induct mount bottom outside corner.
     hull() {
	  hull() {
	       translate([ inductMountWidth - (inductBraceWidth / 2),
			   -(bracket == 0 ? 0 : inductBracketDepth) - (inductDiameter + (inductMat * 2) + inductOffset),
			   (inductMountThickness / 2)])
		    sphere(d=inductMountThickness, $fn=100);
	       
	       translate([ inductMountWidth - (inductBraceWidth / 2),
			   -(bracket == 0 ? 0 : inductBracketDepth),
			   (inductMountThickness / 2)])
		    rotate([-90,0,0])
		    cylinder(d=inductMountThickness, h=(bracket == 0 ? carriageDepth : inductBracketDepth), $fn=100);
	  }
	  
	  // Induct mount bottom inside corner.
	  hull() {
	       translate([ (inductBraceWidth / 2),
			   -(bracket == 0 ? 0 : inductBracketDepth) - (inductDiameter + (inductMat * 2) + inductOffset),
			   (inductMountThickness / 2)])
		    sphere(d=inductMountThickness, $fn=100);
	       
	       translate([ (inductBraceWidth / 2),
			   -(bracket == 0 ? 0 : inductBracketDepth),
			   (inductMountThickness / 2)])
		    rotate([-90,0,0])
		    cylinder(d=inductMountThickness, h=(bracket == 0 ? carriageDepth : inductBracketDepth), $fn=100);
	  }
     }
     
     // Create braces
     // This will stick out a bit further than expected to accomodate the desire to have inductMat flat around the induct sensor and still have round corner.
     hull() {
	  // Induct mount top outside corner.
	  translate([ inductMountWidth - (inductBraceWidth / 2),
		      -(bracket == 0 ? 0 : inductBracketDepth),
		      inductMountThickness + inductBraceHeight - (inductBraceWidth / 2)])
	       rotate([-90,0,0])
	       sphere(d=inductBraceWidth, $fn=100);
	  
	  // Induct mount bottom outside corner.
	  hull() {
	       translate([ inductMountWidth - (inductBraceWidth / 2),
			   -(bracket == 0 ? 0 : inductBracketDepth) - (inductDiameter + (inductMat * 2) + inductOffset),
			   (inductBraceWidth / 2)])
		    sphere(d=inductBraceWidth, $fn=100);
	       
	       translate([ inductMountWidth - (inductBraceWidth / 2),
				-(bracket == 0 ? 0 : inductBracketDepth),
			   (inductBraceWidth / 2)])
		    rotate([-90,0,0])
		    cylinder(d=inductBraceWidth, h=(bracket == 0 ? carriageDepth : inductBracketDepth), $fn=100);
	  }
     }
     
     // Induct mount top inside corner.
     hull() {
	  translate([ (inductBraceWidth / 2),
		      -(bracket == 0 ? 0 : inductBracketDepth),
		      inductMountThickness + inductBraceHeight - (inductBraceWidth / 2)])
	       rotate([-90,0,0])
	       sphere(d=inductBraceWidth, $fn=100);
	  
	  // Induct mount bottom inside corner.
	  hull() {
	       translate([ (inductBraceWidth / 2),
			   -(bracket == 0 ? 0 : inductBracketDepth) - (inductDiameter + (inductMat * 2) + inductOffset),
			   (inductBraceWidth / 2)])
		    sphere(d=inductBraceWidth, $fn=100);
	       
	       translate([ (inductBraceWidth / 2),
			   -(bracket == 0 ? 0 : inductBracketDepth),
			   (inductBraceWidth / 2)])
		    rotate([-90,0,0])
		    cylinder(d=inductBraceWidth, h=(bracket == 0 ? carriageDepth : inductBracketDepth), $fn=100);
	  }
     }
}

module induct_ext_holes(bracket=0,carriageDepth) {
     // Create the holes needed for the z probe extension.
     // First create the mounting holes if needed.
     if (bracket == 1) {
	  // Create the mounting screw holes in the bracket and X Carriage back plane.
	  translate([(inductMountWidth / 2),
		     0,
		     inductMountThickness + (inductBracketScrewDiameter * 1.5)])
	       rotate([-90,0,0])
	       bolt_hole(inductBracketScrewDiameter, carriageDepth - inductBracketNutDepth, inductBracketNutDiameter, inductBracketNutDepth);
	  
	  translate([(inductMountWidth / 2),
		     0,
		     inductMountThickness + inductBraceHeight - (inductBracketScrewDiameter * 1.5)])
	       rotate([-90,0,0])
	       bolt_hole(inductBracketScrewDiameter, carriageDepth - inductBracketNutDepth, inductBracketNutDiameter, inductBracketNutDepth);
     }
}

module induct_mount_holes(bracket=0,cbot=false) {
     // Create the holes needed for the z probe extension.
     // First create the mounting holes if needed.
     if (bracket == 1) {
	  // Create the mounting screw holes in the bracket and X Carriage back plane.
	  translate([(inductMountWidth / 2),
		     - (inductBracketDepth + .1),
		     cbot == true ? -(heAnchorL[2] + heNozzleL[0][2] + inductHeight) + cBotAccessoryMountPos :
		     inductMountThickness + (inductBracketScrewDiameter * 1.5)])
	       rotate([-90,0,0])
	       cylinder(d=(cbot == true ? cBotBeltScrewDiameter : inductBracketScrewDiameter), h=inductBracketDepth + .2, $fn=100);
	  
	  translate([(inductMountWidth / 2),
		     - (inductBracketDepth + .1),
		     cbot == true ? -(heAnchorL[2] + heNozzleL[0][2] + inductHeight) + (cBotAccessoryMountPos * 2) :
		     inductMountThickness + inductBraceHeight - (inductBracketScrewDiameter * 1.5)])
	       rotate([-90,0,0])
	       cylinder(d=(cbot == true ? cBotBeltScrewDiameter : inductBracketScrewDiameter), h=inductBracketDepth + .2, $fn=100);
     }
     
     // Carve out the whole for the inductive sensor itself.
     translate([(inductMountWidth / 2),
		- (bracket == 0 ? 0 : inductBracketDepth) - (inductOffset + (inductDiameter / 2) + inductMat),
		- .1])
	  cylinder(d=inductDiameter, h=inductMountThickness + .2, $fn=100);
}

// Cable tie hole creator.
module cable_tie(height, width, radius) {
     rotate_extrude()
	  translate([radius, 0, 0])
	  square([width, height]);
}

// Functions to return position variables.
// Fan Duct starting location, left fan orientation in first vector, right in second. This is offset from prusai3FanScrewL. Does NOT take angles into account.
function fan_duct_connect(tabScrewL, horizontalAngle, verticalAngle, dimensions, centerOffset, mountOffset, mountThickness, tabHole, tabHoleMat, ductConnectSize, reverseY=false)
= [[- (dimensions[0] * .25) - (ductConnectSize[0] / 2) - fanDuctThickness - centerOffset[0] - mountOffset[0],
    reverseY == false ? - ((tabHole / 2) + tabHoleMat + dimensions[1] + centerOffset[1] + mountOffset[1] + mountThickness) :
			   ((tabHole / 2) + tabHoleMat + centerOffset[1] + mountOffset[1] + mountThickness),
    - (dimensions[2] / 2) + centerOffset[2] + mountOffset[2]],
   [(dimensions[0] * .25) - (ductConnectSize[0] / 2) + fanDuctThickness + centerOffset[0] + mountOffset[0],
    reverseY == false ? - ((tabHole / 2) + tabHoleMat + dimensions[1] + centerOffset[1] + mountOffset[1] + mountThickness) :
			   ((tabHole / 2) + tabHoleMat + centerOffset[1] + mountOffset[1] + mountThickness),
    - (dimensions[2] / 2) + centerOffset[2] + mountOffset[2]]];
     
// C Bot modules
module cbot_carriage_side(heSide=false) {
echo("heSide", heSide);
     // Create the base, then remove the holes.
     difference() {
	  cbot_carriage_base(heSide);

	  cbot_carriage_holes(heSide);
     }
}

module cbot_carriage_base(heSide=false) {
     // Base C Bot XY Carriage side.
     translate([cBotCarriageCornerRadius, 0, cBotCarriageCornerRadius])
	  hull() {
	  // Create the top left corner.
	  translate([0, 0, cBotCarriageHeight - (cBotCarriageCornerRadius * 2)])
	       rotate([90,0,0])
	       cylinder(r=cBotCarriageCornerRadius, h=cBotCarriageDepth, $fn=100);

	  // Create the top right Corner
	  translate([cBotCarriageWidth - (cBotCarriageCornerRadius * 2), 0, cBotCarriageHeight - (cBotCarriageCornerRadius * 2)])
	       rotate([90,0,0])
	       cylinder(r=cBotCarriageCornerRadius, h=cBotCarriageDepth, $fn=100);

	  // Create the bottom left corner.
	  rotate([90,0,0])
	       cylinder(r=cBotCarriageCornerRadius, h=cBotCarriageDepth, $fn=100);
		
	  // Create the bottom right corner
	  translate([cBotCarriageWidth - (cBotCarriageCornerRadius * 2), 0, 0])
	       rotate([90,0,0])
	       cylinder(r=cBotCarriageCornerRadius, h=cBotCarriageDepth, $fn=100);
     }

     // Create angle portion of top left corner.
     translate([cBotCarriageCornerRadius, 0, cBotCarriageHeight - cBotCarriageCornerRadius])
	  difference() {
	  hull() {
	       rotate([90,0,0])
		    cylinder(r=cBotCarriageCornerRadius, h=cBotTopHoleDepth, $fn=100);
	       
	       translate([0, 0, -cBotTopHoleLength])
		    rotate([90,0,0])
		    cylinder(r=cBotCarriageCornerRadius, h=cBotTopHoleDepth, $fn=100);
	  }
	       
	  hull() {
	       translate([-cBotCarriageCornerRadius, -cBotTopHoleDepth - (cBotTopHoleDepth - cBotCarriageDepth) - .1, cBotCarriageCornerRadius])
		    cube([(cBotCarriageCornerRadius * 2) + .2, (cBotTopHoleDepth - cBotCarriageDepth) + .1, .1]);
		    
	       translate([-cBotCarriageCornerRadius, -cBotCarriageDepth - (cBotTopHoleDepth - cBotCarriageDepth) - .1, -cBotCarriageCornerRadius - cBotTopHoleLength])
		    cube([(cBotCarriageCornerRadius * 2) + .2, (cBotTopHoleDepth - cBotCarriageDepth) + .1, .1]);
	  }
     }
     
     // Create angle portion of top right corner
     translate([cBotCarriageWidth - cBotCarriageCornerRadius, 0, cBotCarriageHeight - cBotCarriageCornerRadius])
	  difference() {
	  hull() {
	       rotate([90,0,0])
		    cylinder(r=cBotCarriageCornerRadius, h=cBotTopHoleDepth, $fn=100);
		    
	       translate([0, 0, -cBotTopHoleLength])
		    rotate([90,0,0])
		    cylinder(r=cBotCarriageCornerRadius, h=cBotTopHoleDepth, $fn=100);
	  }

	  hull() {
	       translate([-cBotCarriageCornerRadius, -cBotTopHoleDepth - (cBotTopHoleDepth - cBotCarriageDepth) - .1, cBotCarriageCornerRadius])
		    cube([(cBotCarriageCornerRadius * 2) + .2, (cBotTopHoleDepth - cBotCarriageDepth) + .1, .1]);
		    
	       translate([-cBotCarriageCornerRadius, -cBotCarriageDepth - (cBotTopHoleDepth - cBotCarriageDepth) - .1, -cBotCarriageCornerRadius - cBotTopHoleLength])
		    cube([(cBotCarriageCornerRadius * 2) + .2, (cBotTopHoleDepth - cBotCarriageDepth) + .1, .1]);
	  }
     }
}

module cbot_carriage_holes(heSide=false) {
     // Remove the holes for the corners.
     // Bottom left.
     translate([cBotCarriageCornerRadius, .1, cBotCarriageCornerRadius])
	  rotate([90, 0, 0])
	  cylinder(d=cBotCarriageIdlerScrewDiameter, h=cBotCarriageDepth + .2, $fn=100);

     // Bottom right.
     translate([cBotCarriageWidth - cBotCarriageCornerRadius, .1, cBotCarriageCornerRadius])
	  rotate([90, 0, 0])
	  cylinder(d=cBotCarriageIdlerScrewDiameter, h=cBotCarriageDepth + .2, $fn=100);

     // Top left.
     translate([cBotCarriageCornerRadius, .1, cBotCarriageHeight - cBotCarriageCornerRadius])
	  hull() {
	  rotate([90,0,0])
	       cylinder(d=cBotCarriageIdlerScrewDiameter, h=cBotTopHoleDepth + .2, $fn=100);
	  
	  translate([0, 0, -cBotTopHoleLength])
	       rotate([90,0,0])
	       cylinder(d=cBotCarriageIdlerScrewDiameter, h=cBotTopHoleDepth + .2, $fn=100);
     }

     // Top right.
     translate([cBotCarriageWidth - cBotCarriageCornerRadius, .1, cBotCarriageHeight - cBotCarriageCornerRadius])
	  hull() {
	  rotate([90,0,0])
	       cylinder(d=cBotCarriageIdlerScrewDiameter, h=cBotTopHoleDepth + .2, $fn=100);
	  
	  translate([0, 0, -cBotTopHoleLength])
	       rotate([90,0,0])
	       cylinder(d=cBotCarriageIdlerScrewDiameter, h=cBotTopHoleDepth + .2, $fn=100);
     }

     // Cut out the big oval in the middle.
     difference() {
	  translate([(cBotCarriageWidth / 2), .1, (cBotCarriageHeight / 2)])
	       rotate([90, 0, 0])
	       resize([cBotCenterHoleWidth,0,0])
	       cylinder(d=cBotCenterHoleDiameter, cBotCarriageDepth + .2, $fn=100);

	  // Leave a bar for the fan mount if needed.
	  if(! heSide) {
	       translate([0, -cBotCarriageDepth, cBotFanMountPos - (cBotFanBracketHeight * .75)])
		    cube([cBotCarriageWidth, cBotCarriageDepth, (cBotFanBracketHeight * 1.5)]);
	  }
     }
     
     // Cut out the belt holder and holes.
     // Top belt cutout
     translate([-.1, -cBotBeltDepth, ((cBotCarriageHeight / 2) + cBotBeltTopPos)])
	  cbot_belt_cutout();

     // Bottom belt cutout
     translate([cBotCarriageWidth + .1, -cBotBeltDepth, ((cBotCarriageHeight / 2) - cBotBeltBottomPos)])
	  rotate([0, 180, 0])
	  cbot_belt_cutout();

     // Don't cut out fan holes on side with hot end.
     if(heSide == false) {
	  // Cutout mounting holes for the fan mount. This can be easily made repeatable by replace the multipliers with j and i.
	  // Left side
	  translate([cBotCarriageWidth - fanScrewL[0] - (cBotFanMountDistance / 2), -cBotCarriageDepth, cBotFanMountPos])
	       rotate([-90,0,0])
	       bolt_hole(cBotBeltScrewDiameter, cBotCarriageDepth - cBotBeltScrewNutDepth, cBotBeltScrewNutDiameter, cBotBeltScrewNutDepth);
	  
	  // Right side
	  translate([cBotCarriageWidth - fanScrewL[0] + (cBotFanMountDistance / 2), -cBotCarriageDepth, cBotFanMountPos])
	       rotate([-90,0,0])
	       bolt_hole(cBotBeltScrewDiameter, cBotCarriageDepth - cBotBeltScrewNutDepth, cBotBeltScrewNutDiameter, cBotBeltScrewNutDepth);
     }

     // Carve out some cable tie locations.
     for(j=[cBotCableTieHorizontalDistance : cBotCableTieHorizontalDistance : cBotCarriageWidth - cBotCableTieHorizontalDistance]) {
	  for(i=[0 : 1 : cBotCableTieVerticalCount - 1]) {
	       if(((cBotXAxisSwitch == "keyes" || cBotXAxisSwitch == "yl99") &&
		  (i == 1 || i == 2) && (j >= (cBotCableTieHorizontalDistance * 3))) ||
		    ( i == 2 && (j == cBotCableTieHorizontalDistance * 2))) {
		    // Don't carve out this cable tie, it is under the switch.
	       } else {
		    translate([ j,
				-8,
				cBotCarriageHeight - cBotCableTieVerticalPos - (cBotCableTieVerticalDistance * i)])
			 cable_tie(3,1.2,4.5);
	       }
	  }
     }

     // Carve out some bolt holes for mounting various things.
     for(j=[0 : 1 : ((cBotCarriageWidth / cBotFanMountDistance) / 2) -2]) {
	  for(i=[1 : 1 : 2]) {

	       // Left side
	       translate([(cBotCarriageWidth / 2) - ((cBotFanMountDistance / 2) + (cBotFanMountDistance * j)),
			  -cBotCarriageDepth,
			  cBotAccessoryMountPos * i])
		    rotate([-90,0,0])
		    bolt_hole(cBotBeltScrewDiameter, cBotCarriageDepth - cBotBeltScrewNutDepth, cBotBeltScrewNutDiameter, cBotBeltScrewNutDepth);

	       translate([(cBotCarriageWidth / 2) - ((cBotFanMountDistance / 2) + (cBotFanMountDistance * j)),
			  -cBotCarriageDepth,
			  cBotCarriageHeight - (cBotAccessoryMountPos * i)])
		    rotate([-90,0,0])
		    bolt_hole(cBotBeltScrewDiameter, cBotCarriageDepth - cBotBeltScrewNutDepth, cBotBeltScrewNutDiameter, cBotBeltScrewNutDepth);

	       // Right side
	       translate([(cBotCarriageWidth / 2) + ((cBotFanMountDistance / 2) + (cBotFanMountDistance * j)),
			  -cBotCarriageDepth,
			  cBotAccessoryMountPos * i])
		    rotate([-90,0,0])
		    bolt_hole(cBotBeltScrewDiameter, cBotCarriageDepth - cBotBeltScrewNutDepth, cBotBeltScrewNutDiameter, cBotBeltScrewNutDepth);
	       
	       if((cBotXAxisSwitch == "keyes") &&
		  (i >= 2) && (j >= 1))  {
		    // Don't carve out this accessory hole, it is under the switch.
		    } else {
		    
		    translate([(cBotCarriageWidth / 2) + ((cBotFanMountDistance / 2) + (cBotFanMountDistance * j)),
			       -cBotCarriageDepth,
			       cBotCarriageHeight - (cBotAccessoryMountPos * i)])
			 rotate([-90,0,0])
			 bolt_hole(cBotBeltScrewDiameter, cBotCarriageDepth - cBotBeltScrewNutDepth, cBotBeltScrewNutDiameter, cBotBeltScrewNutDepth);
	       }
	  }
     }
     
     // Carve out a space for the Axis endstop if needed.
     if(cBotXAxisSwitch != "none" &&
	((heSide == true && (cBotXAxisSwitchSide == "he" || cBotXAxisSwitchSide == "both")) ||
	(heSide == false && (cBotXAxisSwitchSide == "acc" || cBotXAxisSwitchSide == "both")))) {
	  // Carve out a space for the switch.
	  translate([cBotCarriageWidth - cBotXAxisSwitchDimensions[0][0] + cBotXAxisSwitchOffset,
		     -(cBotCarriageDepth - cBotXAxisSwitchDepth + cBotXAxisSwitchDimensions[0][1]),
		     ((cBotCarriageHeight / 2) - cBotBeltBottomPos + cBotBeltScrewDistance + (cBotBeltScrewNutDiameter / 2))]) {
	       cube(cBotXAxisSwitchDimensions[0]);
	       
	       // Carve out a space for through hole solder points, if needed.
	       if(cBotXAxisSwitch == "yl99" || cBotXAxisSwitch == "keyes") {
		    hull() {
			 translate([cBotXAxisSwitchTHOffset,
				    cBotXAxisSwitchDimensions[0][1],
				    (cBotXAxisSwitchDimensions[0][2] / 2) - 3])
			      sphere(r=.75, $fn=100);
			 
			 translate([cBotXAxisSwitchTHOffset,
				    cBotXAxisSwitchDimensions[0][1],
				    (cBotXAxisSwitchDimensions[0][2] / 2) + 3])
			      sphere(r=.75, $fn=100);
		    }
	       }

	       // Carve out the mounting holes
	       for(i=[1:1:len(cBotXAxisSwitchDimensions)-1]) {
		    translate([cBotXAxisSwitchDimensions[i][0],
			       cBotXAxisSwitchDimensions[0][1],
			       cBotXAxisSwitchDimensions[i][1]])
			 rotate([-90,0,0])
			 bolt_hole(cBotXAxisSwitchDimensions[i][2],
				   (cBotCarriageDepth - cBotXAxisSwitchDepth -
				    cBotXAxisSwitchDimensions[i][4]),
				   cBotXAxisSwitchDimensions[i][3],
				   cBotXAxisSwitchDimensions[i][4]);
	       }
	       
	  }
     }
}

module cbot_belt_cutout() {
     // Belt cutout
     linear_extrude(height=cBotBeltHeight) {
	  for(i=[0 : cBotBeltToothSpacing : (cBotBeltToothLength - cBotBeltToothSpacing)]) {
	       translate([i +.1, 0, 0])
		    polygon([[-cBotBeltToothHeight, - (cBotBeltToothHeight * 2)],[0, 0],[cBotBeltToothSpacing, - (cBotBeltToothHeight * 2)]]);
	       translate([i + .1 + (cBotBeltToothSpacing / 2), 0, 0])
		    polygon([[-cBotBeltToothHeight, - (cBotBeltToothHeight * 2)],[(cBotBeltToothSpacing / 2), 0], [cBotBeltToothSpacing, - (cBotBeltToothHeight * 2)]]);
	  }
	  
	  translate([cBotBeltToothLength + .1, 0, 0])
	       polygon([[0,0],[(cBotBeltLength - cBotBeltToothLength) + .1,-(cBotCarriageDepth - cBotBeltDepth + .1)],[-1,-(cBotCarriageDepth - cBotBeltDepth)]]);
     }
     
     translate([-.1, - (cBotCarriageDepth - cBotBeltDepth +.1), 0])
	  cube([cBotBeltToothLength, (cBotCarriageDepth - cBotBeltDepth - cBotBeltToothHeight) + .1, cBotBeltHeight]);
	  
     // Belt holder mounting holes.
     translate([(cBotBeltToothLength / 2), -(cBotCarriageDepth - cBotBeltDepth), -cBotBeltScrewDistance])
	  rotate([-90,0,0])
	  bolt_hole(cBotBeltScrewDiameter, cBotCarriageDepth - cBotBeltScrewNutDepth, cBotBeltScrewNutDiameter, cBotBeltScrewNutDepth);

     translate([(cBotBeltToothLength / 2), -(cBotCarriageDepth - cBotBeltDepth),  cBotBeltHeight + cBotBeltScrewDistance])
	  rotate([-90,0,0])
	  bolt_hole(cBotBeltScrewDiameter, cBotCarriageDepth - cBotBeltScrewNutDepth, cBotBeltScrewNutDiameter, cBotBeltScrewNutDepth);
}

module cbot_belt_holder() {
     difference() {
	  // Create the base
	  cbot_belt_holder_base();

	  // Create the holes
	  cbot_belt_holder_holes();
     }
}

module cbot_belt_holder_base() {
     // Create the base object
     translate([cBotBeltHolderCornerRadius, 0, cBotBeltHolderCornerRadius])
	  hull() {
	  // Bottom left
	  rotate([90,0,0])
	       cylinder(r=cBotBeltHolderCornerRadius, h=cBotBeltHolderDepth, $fn=100);

	  // Bottom right
	  translate([cBotBeltToothLength - (cBotBeltHolderCornerRadius * 2), 0, 0])
	       rotate([90,0,0])
	       cylinder(r=cBotBeltHolderCornerRadius, h=cBotBeltHolderDepth, $fn=100);

	  // Top Left
	  translate([0, 0, cBotBeltHolderHeight - (cBotBeltHolderCornerRadius * 2)])
	       rotate([90,0,0])
	       cylinder(r=cBotBeltHolderCornerRadius, h=cBotBeltHolderDepth, $fn=100);

	  // Top right
	  translate([cBotBeltToothLength - (cBotBeltHolderCornerRadius * 2), 0, cBotBeltHolderHeight - (cBotBeltHolderCornerRadius * 2)])
	       rotate([90,0,0])
	       cylinder(r=cBotBeltHolderCornerRadius, h=cBotBeltHolderDepth, $fn=100);
     }

     // Create the nub that holds the belt.
     translate([cBotBeltHolderCornerRadius,
		-cBotBeltHolderDepth + .1,
		(cBotBeltHolderHeight / 2)])
	  hull() {
	  // Bottom left
	  translate([0, 0, - (cBotBeltHolderNubHeight / 2) + cBotBeltHolderCornerRadius])
	       rotate([90, 0, 0])
	       cylinder(r=cBotBeltHolderCornerRadius, h=cBotBeltHolderNubDepth + .1, $fn=100);
		    
	  // Bottom right
	  translate([cBotBeltToothLength - (cBotBeltHolderCornerRadius * 2), 0, - (cBotBeltHolderNubHeight / 2) + cBotBeltHolderCornerRadius])
	       rotate([90, 0, 0])
	       cylinder(r=cBotBeltHolderCornerRadius, h=cBotBeltHolderNubDepth + .1, $fn=100);
		    
	  // Top left
	  translate([0, 0, (cBotBeltHolderNubHeight / 2) - cBotBeltHolderCornerRadius])
	       rotate([90, 0, 0])
	       cylinder(r=cBotBeltHolderCornerRadius, h=cBotBeltHolderNubDepth + .1, $fn=100);
		    
	  // Top right
	  translate([cBotBeltToothLength - (cBotBeltHolderCornerRadius * 2), 0, (cBotBeltHolderNubHeight / 2) - cBotBeltHolderCornerRadius])
	       rotate([90, 0, 0])
	       cylinder(r=cBotBeltHolderCornerRadius, h=cBotBeltHolderNubDepth + .1, $fn=100);
     }
}

module cbot_belt_holder_holes() {
     // Belt holder mounting holes.
     translate([(cBotBeltToothLength / 2),
		+.1,
		(cBotBeltHolderHeight / 2) - ((cBotBeltHeight / 2) + cBotBeltScrewDistance)])
	  rotate([90,0,0])
	  cylinder(d=cBotBeltScrewDiameter, h=cBotBeltHolderDepth + .2, $fn=100);
     
     translate([(cBotBeltToothLength / 2),
		+.1,
		(cBotBeltHolderHeight / 2) + ((cBotBeltHeight / 2) + cBotBeltScrewDistance)])
	  rotate([90,0,0])
	  cylinder(d=cBotBeltScrewDiameter, h=cBotBeltHolderDepth + .2, $fn=100);
}

