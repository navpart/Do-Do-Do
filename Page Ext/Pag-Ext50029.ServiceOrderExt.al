namespace AL_TNL.AL_TNL;

using Microsoft.Service.Document;

pageextension 50029 "Service Order Ext" extends "Service Order"
{
    layout
    {
        addafter("Phone No. 2")
        {
            field("FA No."; Rec."FA No.")
            {
                ApplicationArea = All;
            }

            field("FA Reg. No."; Rec."FA Reg. No.")
            {
                ApplicationArea = All;
            }
            field("Maintenance Code"; Rec."Maintenance Code")
            {
                ApplicationArea = All;
            }
            field("Job Type"; Rec."Job Type")
            {
                ApplicationArea = All;
            }
            field(Posted; Rec.Posted)
            {
                ApplicationArea = All;
            }
        }

        addafter(Details)
        {
            group("Vehicle Details")
            {
                Caption = 'Vehicle Details';
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                    ApplicationArea = All;
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = All;
                }
                field(Chassis; Rec.Chassis)
                {
                    ApplicationArea = All;
                }
                field("Engine No."; Rec."Engine No.")
                {
                    ApplicationArea = All;
                }
                field("Odometer Reading Reception"; Rec."Odometer Reading Reception")
                {
                    ApplicationArea = All;
                }
                field("Reception Date"; Rec."Reception Date")
                {
                    ApplicationArea = All;
                }
                field("Reception Time"; Rec."Reception Time")
                {
                    ApplicationArea = All;
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                    ApplicationArea = All;
                }
                field("Delivery Time"; Rec."Delivery Time")
                {
                    ApplicationArea = All;
                }
                field("Customer's Requests"; Rec."Customer's Requests")
                {
                    ApplicationArea = All;
                }
                field("Job Details"; Rec."Job Details")
                {
                    ApplicationArea = All;
                }
                field(PM; Rec.PM)
                {
                    ApplicationArea = All;
                }
                field(GR; Rec.GR)
                {
                    ApplicationArea = All;
                }
                field(Others; Rec.Others)
                {
                    ApplicationArea = All;
                }
                field(Warranty; Rec.Warranty)
                {
                    ApplicationArea = All;
                }
                field(Internal; Rec.Internal)
                {
                    ApplicationArea = All;
                }
                field("D/Estimate"; Rec."D/Estimate")
                {
                    ApplicationArea = All;
                }
                field("B&P"; Rec."B&P")
                {
                    ApplicationArea = All;
                }
                field("B&P Estimate"; Rec."B&P Estimate")
                {
                    ApplicationArea = All;
                }
                field(Painting; Rec.Painting)
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}