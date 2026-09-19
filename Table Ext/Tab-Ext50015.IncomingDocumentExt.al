tableextension 50015 "Incoming Document Ext" extends "Incoming Document"
{
    fields
    {
        field(50000; "Requisition No."; Code[10])
        {
        }
        field(50002; "Vendor Address"; Text[250])
        {
        }
        field(50003; "Posting Description"; Text[250])
        {
        }
        field(50004; "Payment Terms"; Option)
        {
            OptionCaption = ' ,100%,60%,40%';
            OptionMembers = " ","100%","60%","40%";
        }
        field(50005; "Requisition Date"; Date)
        {
        }
        field(50007; "Requisition Line No."; Integer)
        {
        }
        field(50008; XURL; Text[1024])
        {
            Caption = 'URL';

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if XURL <> '' then
                    URL := XURL
                else
                    URL := '';

            end;
        }


    }


    var
    /*
            CapexHead: Record "70008";
            CapexLine: Record "70001";
            ProcurementLineDetail: Record "70007";
            NoSeries: Codeunit NoSeriesManagement;
            */

    procedure SetProcurementLine(var ProcuretLine: Record "Procurement Line")
    begin
        if ProcuretLine."Incoming Document Entry No." = 0 then
            exit;
        Get(ProcuretLine."Incoming Document Entry No.");
        //TestReadyForProcessing();
        TestIfAlreadyExists();
        "Document Type" := "Document Type"::Journal;
        Modify(true);
        if not DocLinkExists(ProcuretLine) then
            ProcuretLine.AddLink(GetURL(), Description);
    end;




}
