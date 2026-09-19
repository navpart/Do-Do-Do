page 50470 "Logistics Card"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Logistics Order";
    SourceTableView = WHERE ("Notify VRI"=CONST(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Order No.";Rec."Order No.")
                {
                }
                field(Date;Rec. Date)
                {
                }
                field("Chassis No.";Rec. "Chassis No.")
                {
                    AssistEdit = true;
                    Lookup = true;
                    LookupPageID = "Item Ledger Entries";

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        ItemLedgEntry.SETCURRENTKEY("Serial No.");
                        ItemLedgEntry.SETFILTER("Serial No.", '<>%1', '');
                        //IF FORM.RUNMODAL(0,ItemLedgEntry) = ACTION::LookupOK THEN
                        //VALIDATE("Chassis No.",ItemLedgEntry."Serial No.");
                    end;
                }
                field("Item No.";Rec. "Item No.")
                {
                }
                field(Description;Rec. Description)
                {
                }
                field(Model;Rec. Model)
                {
                }
                field("Model Name";Rec. "Model Name")
                {
                }
                field("Engine No.";Rec. "Engine No.")
                {
                }
                field("Colour Name";Rec. "Colour Name")
                {
                }
                field("KM Reading";Rec. "KM Reading")
                {
                }
                field("Fuel Level";Rec. "Fuel Level")
                {
                }
                field("No. of Keys";Rec. "No. of Keys")
                {
                }
                field("Job Description";Rec. "Job Description")
                {
                }
                field("VRI Code";Rec. "VRI Code")
                {
                }
                field(Location;Rec. Location)
                {
                }
                field("Arrival Date";Rec. "Arrival Date")
                {
                }
                field("Date of Problem Report";Rec. "Date of Problem Report")
                {
                }
                field("Notify VRI";Rec. "Notify VRI")
                {
                }
                field("Sent By";Rec. "Sent By")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        ItemLedgEntry: Record 32;
}

