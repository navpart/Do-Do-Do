page 70074 "Customer Order List"
{
    CardPageID = "COF for Preparation";
    PageType = List;
    SourceTable = "Customer Order Table.";
    SourceTableView = WHERE(Delivered = filter(true));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer Order Form No."; Rec."Customer Order Form No.")
                {
                }
                field("Reception Date"; Rec."Reception Date")
                {
                }
                field("Reception Time"; Rec."Reception Time")
                {
                }
                field("Reception Type"; Rec."Reception Type")
                {
                }
                field("Job Type2"; Rec."Job Type2")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                }
                field("General Repair"; Rec."General Repair")
                {
                }
                field(Maintenance2; Rec.Maintenance2)
                {
                    Caption = 'Maintenance';
                }
                field("Diag/Est"; Rec."Diag/Est")
                {
                    Caption = 'Diagnosis/Estimate';
                }
                field(Internal; Rec.Internal)
                {
                }
                field(Warranty; Rec.Warranty)
                {
                }
                field("B & P"; Rec."B & P")
                {
                }
                field("Customer Waiting"; Rec."Customer Waiting")
                {
                }
                field("Repeat Repair"; Rec."Repeat Repair")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Estimate Card")
            {
            }
            action(Card)
            {
                Image = Process;

                trigger OnAction()
                begin

                    IF Rec."Customer's Requests" = Rec."Customer's Requests"::"Walk-In" THEN BEGIN
                        COFRec.SETRANGE(COFRec."Customer Order Form No.", Rec."Customer Order Form No.");
                        IF COFRec.FIND('-') THEN
                            PAGE.RUNMODAL(50393, COFRec)
                    END ELSE BEGIN
                        COFRec.SETRANGE(COFRec."Customer Order Form No.", Rec."Customer Order Form No.");
                        IF COFRec.FIND('-') THEN
                            PAGE.RUNMODAL(70079, COFRec)
                    END;
                end;
            }
        }
    }

    var
        COFRec: Record 50119;
}

