page 50113 "TWC Card"
{
    DelayedInsert = true;
    PageType = Card;
    SourceTable = "TWC";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Dealer Code"; Rec."Dealer Code")
                {
                }
                field("Distributors Code"; Rec."Distributors Code")
                {
                }
                field("TWC No."; Rec."TWC No.")
                {
                }
                field("Dealer Claim No."; Rec."Dealer Claim No.")
                {
                }
                field("Warranty Type"; Rec."Warranty Type")
                {
                }
                label(Control1)
                {
                    CaptionClass = Text19048125;
                    MultiLine = true;
                }
                field("Warranty Application Code"; Rec."Warranty Application Code")
                {
                    Caption = '1';
                }
                field("N.V. Flag"; Rec."N.V. Flag")
                {
                }
                field("VIN-WMI"; Rec."VIN-WMI")
                {
                    Caption = 'WMI';
                }
                field("VIN-VDS"; Rec."VIN-VDS")
                {
                    Caption = 'VDS';
                }
                field("VIN-CD"; Rec."VIN-CD")
                {
                    Caption = 'CD';
                }
                field("Current Repair Order No."; Rec."Current Repair Order No.")
                {
                }
                field("F.V. Flag"; Rec."F.V. Flag")
                {
                    Caption = 'F.V. ';
                }
                field("Pay Code"; Rec."Pay Code")
                {
                }
                field("Operation Main Code"; Rec."Operation Main Code")
                {
                }
                field("Pay Code 2"; Rec."Pay Code 2")
                {
                }
                field("Pay Code 3"; Rec."Pay Code 3")
                {
                }
                field("Sales Ledger No."; Rec."Sales Ledger No.")
                {
                }
                field("Claimant Code"; Rec."Claimant Code")
                {
                }
                field("TWC No. SFX"; Rec."TWC No. SFX")
                {
                    Caption = 'SFX';
                }
                field("Warranty Application Code 2"; Rec."Warranty Application Code 2")
                {
                    Caption = '2';
                }
                field("VIN-VIS"; Rec."VIN-VIS")
                {
                    Caption = 'VIS';
                }
                field("Invoice Currency Code"; Rec."Invoice Currency Code")
                {
                }
                field("Labour Rate"; Rec."Labour Rate")
                {
                }
                field(VIN; Rec.VIN)
                {
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                }
                field("Process Flag"; Rec."Process Flag")
                {
                }
                field(Francise; Rec.Francise)
                {
                }
                field("Warranty Application Code 3"; Rec."Warranty Application Code 3")
                {
                    Caption = '3';
                }
                field("Warranty Application Code 5"; Rec."Warranty Application Code 5")
                {
                    Caption = '5';
                }
                field("Warranty Application Code 4"; Rec."Warranty Application Code 4")
                {
                    Caption = '4';
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
                field("Exchange Rate"; Rec."Exchange Rate")
                {
                }
                field("Operation No."; Rec."Operation No.")
                {
                }
                field(Hour; Rec.Hour)
                {
                }
                field("Operation No. 2"; Rec."Operation No. 2")
                {
                }
                field("Hour 2"; Rec."Hour 2")
                {
                }
                field("Operation No. 3"; Rec."Operation No. 3")
                {
                }
                field("Hour 3"; Rec."Hour 3")
                {
                }
                field("Labour Total Hour"; Rec."Labour Total Hour")
                {
                }
                field("Labour Amount"; Rec."Labour Amount")
                {
                }
                field("K/M Flg."; Rec."K/M Flg.")
                {
                }
                field("Type Class"; Rec."Type Class")
                {
                }
                field("Data ID"; Rec."Data ID")
                {
                }
            }
            group(Sublet)
            {
                Caption = 'Sublet';
                field("Pay Code Sublet"; Rec."Pay Code Sublet")
                {
                }
                field("Sublet Type"; Rec."Sublet Type")
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
                field("Condition (Description)"; Rec."Condition (Description)")
                {
                }
                field("Cause (Description)"; Rec."Cause (Description)")
                {
                }
                field("Remedy (Description)"; Rec."Remedy (Description)")
                {
                }
                field("O.F.P. No."; Rec."O.F.P. No.")
                {
                }
                field("O.F.P. Local Flag"; Rec."O.F.P. Local Flag")
                {
                }
                field("PRR/PWR"; Rec."PRR/PWR")
                {
                }
                field("Sublet Invoice No."; Rec."Sublet Invoice No.")
                {
                }
                field("T3 Code 2"; Rec."T3 Code 2")
                {
                    Caption = '2';
                }
                field("Sublet Amount"; Rec."Sublet Amount")
                {
                }
                field("T3 Code 3"; Rec."T3 Code 3")
                {
                    Caption = '3';
                }
                field("T3 Code 4"; Rec."T3 Code 4")
                {
                    Caption = '4';
                }
                field("T3 Code 5"; Rec."T3 Code 5")
                {
                    Caption = '5';
                }
                field("T3 Code 6"; Rec."T3 Code 6")
                {
                    Caption = '6';
                }
                field("Parts Part Amount 1"; Rec."Parts Part Amount 1")
                {
                    Caption = 'Amount';
                }
                field("Parts Parts No. 1"; Rec."Parts Parts No. 1")
                {
                    Caption = 'Parts No.';
                }
                field("Parts Part Amount 2"; Rec."Parts Part Amount 2")
                {
                }
                field("Parts Parts No. 2"; Rec."Parts Parts No. 2")
                {
                }
                field("Parts Part Amount 3"; Rec."Parts Part Amount 3")
                {
                }
                field("Parts Parts No. 3"; Rec."Parts Parts No. 3")
                {
                }
                field("Parts Part Amount 4"; Rec."Parts Part Amount 4")
                {
                }
                field("Parts Pay Code 4"; Rec."Parts Pay Code 4")
                {
                }
                field("Parts Part Amount 5"; Rec."Parts Part Amount 5")
                {
                }
                field("Parts Parts No. 5"; Rec."Parts Parts No. 5")
                {
                }
                field("Parts Pay Code 6"; Rec."Parts Pay Code 6")
                {
                }
                field("Part Total"; Rec."Part Total")
                {
                }
                field("T3 Code 7"; Rec."T3 Code 7")
                {
                    Caption = '7';
                }
                field("Parts Part Amount 6"; Rec."Parts Part Amount 6")
                {
                }
            }
            group(Amount)
            {
                Caption = 'Amount';
                field("Dist's Claim Adjust Labor %"; Rec."Dist's Claim Adjust Labor %")
                {
                    Caption = '<Dist''s Claim Adjustment';
                }
                field("Dist. Comment (1)"; Rec."Dist. Comment (1)")
                {
                }
                field("Total Claim Amount"; Rec."Total Claim Amount")
                {
                    Style = Standard;
                    StyleExpr = TRUE;
                }
                field("Dist's Claim Adjust Sublet %"; Rec."Dist's Claim Adjust Sublet %")
                {
                    Caption = 'Sublet %';
                }
                field("Dist's Claim Adjust Parts %"; Rec."Dist's Claim Adjust Parts %")
                {
                    Caption = ' Parts %';
                }
            }
        }
    }

    actions
    {
    }

    var
        Text19048125: Label 'Warranty Application Code';
}

