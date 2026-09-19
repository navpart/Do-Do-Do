page 80006 "Fault Material Setup List"
{
    PageType = List;
    CardPageID = "Fault Material Card";
    Editable = false;
    SourceTable = "Fault Setup Header";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Operation Code"; Rec."Operation Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }

            }
        }
    }

}

