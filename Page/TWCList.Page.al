page 50114 "TWC List"
{
    Caption = 'TWC List';
    DataCaptionFields = "TWC No.", "Dealer Code", VIN;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "TWC";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Distributors Code"; Rec."Distributors Code")
                {
                }
                field("Dealer Code"; Rec."Dealer Code")
                {
                }
                field("Sales Ledger No."; Rec."Sales Ledger No.")
                {
                }
                field(VIN; Rec.VIN)
                {
                }
                field("TWC No."; Rec."TWC No.")
                {
                }
                field("TWC No. SFX"; Rec."TWC No. SFX")
                {
                }
                field("Claimant Code"; Rec."Claimant Code")
                {
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                }
                field("Dealer Claim No."; Rec."Dealer Claim No.")
                {
                }
                field("Process Flag"; Rec."Process Flag")
                {
                }
                field("Page Count"; Rec."Page Count")
                {
                }
                field("Warranty Type"; Rec."Warranty Type")
                {
                }
                field(Francise; Rec.Francise)
                {
                }
                field("Warranty Application Code"; Rec."Warranty Application Code")
                {
                }
                field("Warranty Application Code 2"; Rec."Warranty Application Code 2")
                {
                }
                field("Warranty Application Code 3"; Rec."Warranty Application Code 3")
                {
                }
                field("Warranty Application Code 4"; Rec."Warranty Application Code 4")
                {
                }
                field("Warranty Application Code 5"; Rec."Warranty Application Code 5")
                {
                }
                field("N.V. Flag"; Rec."N.V. Flag")
                {
                }
                field("F.V. Flag"; Rec."F.V. Flag")
                {
                }
                field("VIN-WMI"; Rec."VIN-WMI")
                {
                }
                field("VIN-VDS"; Rec."VIN-VDS")
                {
                }
                field("VIN-CD"; Rec."VIN-CD")
                {
                }
                field("VIN-VIS"; Rec."VIN-VIS")
                {
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                }
                field("Repair Date"; Rec."Repair Date")
                {
                }
                field(Odometer; Rec.Odometer)
                {
                }
                field("K/M Flg."; Rec."K/M Flg.")
                {
                }
                field("Current Repair Order No."; Rec."Current Repair Order No.")
                {
                }
                field("Invoice Currency Code"; Rec."Invoice Currency Code")
                {
                }
                field("Exchange Rate"; Rec."Exchange Rate")
                {
                }
                field("Data ID"; Rec."Data ID")
                {
                }
                field("Type Class"; Rec."Type Class")
                {
                }
                field("Pay Code"; Rec."Pay Code")
                {
                }
                field("Operation No."; Rec."Operation No.")
                {
                }
                field(Hour; Rec.Hour)
                {
                }
                field("Pay Code 2"; Rec."Pay Code 2")
                {
                }
                field("Operation No. 2"; Rec."Operation No. 2")
                {
                }
                field("Hour 2"; Rec."Hour 2")
                {
                }
                field("Pay Code 3"; Rec."Pay Code 3")
                {
                }
                field("Operation No. 3"; Rec."Operation No. 3")
                {
                }
                field("Hour 3"; Rec."Hour 3")
                {
                }
                field("Operation Main Code"; Rec."Operation Main Code")
                {
                }
                field("Labour Rate"; Rec."Labour Rate")
                {
                }
                field("Labour Total Hour"; Rec."Labour Total Hour")
                {
                }
                field("Labour Amount"; Rec."Labour Amount")
                {
                }
                field("Pay Code Sublet"; Rec."Pay Code Sublet")
                {
                }
                field("Sublet Type"; Rec."Sublet Type")
                {
                }
                field("Sublet Invoice No."; Rec."Sublet Invoice No.")
                {
                }
                field("Sublet Amount"; Rec."Sublet Amount")
                {
                }
                field("Pay Code Sublet 2"; Rec."Pay Code Sublet 2")
                {
                }
                field("Sublet Type 2"; Rec."Sublet Type 2")
                {
                }
                field("Sublet Invoice No. 2"; Rec."Sublet Invoice No. 2")
                {
                }
                field("Sublet Amount 2"; Rec."Sublet Amount 2")
                {
                }
                field("Sublet Total"; Rec."Sublet Total")
                {
                }
                field("Sublet Description"; Rec."Sublet Description")
                {
                }
                field("T1 Code"; Rec."T1 Code")
                {
                }
                field("T2 Code"; Rec."T2 Code")
                {
                }
                field("T3 Code 1"; Rec."T3 Code 1")
                {
                }
                field("T3 Code 2"; Rec."T3 Code 2")
                {
                }
                field("T3 Code 3"; Rec."T3 Code 3")
                {
                }
                field("T3 Code 4"; Rec."T3 Code 4")
                {
                }
                field("T3 Code 5"; Rec."T3 Code 5")
                {
                }
                field("T3 Code 6"; Rec."T3 Code 6")
                {
                }
                field("T3 Code 7"; Rec."T3 Code 7")
                {
                }
                field("Condition (Description)"; Rec."Condition (Description)")
                {
                }
                field("Cause (Description)"; Rec."Cause (Description)")
                {
                }
                field("Remedy (Description)"; Rec."Remedy (Description)")
                {
                }
                field("Parts Pay Code 1"; Rec."Parts Pay Code 1")
                {
                }
                field("Parts Local Flag 1"; Rec."Parts Local Flag 1")
                {
                }
                field("Parts Parts No. 1"; Rec."Parts Parts No. 1")
                {
                }
                field("Parts Quantity 1"; Rec."Parts Quantity 1")
                {
                }
                field("Parts Part Amount 1"; Rec."Parts Part Amount 1")
                {
                }
                field("Parts Pay Code 2"; Rec."Parts Pay Code 2")
                {
                }
                field("Parts Local Flag 2"; Rec."Parts Local Flag 2")
                {
                }
                field("Parts Parts No. 2"; Rec."Parts Parts No. 2")
                {
                }
                field("Parts Quantity 2"; Rec."Parts Quantity 2")
                {
                }
                field("Parts Part Amount 2"; Rec."Parts Part Amount 2")
                {
                }
                field("Parts Pay Code 3"; Rec."Parts Pay Code 3")
                {
                }
                field("Parts Local Flag 3"; Rec."Parts Local Flag 3")
                {
                }
                field("Parts Parts No. 3"; Rec."Parts Parts No. 3")
                {
                }
                field("Parts Quantity 3"; Rec."Parts Quantity 3")
                {
                }
                field("Parts Part Amount 3"; Rec."Parts Part Amount 3")
                {
                }
                field("Parts Pay Code 4"; Rec."Parts Pay Code 4")
                {
                }
                field("Parts Local Flag 4"; Rec."Parts Local Flag 4")
                {
                }
                field("Parts Parts No. 4"; Rec."Parts Parts No. 4")
                {
                }
                field("Parts Quantity 4"; Rec."Parts Quantity 4")
                {
                }
                field("Parts Part Amount 4"; Rec."Parts Part Amount 4")
                {
                }
                field("Parts Pay Code 5"; Rec."Parts Pay Code 5")
                {
                }
                field("Parts Local Flag 5"; Rec."Parts Local Flag 5")
                {
                }
                field("Parts Parts No. 5"; Rec."Parts Parts No. 5")
                {
                }
                field("Parts Quantity 5"; Rec."Parts Quantity 5")
                {
                }
                field("Parts Part Amount 5"; Rec."Parts Part Amount 5")
                {
                }
                field("Parts Pay Code 6"; Rec."Parts Pay Code 6")
                {
                }
                field("Parts Local Flag 6"; Rec."Parts Local Flag 6")
                {
                }
                field("Parts Parts No. 6"; Rec."Parts Parts No. 6")
                {
                }
                field("Parts Quantity 6"; Rec."Parts Quantity 6")
                {
                }
                field("Parts Part Amount 6"; Rec."Parts Part Amount 6")
                {
                }
                field("O.F.P. Local Flag"; Rec."O.F.P. Local Flag")
                {
                }
                field("O.F.P. No."; Rec."O.F.P. No.")
                {
                }
                field("PRR/PWR"; Rec."PRR/PWR")
                {
                }
                field("Part Total"; Rec."Part Total")
                {
                }
                field("Total Claim Amount"; Rec."Total Claim Amount")
                {
                }
                field("Process Date"; Rec."Process Date")
                {
                }
                field("Dist's Claim Adjust Labor %"; Rec."Dist's Claim Adjust Labor %")
                {
                }
                field("Dist's Claim Adjust Sublet %"; Rec."Dist's Claim Adjust Sublet %")
                {
                }
                field("Dist's Claim Adjust Parts %"; Rec."Dist's Claim Adjust Parts %")
                {
                }
                field("Dist. Comment (1)"; Rec."Dist. Comment (1)")
                {
                }
                field(Dummy; Rec.Dummy)
                {
                }
                field("AC First Install date"; Rec."AC First Install date")
                {
                }
                field("AC First Install KM"; Rec."AC First Install KM")
                {
                }
                field("Prev. Repair Order No."; Rec."Prev. Repair Order No.")
                {
                }
                field("Prev. Repair Date"; Rec."Prev. Repair Date")
                {
                }
                field("Prev. Repair KM"; Rec."Prev. Repair KM")
                {
                }
                field("Prev. Invoice No."; Rec."Prev. Invoice No.")
                {
                }
                field("Curr. Invoice No."; Rec."Curr. Invoice No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

