namespace AL_TNL.AL_TNL;

using Microsoft.Purchases.History;
using Microsoft.Service.Item;
using Microsoft.Inventory.Ledger;

tableextension 50099 "Purch. Rcpt. Line Ext" extends "Purch. Rcpt. Line"
{
    fields
    {
        field(50006; Colour; Code[30])
        {
            Editable = true;
            TableRelation = "Colour Codes"."Colour Code";
        }
        field(50008; ETA; Time)
        {
        }
        field(50009; "COF No."; Code[20])
        {
        }
        field(50010; "Method of Procurement"; Option)
        {
            OptionCaption = ' ,Air,Land,LPO,Sea';
            OptionMembers = " ",Air,Land,LPO,Sea;
        }
        field(50011; "Current Stock Status"; Option)
        {
            OptionCaption = ' ,Supplied,Being Processed,Awaiting Supply,No ETA,Awaiting Decision';
            OptionMembers = " ",Supplied,"Being Processed","Awaiting Supply","No ETA","Awaiting Decision";
        }
        field(50012; "Vehicle Reg. No."; Code[20])
        {
            TableRelation = "Service Item"."No.";
        }
        field(50013; "Model No."; Code[20])
        {
        }
        field(50014; "Reception Date"; Date)
        {
        }
        field(50015; "Promised Del Date"; Date)
        {
        }
        field(50210; "Duty Code"; Code[10])
        {
        }
        field(50211; "Chassis No."; Code[50])
        {
            CalcFormula = lookup("Item Ledger Entry"."Serial No." where("Document No." = field("Document No."), "Document Line No." = field("Line No.")));
            FieldClass = FlowField;
        }
        field(50212; Pick; Boolean)
        {
        }
        field(50302; "Year of Production"; Code[10])
        {
        }
        field(50303; "Estimated Mileage"; Code[10])
        {
        }
        field(60006; "Colour Description"; Text[50])
        {
        }
        field(60007; "Color Group"; Code[20])
        {

        }
        field(60008; "Item Length"; Decimal)
        {
        }
        field(60009; "Item Width"; Decimal)
        {
        }
        field(60010; "Item Height"; Decimal)
        {
        }
        field(60011; "Cubic Capacity"; Decimal)
        {
        }
        field(60012; "JPM Unit Price"; Decimal)
        {
        }
        field(60013; "JPM Value"; Decimal)
        {
        }
        field(60100; "Original Purch Customer No."; Code[20])
        {

        }
        field(60101; "Test Chassis"; Code[30])
        {

        }
    }
}
