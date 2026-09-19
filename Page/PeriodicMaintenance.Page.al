page 50282 "Periodic - Maintenance"
{
    PageType = List;
    SourceTable = "VRI Table";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("VRI Code"; Rec."VRI Code")
                {
                }
                field("VRI Date"; Rec."VRI Date")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Item Serial No."; Rec."Item Serial No.")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Key No."; Rec."Key No.")
                {
                }
                field("Exterior Colour"; Rec."Exterior Colour")
                {
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {

                    trigger OnValidate()
                    begin
                        Rec."No. of Due Days" := Rec."Current Date" - Rec."Last Date Modified";
                    end;
                }
                field("Current Date"; Rec."Current Date")
                {

                    trigger OnValidate()
                    begin
                        Rec."No. of Due Days" := Rec."Current Date" - Rec."Last Date Modified";
                    end;
                }
                field("No. of Due Days"; Rec."No. of Due Days")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        IF Rec."Current Date" <> 0D THEN
            Rec.VALIDATE("Current Date", WORKDATE);
    end;
}

