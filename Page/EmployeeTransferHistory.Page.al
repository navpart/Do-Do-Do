page 50309 "Employee Transfer History"
{
    AutoSplitKey = true;
    PageType = Card;
    SourceTable = "Employee Transfer History";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Visible = false;
                }
                field(Name; Rec.Name)
                {
                    Visible = false;
                }
                field(Date; Rec.Date)
                {
                }
                field(Time; Rec.Time)
                {
                }
                field("From Cost Centre"; Rec."From Cost Centre")
                {
                }
                field("To Cost Centre"; Rec."To Cost Centre")
                {
                }
                field("From Department"; Rec."From Department")
                {
                }
                field("To Department"; Rec."To Department")
                {
                }
                field(Remark; Rec.Remark)
                {
                }
            }
        }
    }

    actions
    {
    }
}

