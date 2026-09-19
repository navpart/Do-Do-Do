namespace AL_TNL.AL_TNL;

using Microsoft.HumanResources.Employee;

pageextension 50035 "Employee List Ext" extends "Employee List"
{

    layout
    {
        addafter("Last Name")
        {
            field(Grade; Rec.Designation)
            {
                ApplicationArea = All;
            }
            field(Designation; Rec.Grade)
            {
                ApplicationArea = All;
            }
            field("Annual Leave Duration"; Rec."Annual Leave Duration")
            {
                ApplicationArea = All;
            }
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
            }
            field("Marital Status"; Rec."Marital Status")
            {
                ApplicationArea = All;
            }
            field(Bank; Rec.Bank)
            {
                ApplicationArea = All;
            }
            field("Bank Account"; Rec."Bank Account")
            {
                ApplicationArea = All;
            }
            field(Qualification; Rec.Qualification)
            {
                ApplicationArea = All;
            }
            field(Gender; Rec.Gender)
            {
                ApplicationArea = All;
            }
            field("Birth Date"; Rec."Birth Date")
            {
                ApplicationArea = All;
            }
            field(Address; Rec.Address)
            {
                ApplicationArea = All;
            }
            field("Employment Date"; Rec."Employment Date")
            {
                ApplicationArea = All;
            }
            field("Employment Month"; Rec."Employment Month")
            {
                ApplicationArea = All;
            }
            field(Blocked; Rec.Blocked)
            {
                ApplicationArea = All;
            }
            field(Status; Rec.Status)
            {
                ApplicationArea = All;
            }
            field("Inactive Date"; Rec."Inactive Date")
            {
                ApplicationArea = All;
            }
        }
    }


    trigger OnOpenPage()
    var

    begin
        Rec.SetRange(Blocked, false);
    end;

}
