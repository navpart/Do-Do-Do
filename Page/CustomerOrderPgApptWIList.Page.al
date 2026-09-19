page 70085 "Customer Order Pg Appt/WI List"
{
    CardPageID = "Customer Order Pg Appt/WI Card";
    Editable = false;
    PageType = List;
    SourceTable = "Customer Order Table.";
    SourceTableView = WHERE("Service Type" = CONST("General Workshop"),
                            Delivered = filter(false),
                            "For Part Arrival" = filter(true),
                            "For Production" = filter(false));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer Order Form No."; Rec."Customer Order Form No.")
                {
                }
                field("Reception Date"; Rec."Reception Date")
                {
                }
                field("Reception Time"; Rec."Reception Time")
                {
                }
                field("Reception Type"; Rec."Reception Type")
                {
                }
                field("Courtesy Vehicle"; Rec."Courtesy Vehicle")
                {
                }
                field("Delivery Type"; Rec."Delivery Type")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                }
                field(Address2; Rec.Address2)
                {
                }
                field("Customer Order Form Date"; Rec."Customer Order Form Date")
                {
                }
                field("Confirmation Date"; Rec."Confirmation Date")
                {
                }
                field("Confirmation Time"; Rec."Confirmation Time")
                {
                }
                field("Confirmation Staff Name"; Rec."Confirmation Staff Name")
                {
                }
                field("Parts Ordered Date"; Rec."Parts Ordered Date")
                {
                }
                field("Parts Ordered Time"; Rec."Parts Ordered Time")
                {
                }
                field("Parts Ordered Staff Name"; Rec."Parts Ordered Staff Name")
                {
                }
                field("Parts Arrived Date"; Rec."Parts Arrived Date")
                {
                }
                field("Parts Arrived Time"; Rec."Parts Arrived Time")
                {
                }
                field("Parts Arrived Staff Name"; Rec."Parts Arrived Staff Name")
                {
                }
                field("Model No"; Rec."Model No")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                }
                field("Contact Telephone No."; Rec."Contact Telephone No.")
                {
                }
                field("Contact Telephone No. Type"; Rec."Contact Telephone No. Type")
                {
                }
                field("Available Time From"; Rec."Available Time From")
                {
                }
                field("Available Time To"; Rec."Available Time To")
                {
                }
                field("Vehicle Driven By"; Rec."Vehicle Driven By")
                {
                }
                field("Vehicle Driven By Type"; Rec."Vehicle Driven By Type")
                {
                }
                field("If Other Type"; Rec."If Other Type")
                {
                }
                field("Odometer Reading At Appointmen"; Rec."Odometer Reading At Appointmen")
                {
                }
                field("Vehicle Registered Date"; Rec."Vehicle Registered Date")
                {
                }
                field("Frame No./VIN"; Rec."Frame No./VIN")
                {
                }
                field("(Engine No)"; Rec."(Engine No)")
                {
                }
                field("E-mail"; Rec."E-mail")
                {
                }
                field("Current Service Due Date"; Rec."Current Service Due Date")
                {
                }
                field("Current Service Kilometre"; Rec."Current Service Kilometre")
                {
                }
                field("Job Type"; Rec."Job Type")
                {
                }
                field("Odometer Reading"; Rec."Odometer Reading")
                {
                }
                field("Service History"; Rec."Service History")
                {
                }
                field("SSC/SC Information"; Rec."SSC/SC Information")
                {
                }
                field("Customer's Requests"; Rec."Customer's Requests")
                {
                }
                field(Maintenance; Rec.Maintenance)
                {
                }
                field("General Repair"; Rec."General Repair")
                {
                }
                field(Internal; Rec.Internal)
                {
                }
                field(Warranty; Rec.Warranty)
                {
                }
                field("Customer Waiting"; Rec."Customer Waiting")
                {
                }
                field("Repeat Repair"; Rec."Repeat Repair")
                {
                }
                field("Job Details"; Rec."Job Details")
                {
                }
                field("Appointment Date"; Rec."Appointment Date")
                {
                }
                field("Appointment Time"; Rec."Appointment Time")
                {
                }
                field("Appointment Staff Name"; Rec."Appointment Staff Name")
                {
                }
                field("Estimated Job Time"; Rec."Estimated Job Time")
                {
                }
                field("Time Changed"; Rec."Time Changed")
                {
                }
                field("Model Year"; Rec."Model Year")
                {
                }
                field("Cost Changed"; Rec."Cost Changed")
                {
                }
                field("Appointment Offering 1 Date"; Rec."Appointment Offering 1 Date")
                {
                }
                field("Appointment Offering 1 Time"; Rec."Appointment Offering 1 Time")
                {
                }
                field("Appointment Offering 2 Date"; Rec."Appointment Offering 2 Date")
                {
                }
                field("Appointment Offering 2 Time"; Rec."Appointment Offering 2 Time")
                {
                }
                field(Quantity1; Rec.Quantity1)
                {
                }
                field(Quantity2; Rec.Quantity2)
                {
                }
                field(Stock1; Rec.Stock1)
                {
                }
                field(Stock2; Rec.Stock2)
                {
                }
                field(ETA1; Rec.ETA1)
                {
                }
                field(ETA2; Rec.ETA2)
                {
                }
                field("Walk Around Check"; Rec."Walk Around Check")
                {
                }
                field("Additional Job Confirmation"; Rec."Additional Job Confirmation")
                {
                }
                field("Car Wash"; Rec."Car Wash")
                {
                }
                field(Valuables; Rec.Valuables)
                {
                }
                field("Present Estimate w/Explanation"; Rec."Present Estimate w/Explanation")
                {
                }
                field(Memo; Rec.Memo)
                {
                }
                field("Courtesy Items"; Rec."Courtesy Items")
                {
                }
                field("Payment Method"; Rec."Payment Method")
                {
                }
                field("If Other Method"; Rec."If Other Method")
                {
                }
                field("Odometer Reading At Reception"; Rec."Odometer Reading At Reception")
                {
                }
                field("Walk Around Reception Date"; Rec."Walk Around Reception Date")
                {
                }
                field("Walk Around Reception Time"; Rec."Walk Around Reception Time")
                {
                }
                field("Reception Staff Name"; Rec."Reception Staff Name")
                {
                }
                field("Customer Signature"; Rec."Customer Signature")
                {
                }
                field("Expected Delivery Date"; Rec."Expected Delivery Date")
                {
                }
                field("Expected Delivery Time"; Rec."Expected Delivery Time")
                {
                }
                field("If Other Customer's Requests"; Rec."If Other Customer's Requests")
                {
                }
                field(Estimation; Rec.Estimation)
                {
                }
                field("Replace Parts Keep"; Rec."Replace Parts Keep")
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field(Maintenance2; Rec.Maintenance2)
                {
                }
                field("Customer Name2"; Rec."Customer Name2")
                {
                }
                field("Customer Address"; Rec."Customer Address")
                {
                }
                field("Customer Address2"; Rec."Customer Address2")
                {
                }
                field("Customer Telephone No."; Rec."Customer Telephone No.")
                {
                }
                field("Model Name2"; Rec."Model Name2")
                {
                }
                field("Vehicle Registration No.2"; Rec."Vehicle Registration No.2")
                {
                }
                field("Update Customer Record"; Rec."Update Customer Record")
                {
                }
                field("Seat Cover"; Rec."Seat Cover")
                {
                }
                field("Floor Mat"; Rec."Floor Mat")
                {
                }
                field("Job No.1"; Rec."Job No.1")
                {
                }
                field("Job No.2"; Rec."Job No.2")
                {
                }
                field("Job No.3"; Rec."Job No.3")
                {
                }
                field(Odometer1; Rec.Odometer1)
                {
                }
                field(Odometer2; Rec.Odometer2)
                {
                }
                field(Odometer3; Rec.Odometer3)
                {
                }
                field(Date1; Rec.Date1)
                {
                }
                field(Date2; Rec.Date2)
                {
                }
                field(Date3; Rec.Date3)
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field(Stock; Rec.Stock)
                {
                }
                field(EDA; Rec.EDA)
                {
                }
                field(Cheque; Rec.Cheque)
                {
                }
                field(Cash; Rec.Cash)
                {
                }
                field("Job Description1"; Rec."Job Description1")
                {
                }
                field("Job Description2"; Rec."Job Description2")
                {
                }
                field("Job Description3"; Rec."Job Description3")
                {
                }
                field(Maintenance1; Rec.Maintenance1)
                {
                }
                field("Job Type Description"; Rec."Job Type Description")
                {
                }
                field("Contact Home"; Rec."Contact Home")
                {
                }
                field("Contact Business"; Rec."Contact Business")
                {
                }
                field("Contact Mobile"; Rec."Contact Mobile")
                {
                }
                field(Home; Rec.Home)
                {
                }
                field(Business; Rec.Business)
                {
                }
                field(Mobile; Rec.Mobile)
                {
                }
                field("Estimate No."; Rec."Estimate No.")
                {
                }
                field("Total Estimation"; Rec."Total Estimation")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Feeding Location"; Rec."Feeding Location")
                {
                }
                field("Estimate Factor"; Rec."Estimate Factor")
                {
                }
                field("Add. Jobs Estimation"; Rec."Add. Jobs Estimation")
                {
                }
                field(Total; Rec.Total)
                {
                }
                field("Service Location"; Rec."Service Location")
                {
                }
                field("Customer Type"; Rec."Customer Type")
                {
                }
                field(Other; Rec.Other)
                {
                }
                field("Walk-around Check"; Rec."Walk-around Check")
                {
                }
                field("If Other Delivery Type"; Rec."If Other Delivery Type")
                {
                }
                field("Job Instruction No."; Rec."Job Instruction No.")
                {
                }
                field("Job Instruction Date"; Rec."Job Instruction Date")
                {
                }
                field("Estimated Completion Date"; Rec."Estimated Completion Date")
                {
                }
                field("Estimated Completion Time"; Rec."Estimated Completion Time")
                {
                }
                field("Key Assigned No."; Rec."Key Assigned No.")
                {
                }
                field("Stall No."; Rec."Stall No.")
                {
                }
                field("Job Start Date"; Rec."Job Start Date")
                {
                }
                field("Job Start Time"; Rec."Job Start Time")
                {
                }
                field("Completion Changed Date"; Rec."Completion Changed Date")
                {
                }
                field("Completion Changed Time"; Rec."Completion Changed Time")
                {
                }
                field("Delivery Changed Date"; Rec."Delivery Changed Date")
                {
                }
                field("Delivery Changed Time"; Rec."Delivery Changed Time")
                {
                }
                field("CC Date"; Rec."CC Date")
                {
                }
                field("CC Time"; Rec."CC Time")
                {
                }
                field("CC Staff Name"; Rec."CC Staff Name")
                {
                }
                field("JC Date"; Rec."JC Date")
                {
                }
                field("JC Time"; Rec."JC Time")
                {
                }
                field("Actual Hours Clocked"; Rec."Actual Hours Clocked")
                {
                }
                field("Other Findings/Advice"; Rec."Other Findings/Advice")
                {
                }
                field("QC Staff"; Rec."QC Staff")
                {
                }
                field("Pre-d C Staff Name"; Rec."Pre-d C Staff Name")
                {
                }
                field("Pre-d C Confirmed by"; Rec."Pre-d C Confirmed by")
                {
                }
                field(Cleanliness; Rec.Cleanliness)
                {
                }
                field("Cleanliness Type"; Rec."Cleanliness Type")
                {
                }
                field(Cleanliness2; Rec.Cleanliness2)
                {
                }
                field("Courtesy Items Removal"; Rec."Courtesy Items Removal")
                {
                }
                field("Courtesy Items Removal2"; Rec."Courtesy Items Removal2")
                {
                }
                field("Outer Minor P / Seat P"; Rec."Outer Minor P / Seat P")
                {
                }
                field("Outer Minor P / Seat P2"; Rec."Outer Minor P / Seat P2")
                {
                }
                field("Clock Adj / Radio Setting"; Rec."Clock Adj / Radio Setting")
                {
                }
                field("Clock Adj / Radio Setting2"; Rec."Clock Adj / Radio Setting2")
                {
                }
                field("Job CN Date"; Rec."Job CN Date")
                {
                }
                field("Job CN Time"; Rec."Job CN Time")
                {
                }
                field("Job CN Staff Name"; Rec."Job CN Staff Name")
                {
                }
                field("Job Details Explanation"; Rec."Job Details Explanation")
                {
                }
                field("Fee Explanation"; Rec."Fee Explanation")
                {
                }
                field("Results Confirmation w / Cust."; Rec."Results Confirmation w / Cust.")
                {
                }
                field("P.S.F.U. (Plan)"; Rec."P.S.F.U. (Plan)")
                {
                }
                field("Level-up"; Rec."Level-up")
                {
                }
                field("JRE Staff Code"; Rec."JRE Staff Code")
                {
                }
                field("Actual Delivery Date"; Rec."Actual Delivery Date")
                {
                }
                field("Actual Delivery Time"; Rec."Actual Delivery Time")
                {
                }
                field("Delivery Customer"; Rec."Delivery Customer")
                {
                }
                field("If Other Customer"; Rec."If Other Customer")
                {
                }
                field("Delivery Staff Name"; Rec."Delivery Staff Name")
                {
                }
                field("P.S.F.U. Staff Name"; Rec."P.S.F.U. Staff Name")
                {
                }
                field("P.S.F.U. Confirmed by"; Rec."P.S.F.U. Confirmed by")
                {
                }
                field("Job Type2"; Rec."Job Type2")
                {
                }
                field("Parts Desciption"; Rec."Parts Desciption")
                {
                }
                field("Job Category"; Rec."Job Category")
                {
                }
                field("If Other Job Category"; Rec."If Other Job Category")
                {
                }
                field(Fixed; Rec.Fixed)
                {
                }
                field("No Fixed"; Rec."No Fixed")
                {
                }
                field("P.S.F.U. (Plan) Date"; Rec."P.S.F.U. (Plan) Date")
                {
                }
                field("P.S.F.U. (Plan) Time"; Rec."P.S.F.U. (Plan) Time")
                {
                }
                field("P.S.F.U Other"; Rec."P.S.F.U Other")
                {
                }
                field("P.S.F.U. (Actual) Date"; Rec."P.S.F.U. (Actual) Date")
                {
                }
                field("P.S.F.U. (Actual) Time"; Rec."P.S.F.U. (Actual) Time")
                {
                }
                field("CT Home"; Rec."CT Home")
                {
                }
                field("CT Mobile"; Rec."CT Mobile")
                {
                }
                field("CT Business"; Rec."CT Business")
                {
                }
                field("Contact Telephone"; Rec."Contact Telephone")
                {
                }
                field("JI E-mail"; Rec."JI E-mail")
                {
                }
                field("JI Other"; Rec."JI Other")
                {
                }
                field("JI Other II"; Rec."JI Other II")
                {
                }
                field("JI EMail2"; Rec."JI EMail2")
                {
                }
                field("Service Type"; Rec."Service Type")
                {
                }
                field("Other Payment Type"; Rec."Other Payment Type")
                {
                }
                field("Reception Date2"; Rec."Reception Date2")
                {
                }
                field("Reception Time2"; Rec."Reception Time2")
                {
                }
                field("Customer Intention/Job Details"; Rec."Customer Intention/Job Details")
                {
                }
                field("Customer and Vehicle Info"; Rec."Customer and Vehicle Info")
                {
                }
                field(Score; Rec.Score)
                {
                }
                field("Adjust Veh Reception DateTime"; Rec."Adjust Veh Reception DateTime")
                {
                }
                field("Confirm Contact Info/Driver"; Rec."Confirm Contact Info/Driver")
                {
                }
                field("Enter Recptn Appntmt DateTime"; Rec."Enter Recptn Appntmt DateTime")
                {
                }
                field("Print Customer and Veh. Info"; Rec."Print Customer and Veh. Info")
                {
                }
                field("Print Estimate I"; Rec."Print Estimate I")
                {
                }
                field("Parts Req./Completion DateTime"; Rec."Parts Req./Completion DateTime")
                {
                }
                field("Recptn Confirm/Payment Method"; Rec."Recptn Confirm/Payment Method")
                {
                }
                field("Parts Ordering/Completion Date"; Rec."Parts Ordering/Completion Date")
                {
                }
                field("Preparation Status Parts Req."; Rec."Preparation Status Parts Req.")
                {
                }
                field("Confirm and Enter Odometer"; Rec."Confirm and Enter Odometer")
                {
                }
                field("Conduct/Entrer Walkaround Chec"; Rec."Conduct/Entrer Walkaround Chec")
                {
                }
                field("Add Job, Valuabes/ Courtesy It"; Rec."Add Job, Valuabes/ Courtesy It")
                {
                }
                field("Present Estimate I and Xplain"; Rec."Present Estimate I and Xplain")
                {
                }
                field("Enter Veh Delivery DateTime"; Rec."Enter Veh Delivery DateTime")
                {
                }
                field("Reconfirm Payment Method"; Rec."Reconfirm Payment Method")
                {
                }
                field("Confirm if Car wash is needed"; Rec."Confirm if Car wash is needed")
                {
                }
                field("Necessity of returnin Repl Par"; Rec."Necessity of returnin Repl Par")
                {
                }
                field("Recptn Detl/Completio DateTime"; Rec."Recptn Detl/Completio DateTime")
                {
                }
                field("Obtain Customer Signature"; Rec."Obtain Customer Signature")
                {
                }
                field("Technician Name"; Rec."Technician Name")
                {
                }
                field(Delivered; Rec.Delivered)
                {
                }
                field("Service Advisor"; Rec."Service Advisor")
                {
                }
                field("Create Service Order"; Rec."Create Service Order")
                {
                }
                field("Service Order No."; Rec."Service Order No.")
                {
                }
                field("Post Service Invoice"; Rec."Post Service Invoice")
                {
                }
                field(Teams; Rec.Teams)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Job Opened"; Rec."Job Opened")
                {
                }
                field("Service Advisor's Name"; Rec."Service Advisor's Name")
                {
                }
                field(Estimate; Rec.Estimate)
                {
                }
                field("Additional Job Details"; Rec."Additional Job Details")
                {
                }
                field("Next Job Type"; Rec."Next Job Type")
                {
                }
                field("Next Service Date"; Rec."Next Service Date")
                {
                }
                field(Technician; Rec.Technician)
                {
                }
                field("Quality Control Staff Code"; Rec."Quality Control Staff Code")
                {
                }
                field("Job Progress"; Rec."Job Progress")
                {
                }
                field("JRE Staff Name"; Rec."JRE Staff Name")
                {
                }
                field("Total Appointment Time"; Rec."Total Appointment Time")
                {
                }
                field("Total Rem Appt Time"; Rec."Total Rem Appt Time")
                {
                }
                field("Total Walk in Time"; Rec."Total Walk in Time")
                {
                }
                field("Total Rem W/I Time"; Rec."Total Rem W/I Time")
                {
                }
                field("Customer Complaint"; Rec."Customer Complaint")
                {
                }
                field("Service Duration"; Rec."Service Duration")
                {
                }
                field("Diag/Est"; Rec."Diag/Est")
                {
                }
                field("B & P"; Rec."B & P")
                {
                }
                field("Priority Class"; Rec."Priority Class")
                {
                }
                field(Memo2; Rec.Memo2)
                {
                }
                field(Rescheduling; Rec.Rescheduling)
                {
                }
                field("New Customer"; Rec."New Customer")
                {
                }
                field("For Delivery Preparation"; Rec."For Delivery Preparation")
                {
                }
                field("For Invoice"; Rec."For Invoice")
                {
                }
                field("Appt Confirmed"; Rec."Appt Confirmed")
                {
                }
                field("For Part Order"; Rec."For Part Order")
                {
                }
                field("For Part Arrival"; Rec."For Part Arrival")
                {
                }
                field("For Reception"; Rec."For Reception")
                {
                }
                field("For Production"; Rec."For Production")
                {
                }
                field("For Quality Control"; Rec."For Quality Control")
                {
                }
                field("For Payment"; Rec."For Payment")
                {
                }
                field("Transfer to TA"; Rec."Transfer to TA")
                {
                }
                field("TA Code"; Rec."TA Code")
                {
                }
                field("TA Name"; Rec."TA Name")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field("Request Batch Name"; Rec."Request Batch Name")
                {
                }
                field("Parts Arrived"; Rec."Parts Arrived")
                {
                }
                field("For Appt Confirmation"; Rec."For Appt Confirmation")
                {
                }
                field("SSC Available"; Rec."SSC Available")
                {
                }
                field(DateDiff; Rec.DateDiff)
                {
                }
                field("Order Line Updated"; Rec."Order Line Updated")
                {
                }
                field("Est. Req. Batch Name"; Rec."Est. Req. Batch Name")
                {
                }
                field("FA No."; Rec."FA No.")
                {
                }
                field("Labour Estimate"; Rec."Labour Estimate")
                {
                }
                field("Item Estimate"; Rec."Item Estimate")
                {
                }
                field("Date Delivered"; Rec."Date Delivered")
                {
                }
                field("Time Delivered"; Rec."Time Delivered")
                {
                }
                field(VDS; Rec.VDS)
                {
                }
                field(VIS; Rec.VIS)
                {
                }
                field(VMI; Rec.VMI)
                {
                }
                field("Customer Order Form Type"; Rec."Customer Order Form Type")
                {
                }
                field("Service Req. Code"; Rec."Service Req. Code")
                {
                }
                field("VRI Estimate Approved"; Rec."VRI Estimate Approved")
                {
                }
                field("COF Origin"; Rec."COF Origin")
                {
                }
                field("Fuel Level"; Rec."Fuel Level")
                {
                }
                field("No VAT"; Rec."No VAT")
                {
                }
            }
        }
    }

    actions
    {
    }
}

