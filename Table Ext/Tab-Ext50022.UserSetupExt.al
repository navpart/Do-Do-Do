tableextension 50022 "User Setup Ext" extends "User Setup"
{
    fields
    {
        field(50000; "Approval Groups"; Code[250])
        {
        }
        field(50001; "Approval Desks"; Code[250])
        {
        }
        field(50002; "Phys. Inv.Count"; Option)
        {
            OptionMembers = " ","1","2","3","4","5";
        }
        field(50003; "Mismatch Approval"; Boolean)
        {
        }
        field(50004; "LAD Authorization Name"; Text[30])
        {
        }
        field(50005; "LAD Authorization"; Code[3])
        {
        }
        field(50006; "Visible Menus"; Code[50])
        {
        }
        field(50007; "Disabled Menus"; Code[50])
        {
        }
        field(50008; "Role IDs"; Code[100])
        {

        }
        field(50009; "Applicable Spare Categories"; Code[100])
        {

        }
        field(50010; "Applicable HR Posting Group"; Code[100])
        {

        }
        field(50011; "Applicable Sales Accounts"; Code[100])
        {

        }
        field(50012; "Purchase Order Option"; Option)
        {
            OptionMembers = "None",Inventory,Warehouse,Both;
        }
        field(50013; "Max LAD Authorization Amt"; Decimal)
        {
        }
        field(50014; "Authorize for others"; Boolean)
        {
        }
        field(50015; "Inventory Posting Grp Filter"; Code[100])
        {
            TableRelation = "Inventory Posting Group".Code;
            ValidateTableRelation = false;
        }
        field(50016; "View Staff Customer Rec"; Boolean)
        {
        }
        field(50150; Usergroup; Code[10])
        {
        }
        field(50151; Name; Text[30])
        {
        }
        field(50152; Department; Code[20])
        {
        }
        field(50153; "Transactions 99"; Integer)
        {
        }
        /*  field(50154; "Department Filter"; Code[20])
         {
             TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
         } */
        field(50155; "Full Name"; Text[30])
        {
            Editable = false;
        }
        field(50156; "Sales Invoice Nos."; Code[100])
        {
        }
        field(50158; "Posted Sales Inv. Nos."; Code[100])
        {
        }
        field(50170; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50171; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50172; "Sales Quote No Series"; Code[100])
        {
        }
        field(50173; "Sales Order No Series"; Code[100])
        {
        }
        field(50174; "Sales Blanket Order No Series"; Code[100])
        {
        }
        field(50175; "Sales Credit Memo No Series"; Code[100])
        {
        }
        field(50180; "Posted Sales Cr Memo Nos."; Code[100])
        {
        }
        field(50182; "Posted Sales Shipmt No Series"; Code[100])
        {
        }
        field(50190; "Purch Invoice Nos."; Code[100])
        {
        }
        field(50191; "Purch Quote No Series"; Code[100])
        {
        }
        field(50192; "Purch Order Nos."; Code[100])
        {
        }
        field(50193; "Purch Blanket Order No Series"; Code[100])
        {
        }
        field(50194; "Purch Credit Memo No Series"; Code[100])
        {
        }
        field(50195; "Posted Purch Cr Memo No Series"; Code[100])
        {
        }
        field(50196; "Posted Purch Receipt No Series"; Code[100])
        {
        }
        field(50197; "Posted Purch Invoice Nos."; Code[100])
        {
        }
        field(50198; "Invoice Location Code"; Code[20])
        {
            TableRelation = Location.Code WHERE("Use As In-Transit" = CONST(false));
        }
        field(50199; "Location Code"; Code[20])
        {
            TableRelation = Location.Code WHERE("Use As In-Transit" = CONST(false));
        }
        field(50200; "Dealer Code"; Code[20])
        {
            //TableRelation = Customer.No.;
        }
        field(50201; "Change Price Below Cost"; Boolean)
        {
        }
        field(50202; "Register New Prices"; Boolean)
        {
        }
        field(50203; "Approve Warranty Claim"; Boolean)
        {
        }
        field(50204; "Replace War. Material Claim"; Boolean)
        {
        }
        field(50205; "Replace Warranty Labour Claim"; Boolean)
        {
        }
        field(50206; "Global Dimension 1 Code"; Code[10])
        {
        }
        field(50207; "Credit Limit Control"; Boolean)
        {
        }
        field(50208; "Item Modification Control"; Boolean)
        {
        }
        field(50209; "Credit Memo Approval"; Boolean)
        {
        }
        field(50210; "Process Stock Capitalisation"; Boolean)
        {
        }
        field(50211; "Approve Stock Capitalisation"; Boolean)
        {
        }
        field(50212; Released; Boolean)
        {
        }
        field(50213; "Access to Monitor Location"; Boolean)
        {
        }
        field(50214; "Edit IOU Request"; Boolean)
        {
        }
        field(50215; Fleet; Boolean)
        {
        }
        field(50216; Staff; Boolean)
        {
        }
        field(50217; Cooperative; Boolean)
        {
        }
        field(50218; Others; Boolean)
        {
        }
        field(50219; "Approved for Sales&Mkt"; Boolean)
        {
        }
        field(50220; "Item Price Group"; Boolean)
        {
        }
        field(50221; Search; Boolean)
        {
        }
        field(50222; "Direct Posting"; Boolean)
        {
        }
        field(50223; "Branch Confirmation"; Boolean)
        {
        }
        field(50224; "Shipment Approval"; Boolean)
        {
        }
        field(50225; "User Creation Date"; Date)
        {
            Editable = true;
        }
        field(50226; "Last Date Modified"; Date)
        {
            Editable = true;
        }
        field(50227; "Allow Access"; Boolean)
        {
        }
        field(50228; Today; Boolean)
        {
        }
        field(50229; "Post Sales"; Boolean)
        {
        }
        field(50230; "Post Sales Return"; Boolean)
        {
        }
        field(50231; "Post Purchases"; Boolean)
        {
        }
        field(50232; "Post Purchase Returns"; Boolean)
        {
        }
        field(50233; "Post Transfers"; Boolean)
        {
        }
        field(50234; "Post Voucher"; Boolean)
        {
        }
        field(50235; "Sales Line Approval"; Boolean)
        {
        }
        field(50236; "Sales Line Limit"; Boolean)
        {
        }
        field(50237; HOD; Code[50])
        {
        }
        field(50238; "2nd Approval"; Boolean)
        {
        }
        field(50239; "Final Approval"; Boolean)
        {
        }
        field(50240; Allocator; Boolean)
        {
        }
        field(50241; "Audit Service Approval"; Boolean)
        {
        }
        field(50242; Initials; Code[10])
        {
        }
        field(50243; "E-Mail2"; Text[200])
        {
            Caption = 'E-Mail';
            ExtendedDatatype = EMail;
        }
        field(50244; "Unit Price Approval"; Boolean)
        {
        }
        field(50246; "Employee No."; Code[20])
        {
        }
        /* field(50247; Signature; MediaSet)
        {
            
        } */
        field(50248; "Problem Vehicle"; Boolean)
        {
        }
        field(50249; "Payroll-Admin"; Boolean)
        {
        }
        field(50252; Designation; Text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(50253; "System Admin"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50254; "Audit Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50255; "Admin Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50256; "Market Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50257; "Logistic Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50258; "Finance Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50259; "HRAdmin Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50260; "Parts Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50261; "HOD1 Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50262; "Branch Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50263; "FG Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50264; "Dealer Dev. Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60000; "GM/MD"; boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60001; "CC Emails"; Text[250])
        {
            DataClassification = ToBeClassified;
        }


    }

    trigger OnAfterModify()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.get(USERID);
        if not UserSetup."System Admin" then
            Error('You cannot modify this record!');
    end;
}
