page 50461 "ISPV Card 2"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Logistics Order";
    SourceTableView = WHERE(Completed = FILTER(false),
                            "Estimate Approval" = FILTER(false),
                            "VRI To WShop" = FILTER(True),
                            "O/L Approval" = FILTER(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Order No."; Rec."Order No.")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Chassis No."; Rec."Chassis No.")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Model; Rec.Model)
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Colour Name"; Rec."Colour Name")
                {
                }
                field("KM Reading"; Rec."KM Reading")
                {
                }
                field("Fuel Level"; Rec."Fuel Level")
                {
                }
                field("No. of Keys"; Rec."No. of Keys")
                {
                }
                field("Job Description"; Rec."Job Description")
                {
                }
                field("VRI Code"; Rec."VRI Code")
                {
                    Editable = false;
                }
                field(Location; Rec.Location)
                {
                }
                field("Arrival Date"; Rec."Arrival Date")
                {
                }
                field("Date of Problem Report"; Rec."Date of Problem Report")
                {
                }
                field("Sent By"; Rec."Sent By")
                {
                }
            }
            group(Workshop)
            {
                Caption = 'Workshop';
                field("VRI Comment To O/L"; Rec."VRI Comment To O/L")
                {
                }
                field("Responsible Customer"; Rec."Responsible Customer")
                {
                }
                field("Generate COF"; Rec."Generate COF")
                {
                }
               /*  field("COF No."; Rec."COF No.")
                {
                    Editable = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        COFRec.SETCURRENTKEY("Customer Order Form No.");
                        COFRec.SETRANGE("Customer Order Form No.", Rec."COF No.");
                        //IF FORM.RUNMODAL(50382,COFRec) = ACTION::LookupOK THEN;
                    end;
                } */
                field("Estimate Approval"; Rec."Estimate Approval")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        COFRec: Record 50119;
}

