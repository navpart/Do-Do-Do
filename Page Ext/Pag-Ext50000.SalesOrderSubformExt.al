pageextension 50000 "Sales Order Subform Ext" extends "Sales Order Subform"
{
    layout
    {
        modify("Unit Price")
        {
            Editable = EditableField;
        }


        modify("Variant Code")
        {
            Visible = true;
        }

        addafter("Location Code")
        {
            field(Accessory; Rec.Accessory)
            {
                ApplicationArea = All;
                Editable = false;
            }
        }

        addafter("Line Amount")
        {
            field("Discount Inc.Vat"; Rec."Discount Inc.Vat")
            {
                ApplicationArea = All;
            }
            field("Line Dis.Amt Inc Vat"; Rec."Line Dis.Amt Inc Vat")
            {
                ApplicationArea = All;
            }
        }
        addbefore(Quantity)
        {
            field("Quantity Demanded"; Rec."Quantity Demanded")
            {
                ApplicationArea = All;
                Visible = true;
            }
        }


    }

    var
        EditableField: Boolean;
        UserSetup: Record "User Setup";

    trigger OnAfterGetRecord()

    Begin
        UserSetup.get(UserId);
        IF UserSetup."Unit Price Approval" then
            EditableField := true
        else
            EditableField := false;
    End;
}
