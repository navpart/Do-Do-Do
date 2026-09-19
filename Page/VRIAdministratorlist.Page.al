page 50324 "VRI Administrator list"
{
    ApplicationArea = All;
    CardPageID = "VRI Administrator card";
    PageType = List;
    SourceTable = "VRI Inspector";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Status; Rec.Status)
                {
                }
                field(Code; Rec.Code)
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Department; Rec.Department)
                {
                }
                field(Unit; Rec.Unit)
                {
                }
                field(Location; Rec.Location)
                {
                }
                field("Location Name"; Rec."Location Name")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Phone Nos"; Rec."Phone Nos")
                {
                }
            }
        }
    }

    actions
    {
    }
}

