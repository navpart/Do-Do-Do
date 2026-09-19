pageextension 50007 "User Setup Ext" extends "User Setup"
{

    layout
    {
        addafter(Email)
        {
            field(Name; Rec.Name)
            {
                ApplicationArea = All;

            }
            field("Full Name"; Rec."Full Name")
            {
                ApplicationArea = All;

            }
            field("Sales Invoice Nos."; Rec."Sales Invoice Nos.")
            {
                ApplicationArea = All;

            }
            field("Posted Sales Inv. Nos."; Rec."Posted Sales Inv. Nos.")
            {
                ApplicationArea = All;

            }
            field("Global Dimension 1 Filter"; Rec."Global Dimension 1 Filter")
            {
                ApplicationArea = All;

            }
            field("Global Dimension 2 Filter"; Rec."Global Dimension 2 Filter")
            {
                ApplicationArea = All;

            }
            field(Department; Rec.Department)
            {
                ApplicationArea = All;
            }
            field("Sales Quote No Series"; Rec."Sales Quote No Series")
            {
                ApplicationArea = All;

            }
            field("Sales Order No Series"; Rec."Sales Order No Series")
            {
                ApplicationArea = All;

            }
            field("Sales Blanket Order No Series"; Rec."Sales Blanket Order No Series")
            {
                ApplicationArea = All;

            }
            field("Sales Credit Memo No Series"; Rec."Sales Credit Memo No Series")
            {
                ApplicationArea = All;
            }
            field("Posted Sales Cr Memo Nos."; Rec."Posted Sales Cr Memo Nos.")
            {
                ApplicationArea = All;

            }
            field("Posted Sales Shipmt No Series"; Rec."Posted Sales Shipmt No Series")
            {
                ApplicationArea = All;

            }
            field("Purch Invoice Nos."; Rec."Purch Invoice Nos.")
            {
                ApplicationArea = All;

            }
            field("Purch Quote No Series"; Rec."Purch Quote No Series")
            {
                ApplicationArea = All;

            }
            field("Purch Order Nos."; Rec."Purch Order Nos.")
            {
                ApplicationArea = All;

            }
            field("Purch Blanket Order No Series"; Rec."Purch Blanket Order No Series")
            {
                ApplicationArea = All;
            }
            field("Purch Credit Memo No Series"; Rec."Purch Credit Memo No Series")
            {
                ApplicationArea = All;
            }
            field("Posted Purch Cr Memo No Series"; Rec."Posted Purch Cr Memo No Series")
            {
                ApplicationArea = All;
            }
            field("Posted Purch Receipt No Series"; Rec."Posted Purch Receipt No Series")
            {
                ApplicationArea = All;
            }
            field("Posted Purch Invoice Nos."; Rec."Posted Purch Invoice Nos.")
            {
                ApplicationArea = All;
            }
            field("Invoice Location Code"; Rec."Invoice Location Code")
            {
                ApplicationArea = All;
            }
            field("Location Code"; Rec."Location Code")
            {
                ApplicationArea = All;
            }
            field("Dealer Code"; Rec."Dealer Code")
            {
                ApplicationArea = All;
            }
            field("Change Price Below Cost"; Rec."Change Price Below Cost")
            {
                ApplicationArea = All;
            }
            field("Register New Prices"; Rec."Register New Prices")
            {
                ApplicationArea = All;
            }
            field("Approve Warranty Claim"; Rec."Approve Warranty Claim")
            {
                ApplicationArea = All;
            }
            field("Replace War. Material Claim"; Rec."Replace War. Material Claim")
            {
                ApplicationArea = All;
            }
            field("Replace Warranty Labour Claim"; Rec."Replace Warranty Labour Claim")
            {
                ApplicationArea = All;
            }
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
            }
            field("Credit Limit Control"; Rec."Credit Limit Control")
            {
                ApplicationArea = All;
            }
            field("Item Modification Control"; Rec."Item Modification Control")
            {
                ApplicationArea = All;
            }
            field("Credit Memo Approval"; Rec."Credit Memo Approval")
            {
                ApplicationArea = All;
            }
            field("Process Stock Capitalisation"; Rec."Process Stock Capitalisation")
            {
                ApplicationArea = All;
            }
            field("Approve Stock Capitalisation"; Rec."Approve Stock Capitalisation")
            {
                ApplicationArea = All;
            }
            field(Released; Rec.Released)
            {
                ApplicationArea = All;
            }
            field("Access to Monitor Location"; Rec."Access to Monitor Location")
            {
                ApplicationArea = All;
            }
            field("Edit IOU Request"; Rec."Edit IOU Request")
            {
                ApplicationArea = All;
            }
            field(Fleet; Rec.Fleet)
            {
                ApplicationArea = All;
            }
            field(Staff; Rec.Staff)
            {
                ApplicationArea = All;
            }
            field(Cooperative; Rec.Cooperative)
            {
                ApplicationArea = All;
            }
            field(Others; Rec.Others)
            {
                ApplicationArea = All;
            }
            field("Approved for Sales&Mkt"; Rec."Approved for Sales&Mkt")
            {
                ApplicationArea = All;
            }
            field("Item Price Group"; Rec."Item Price Group")
            {
                ApplicationArea = All;
            }
            field(Search; Rec.Search)
            {
                ApplicationArea = All;
            }
            field("Direct Posting"; Rec."Direct Posting")
            {
                ApplicationArea = All;
            }
            field("Branch Confirmation"; Rec."Branch Confirmation")
            {
                ApplicationArea = All;
            }
            field("Shipment Approval"; Rec."Shipment Approval")
            {
                ApplicationArea = All;
            }
            field("User Creation Date"; Rec."User Creation Date")
            {
                ApplicationArea = All;
            }
            field("Last Date Modified"; Rec."Last Date Modified")
            {
                ApplicationArea = All;
            }
            field("Allow Access"; Rec."Allow Access")
            {
                ApplicationArea = All;
            }
            field(Today; Rec.Today)
            {
                ApplicationArea = All;
            }
            field("Post Sales"; Rec."Post Sales")
            {
                ApplicationArea = All;
            }
            field("Post Sales Return"; Rec."Post Sales Return")
            {
                ApplicationArea = All;
            }
            field("Post Purchases"; Rec."Post Purchases")
            {
                ApplicationArea = All;
            }
            field("Post Purchase Returns"; Rec."Post Purchase Returns")
            {
                ApplicationArea = All;
            }
            field("Post Transfers"; Rec."Post Transfers")
            {
                ApplicationArea = All;
            }
            field("Post Voucher"; Rec."Post Voucher")
            {
                ApplicationArea = All;
            }
            field("Sales Line Approval"; Rec."Sales Line Approval")
            {
                ApplicationArea = All;
            }
            field("Sales Line Limit"; Rec."Sales Line Limit")
            {
                ApplicationArea = All;
            }
            field(HOD; Rec.HOD)
            {
                ApplicationArea = All;
            }
            field("2nd Approval"; Rec."2nd Approval")
            {
                ApplicationArea = All;
            }
            field("Final Approval"; Rec."Final Approval")
            {
                ApplicationArea = All;
            }
            field(Allocator; Rec.Allocator)
            {
                ApplicationArea = All;
            }
            field("Audit Service Approval"; Rec."Audit Service Approval")
            {
                ApplicationArea = All;
            }
            field(Initials; Rec.Initials)
            {
                ApplicationArea = All;
            }
            field("E-Mail2"; Rec."E-Mail2")
            {
                ApplicationArea = All;
            }
            field("Unit Price Approval"; Rec."Unit Price Approval")
            {
                ApplicationArea = All;
            }
            field("Employee No."; Rec."Employee No.")
            {
                ApplicationArea = All;
            }
            field("Problem Vehicle"; Rec."Problem Vehicle")
            {
                ApplicationArea = All;
            }
            field("Payroll-Admin"; Rec."Payroll-Admin")
            {
                ApplicationArea = All;
            }
            field(Designation; Rec.Designation)
            {
                ApplicationArea = All;
            }
            field("System Admin"; Rec."System Admin")
            {
                ApplicationArea = All;
            }
            field("Audit Approval"; Rec."Audit Approval")
            {
                ApplicationArea = All;
            }
            field("Admin Approval"; Rec."Admin Approval")
            {
                ApplicationArea = All;
            }
            field("Market Approval"; Rec."Market Approval")
            {
                ApplicationArea = All;
            }
            field("Logistic Approval"; Rec."Logistic Approval")
            {
                ApplicationArea = All;
            }
            field("Finance Approval"; Rec."Finance Approval")
            {
                ApplicationArea = All;
            }
            field("HRAdmin Approval"; Rec."HRAdmin Approval")
            {
                ApplicationArea = All;
            }
            field("Parts Approval"; Rec."Parts Approval")
            {
                ApplicationArea = All;
            }
            field("HOD1 Approval"; Rec."HOD1 Approval")
            {
                ApplicationArea = All;

            }
            field("Branch Approval"; Rec."Branch Approval")
            {
                ApplicationArea = All;
            }
            field("FG Approval"; Rec."FG Approval")
            {
                ApplicationArea = All;
            }
            field("Dealer Dev. Approval"; Rec."Dealer Dev. Approval")
            {
                ApplicationArea = All;
            }
            field("GM/MD"; Rec."GM/MD")
            {
                ApplicationArea = All;
            }
            field("CC Emails"; Rec."CC Emails")
            {
                ApplicationArea = All;
            }
        }
    }
}
