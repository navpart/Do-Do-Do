pageextension 50013 "Item Tracking Summary Ext" extends "Item Tracking Summary"
{
    layout
    {
        addafter("Serial No.")
        {
            field("Purchase Date"; Rec."Purchase Date")
            {
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field("Engine No."; Rec."Engine No.")
            {
                ApplicationArea = All;
                Visible = true;
                Editable = false;

            }
            field("Exterior Colour Code"; Rec."Exterior Colour Code")
            {
                ApplicationArea = All;
                Visible = true;
                Editable = false;

            }
            field("Exterior Colour Name"; Rec."Exterior Colour Name")
            {
                ApplicationArea = All;
                Visible = true;
                Editable = false;

            }
            field("Key No."; Rec."Key No.")
            {
                ApplicationArea = All;
                Visible = true;
                Editable = false;

            }
            field(Arrived; Rec.Arrived)
            {
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field("Problem Vehicle"; Rec."Problem Vehicle")
            {
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field("Pass to Sales"; Rec."Pass to Sales")
            {
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field(Fixed; Rec.Fixed)
            {
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
        }
    }
    var
        ItemLedgEntry: Record "Item Ledger Entry";
        ItemLedgEntry2: Record "Item Ledger Entry";
        VRIRec: Record "VRI Table";
        VRIRec2: Record "VRI Table";
        VRIRec3: Record "VRI Table";
        VRIRec4: Record "VRI Table";
        PageJustOpened: Boolean;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        ItemLedgEntry.SETCURRENTKEY("Serial No.");
        ItemLedgEntry.SETRANGE(ItemLedgEntry."Serial No.", Rec."Serial No.");
        IF ItemLedgEntry.FINDFIRST THEN BEGIN
            Rec."Purchase Date" := ItemLedgEntry."Purchase Date";
            Rec."Exterior Colour Name" := ItemLedgEntry."Exterior Colour Name";
            Rec."Exterior Colour Code" := ItemLedgEntry."Exterior Colour Code";
            Rec."Engine No." := ItemLedgEntry."Engine No.";
            Rec."Key No." := ItemLedgEntry."Key No.";
            Rec."Problem Vehicle" := ItemLedgEntry."Problem Vehicle";
            Rec.MODIFY;
        END;

        VRIRec.SETCURRENTKEY("Item Serial No.");
        VRIRec.SETRANGE("Item Serial No.", Rec."Serial No.");
        IF VRIRec.FINDFIRST THEN BEGIN
            IF VRIRec.Arrived = TRUE THEN BEGIN
                Rec.Arrived := TRUE;
                Rec."VRI Code" := VRIRec."VRI Code";
                Rec.Fixed := VRIRec.Fixed;
            END;
        END;

        VRIRec2.SETCURRENTKEY("Item Serial No.");
        VRIRec2.SETRANGE("Item Serial No.", Rec."Serial No.");
        IF VRIRec2.FINDFIRST THEN BEGIN
            IF VRIRec2."Problem Vehicle" = TRUE THEN
                Rec."Problem Vehicle" := TRUE;
        END;

        VRIRec3.SETCURRENTKEY("Item Serial No.");
        VRIRec3.SETRANGE("Item Serial No.", Rec."Serial No.");
        IF VRIRec3.FINDFIRST THEN BEGIN
            IF VRIRec3."Pass to Sales/Marketing" = TRUE THEN
                Rec."Pass to Sales" := TRUE;
        END;

        VRIRec4.SETCURRENTKEY("Item Serial No.");
        VRIRec4.SETRANGE("Item Serial No.", Rec."Serial No.");
        IF VRIRec4.FINDFIRST THEN
            Rec."VRI Code" := VRIRec4."VRI Code";
    end;

    trigger OnOpenPage()
    var
        EntrySummary: Record "Entry Summary";
    begin
        // Clear all auto-selected quantities
        EntrySummary.Copy(Rec, true);
        if EntrySummary.FindSet(true) then
            repeat
                EntrySummary."Selected Quantity" := 0;
                EntrySummary.Modify();
            until EntrySummary.Next() = 0;

        CurrPage.Update(true);
    end;

    trigger OnAfterGetCurrRecord()
    begin
        // Force page update to recalculate totals after clearing selections
        if PageJustOpened then begin
            PageJustOpened := false;
            CurrPage.Update(false);
        end;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        PageJustOpened := true;
    end;

}
