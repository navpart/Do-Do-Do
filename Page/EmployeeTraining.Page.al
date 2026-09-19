page 51052 "Employee Training"
{
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = "Training Courses";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Course Code"; Rec."Course Code")
                {

                    trigger OnAssistEdit()
                    begin
                        IF Rec.AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Training Group"; Rec."Training Group")
                {

                    trigger OnValidate()
                    begin
                        EnableControls
                    end;
                }
                field("Course Type"; Rec."Course Type")
                {
                    Caption = 'Course Group';
                }
                field("Course Name"; Rec."Course Name")
                {
                    Editable = false;
                }
                field("Vendor Code"; Rec."Vendor Code")
                {
                    Enabled = "Vendor CodeEnable";

                    trigger OnValidate()
                    begin

                    end;
                }
                field("Vendor name"; Rec."Vendor name")
                {
                    Editable = false;
                    Enabled = "Vendor nameEnable";
                }
                field("Course Description"; Rec."Course Description")
                {
                    Caption = 'Course Description';
                }
                field(Comment; Rec.Comment)
                {
                    Caption = 'HR Comment';
                }
                field("Course Start Date"; Rec."Course Start Date")
                {
                }
                field(Time; Rec.Time)
                {
                }
                field("Course Duration"; Rec."Course Duration")
                {
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                    Editable = false;
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    Enabled = "Total CostEnable";
                }
            }
            part(Lines; 50069)
            {
                SubPageLink = "Training Course Code" = FIELD("Course Code");
                SubPageView = SORTING("Training Group", "Training Course Code", "Course Line No.");
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        EnableControls
    end;

    trigger OnClosePage()
    begin
        CLEARALL;
    end;

    trigger OnInit()
    begin
        "Vendor nameEnable" := TRUE;
        "Vendor CodeEnable" := TRUE;
        "Total CostEnable" := TRUE;
    end;

    trigger OnModifyRecord(): Boolean

    begin
        IF VendRec.GET(Rec."Vendor Code") THEN
            "Total CostEnable" := TRUE;
    end;

    var
        CatRec: Record 50083;
        TCourseRec: Record 50082;
        TotalCost: Decimal;
        AvgCost: Decimal;
        RecCount: Integer;
        CTypeRec: Record 50081;
        VendRec: Record 23;

        "Total CostEnable": Boolean;

        "Vendor CodeEnable": Boolean;

        "Vendor nameEnable": Boolean;


    procedure EnableControls()
    begin
        IF (Rec."Training Group" = 0) OR (Rec."Training Group" = Rec."Training Group"::"In-House") THEN BEGIN
            "Vendor CodeEnable" := FALSE;
            "Vendor nameEnable" := FALSE;
        END
        ELSE BEGIN
            "Vendor CodeEnable" := TRUE;
            "Vendor nameEnable" := TRUE;
        END
    end;
}

