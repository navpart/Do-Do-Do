namespace AL_TNL.AL_TNL;

using Microsoft.Service.History;

pageextension 60002 "Posted Service Invoices Ext" extends "Posted Service Invoices"
{
    layout
    {
        addafter("Due Date")
        {

            field("Customer Order No."; Rec."Customer Order No.")
            {
                ApplicationArea = All;
            }
            field("Registration No."; Rec."Registration No.")
            {
                ApplicationArea = All;
            }
            field("Total Line Amount"; Rec."Total Line Amount")
            {
                ApplicationArea = All;
            }
            field("Total Line Amount Incl. (VAT)"; Rec."Total Line Amount Incl. (VAT)")
            {
                ApplicationArea = All;
            }
            field("Total Labour Cost"; Rec."Total Labour Cost")
            {
                Caption = 'Total GR labour Amount';
                ApplicationArea = All;
            }
            field("Total Item Cost"; Rec."Total Item Cost")
            {
                Caption = 'Total GR Item Amount';
                ApplicationArea = All;
            }
            field("Total Paint cost"; Rec."Total Paint cost")
            {
                Caption = 'Total B&P Materials ';
                ApplicationArea = All;
            }
            field("Total B&P"; Rec."Total B&P")
            {
                ApplicationArea = All;
            }
            field("Total PM"; Rec."Total PM")
            {
                Caption = 'Total PM Items';
                ApplicationArea = All;
            }
            field("Total GR"; Rec."Total GR")
            {
                Caption = 'Total PM Labour';
                ApplicationArea = All;
            }
            field("Total Others"; Rec."Total Others")
            {
                Caption = 'Total Others';
                ApplicationArea = All;
            }
            field("Total Warranty"; Rec."Total Warranty")
            {
                Caption = 'Total Warranty';
                ApplicationArea = All;
            }
            field("Total Labour Amount"; Rec."Total Labour Amount")
            {
                ApplicationArea = All;
            }
            field("Total B&P Items"; Rec."Total B&P Items")
            {
                ApplicationArea = All;
            }
            field("Total Empty"; Rec."Total Empty")
            {
                ApplicationArea = All;
            }
            field("Received Date"; Rec."Received Date")
            {
                ApplicationArea = All;
            }
            field("Delivery Date"; Rec."Delivery Date")
            {
                ApplicationArea = All;
            }
            field("Model Name"; Rec."Model Name")
            {
                ApplicationArea = All;
            }
            field("Vehicle Classification"; Rec."Vehicle Classification")
            {
                ApplicationArea = All;
            }
            field(Brand; Rec.Brand)
            {
                ApplicationArea = All;
            }
            field("Customer Type"; Rec."Customer Type")
            {
                ApplicationArea = All;
            }


        }
    }
}
