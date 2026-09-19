page 50261 "VRI Form"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "VRI Table";
    SourceTableView = WHERE(Arrived = FILTER(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("VRI Code"; Rec."VRI Code")
                {
                    Editable = false;
                    TableRelation = "VRI Table"."VRI Code";
                }
                field("VRI Inspector Code"; Rec."VRI Inspector Code")
                {
                }
                field("VRI Inspector Name"; Rec."VRI Inspector Name")
                {
                }
                field("VRI Inspector Address"; Rec."VRI Inspector Address")
                {
                }
                field("VRI Inspector Phone No."; Rec."VRI Inspector Phone No.")
                {
                }
                field("VRI Supervisor No"; Rec."VRI Supervisor No")
                {
                }
                field("VRI Supervisor Name"; Rec."VRI Supervisor Name")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Item Serial No."; Rec."Item Serial No.")
                {
                    Caption = 'Chassis No.';
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Key No."; Rec."Key No.")
                {
                }
                field("Exterior Colour"; Rec."Exterior Colour")
                {
                }
                field("Exterior Colour Name"; Rec."Exterior Colour Name")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Arrived; Rec.Arrived)
                {
                    Editable = false;
                }
                field("VRI Date"; Rec."VRI Date")
                {
                }
                field("Date Of Arrival"; Rec."Date Of Arrival")
                {
                    Editable = false;
                }
                field("Time of Arrival"; Rec."Time of Arrival")
                {
                    Editable = false;
                }
                field("VRI Location"; Rec."VRI Location")
                {
                    Editable = false;
                }
                field(Odometer; Rec.Odometer)
                {
                }
                field("Missing Accessories"; Rec."Missing Accessories")
                {
                }
                field("BnP Problems"; Rec."BnP Problems")
                {
                }
                field("GR Problems"; Rec."GR Problems")
                {
                }
                field("Problem Vehicle"; Rec."Problem Vehicle")
                {
                    Editable = true;
                }
                field("Pass to Sales/Marketing"; Rec."Pass to Sales/Marketing")
                {
                }
                field("Send For Approval"; Rec."Send For Approval")
                {
                }
            }
            group("Walk Around")
            {
                Caption = 'Walk Around';
                field("Factory loaded parts present"; Rec."Factory loaded parts present")
                {



                }
                field("Factory loaded parts condition"; Rec."Factory loaded parts condition")
                {



                }
                field("Quantities of keys/Transmitter"; Rec."Quantities of keys/Transmitter")
                {



                }
                field(Accidents; Rec.Accidents)
                {



                }
                field("Body protective film"; Rec."Body protective film")
                {



                }
                field(Dents; Rec.Dents)
                {



                }
                field(Scratches; Rec.Scratches)
                {



                }
                field("Body Trim damages"; Rec."Body Trim damages")
                {



                }
                field("Body Paint"; Rec."Body Paint")
                {



                }
                field(Windscreen; Rec.Windscreen)
                {



                }
                field("Side glasses"; Rec."Side glasses")
                {



                }
                field("Side Mirrors"; Rec."Side Mirrors")
                {



                }
                field(Lamps; Rec.Lamps)
                {



                }
                field("Wiper blades"; Rec."Wiper blades")
                {



                }
                field(Label; Rec.Label)
                {



                }
                field(Tyres; Rec.Tyres)
                {



                }
                field(Trunk; Rec.Trunk)
                {



                }
                field("Brake disc"; Rec."Brake disc")
                {



                }
                field("Missing items"; Rec."Missing items")
                {



                }
            }
            group("Factory Loaded Parts")
            {
                Caption = 'Factory Loaded Parts';
                field("Install Side mirrors"; Rec."Install Side mirrors")
                {



                }
                field("Snorkel Pipe"; Rec."Snorkel Pipe")
                {



                }
                field("Rear Sticker"; Rec."Rear Sticker")
                {



                }
                field("Air Spoiler"; Rec."Air Spoiler")
                {



                }
                field("Wheel Covers"; Rec."Wheel Covers")
                {



                }
                field("Towing eyelet"; Rec."Towing eyelet")
                {



                }
                field("Battery teminal"; Rec."Battery teminal")
                {



                }
                field(Antennas; Rec.Antennas)
                {



                }
                field("Ear phone"; Rec."Ear phone")
                {



                }
                field("Floor Mats"; Rec."Floor Mats")
                {



                }
                field("Jack and Tool"; Rec."Jack and Tool")
                {



                }
                field("Spare tyres"; Rec."Spare tyres")
                {



                }
            }
            group(Engine)
            {
                Caption = 'Engine';
                field("Battery terminals torque"; Rec."Battery terminals torque")
                {



                }
                field("Fuse Box"; Rec."Fuse Box")
                {



                }
                field("Engine warm up"; Rec."Engine warm up")
                {



                }
                field(Lubrication; Rec.Lubrication)
                {



                }
                field("Wiper washer"; Rec."Wiper washer")
                {



                }
                field("Water coolant"; Rec."Water coolant")
                {



                }
                field("Power steering"; Rec."Power steering")
                {



                }
                field("Battery electrolyte"; Rec."Battery electrolyte")
                {



                }
                field("Fusible link"; Rec."Fusible link")
                {



                }
            }
            group("In Vehicle")
            {
                Caption = 'In Vehicle';
                field("Warranty booklet"; Rec."Warranty booklet")
                {
                    Caption = 'Check side mirrors operations';



                }
                field("Service sticker"; Rec."Service sticker")
                {



                }
                field("Owners manual"; Rec."Owners manual")
                {



                }
                field("Key/Transmitter Operation"; Rec."Key/Transmitter Operation")
                {



                }
                field("Meters at Dashboard"; Rec."Meters at Dashboard")
                {



                }
                field("Hood opening"; Rec."Hood opening")
                {



                }
                field("Fuel Tank"; Rec."Fuel Tank")
                {



                }
                field("Trunk lid"; Rec."Trunk lid")
                {



                }
                field("Car Stereo"; Rec."Car Stereo")
                {



                }
                field("Lights operation"; Rec."Lights operation")
                {



                }
                field("Wipers operation"; Rec."Wipers operation")
                {



                }
                field("Seat belts Operation"; Rec."Seat belts Operation")
                {



                }
                field("Seat operation"; Rec."Seat operation")
                {



                }
                field("Cigarrette lighter"; Rec."Cigarrette lighter")
                {



                }
                field("Steering wheel"; Rec."Steering wheel")
                {



                }
                field("Air condition"; Rec."Air condition")
                {



                }
                field("Sun roof"; Rec."Sun roof")
                {



                }
                field("Hand brake"; Rec."Hand brake")
                {



                }
                field(Headphone; Rec.Headphone)
                {



                }
                field("Interior floor mat"; Rec."Interior floor mat")
                {



                }
                field("Interior roof"; Rec."Interior roof")
                {



                }
                field("Sun visor"; Rec."Sun visor")
                {



                }
                field("Window winding"; Rec."Window winding")
                {



                }
                field("Side mirror oprtn"; Rec."Side mirror oprtn")
                {



                }
                field("Inner lights"; Rec."Inner lights")
                {



                }
                field("Windscreen Cotton"; Rec."Windscreen Cotton")
                {



                }
            }
            group(Boot)
            {
                Caption = 'Boot';
                field("Spare tyre inflation"; Rec."Spare tyre inflation")
                {



                }
                field(Jack; Rec.Jack)
                {



                }
                field("Wheel covers boot"; Rec."Wheel covers boot")
                {



                }
                field("Rear boot speakers"; Rec."Rear boot speakers")
                {



                }
                field("Fire Extinguisher"; Rec."Fire Extinguisher")
                {



                }
                field("C caution"; Rec."C caution")
                {



                }
            }
            group(Under)
            {
                Caption = 'Under';
                field("Body plug"; Rec."Body plug")
                {



                }
                field("Mud Guards"; Rec."Mud Guards")
                {



                }
                field("Suspension mechanism"; Rec."Suspension mechanism")
                {



                }
                field("Brake pipes"; Rec."Brake pipes")
                {



                }
                field("Exhaust pipe"; Rec."Exhaust pipe")
                {



                }
                field("Tyre damages"; Rec."Tyre damages")
                {



                }
            }
        }
    }

    actions
    {
    }

    var
        COFRec: Record 50119;
        Text100: Label 'Do you want to Crreate COF';
        UserSetup: Record 91;
        Text19066546: Label 'Confirm warranty booklets availability';
        Text19016901: Label 'Check  availability of spare tyres and its inflation';
        Text19037886: Label 'Check  battery terminals on correct tightening torque';
        Text19029202: Label 'Install side mirrors';
        Text19067311: Label 'Confirm service sticker installation';
        Text19076986: Label 'Check availability of jacks and tool kits';
        Text19023929: Label 'Check electrical fuse box for proper fixing of fuses and short pin';
        Text19055471: Label 'Install Snorkel pipe';
        Text19069048: Label 'Confirm owners manual availability';
        Text19066429: Label 'Check  availability of wheel covers';
        Text19045741: Label 'Check engine performance during warm up';
        Text19059540: Label 'Install rear sticker on Coaster vehicles';
        Text19007776: Label 'Check all vehicle keys/transmiter operations';
        Text19066100: Label 'Check  rear boot speakers and its operations';
        Text19020802: Label 'Install air spoiler';
        Text19001465: Label 'Check lubrication oil/ fluids level and its guages';
        Text19016760: Label 'Check all meters at dash board with their operating condition';
        Text19057829: Label 'Check  fire Extinguishers availability';
        Text19011733: Label 'Check wiper washer water level';
        Text19039840: Label 'Install wheel covers';
        Text19046891: Label 'Check front hood opening and closing condition';
        Text19064857: Label 'Check for C-Caution';
        Text19033200: Label 'Install towing eyelet covers';
        Text19001899: Label 'Check water coolant level';
        Text19077067: Label 'Check fuel tank lid openning and closing operations';
        Text19020873: Label 'Install battery terminal covers';
        Text19017561: Label 'Check power steering fluid';
        Text19009687: Label 'Check trunk lid opening and closing condition';
        Text19025913: Label 'Install  antennas';
        Text19037004: Label 'Check battery electrolyte level';
        Text19059486: Label 'Check car stereo operations';
        Text19073247: Label 'Check fusible link for possible cuting  and damages';
        Text19054192: Label 'Check ear phone and port operation';
        Text19020418: Label 'Check all lights operations';
        Text19031041: Label 'Install floor mats';
        Text19046099: Label 'Check wipers operation and performance';
        Text19023161: Label 'Install jacks and tool kits';
        Text19000272: Label 'Check seat belt operations';
        Text19008688: Label 'Install spare tyres';
        Text19068222: Label 'Check seats operations and its heater perfommance';
        Text19050583: Label 'Check cigarette lighter and its operations';
        Text19057634: Label 'Check steering wheel tilt and operations';
        Text19035118: Label 'Check air condition performance and cooling operations';
        Text19031268: Label 'Check sun roof operations';
        Text19029988: Label 'Check hand brake operations';
        Text19006128: Label 'Check headphone ear piece  operations';
        Text19032162: Label 'Check interior floor mats for possible stains and dirts';
        Text19019179: Label 'Check interior roof linnings for stain and dirts';
        Text19009366: Label 'Check sun visor linning condition and operations';
        Text19060475: Label 'check window winding operation';
        Text19056706: Label 'Check for inner lights and other interior appliances';
        Text19006040: Label 'Check rear winscreen cotton control operation';
}

