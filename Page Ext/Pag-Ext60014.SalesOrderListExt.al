namespace AL_TNL.AL_TNL;

using Microsoft.Sales.Document;
using System.Security.User;

pageextension 60014 "Sales Order List Ext" extends "Sales Order List"
{
    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.get(USERID);
        Rec.FilterGroup(2);
        Rec.SetRange("Shortcut Dimension 1 Code", UserSetup.Department);
        Rec.FilterGroup(0);
    end;
}

