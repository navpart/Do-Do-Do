namespace AL_TNL.AL_TNL;

using Microsoft.Finance.Dimension;

report 50021 "Delete DimSetTreeNode"
{
    ApplicationArea = All;
    Caption = 'Delete DimSetTreeNode';
    UsageCategory = Lists;
    ProcessingOnly = true;
    Permissions = tabledata "Dimension Set Tree Node" = rimd;

    dataset
    {
        dataitem(DimensionSetTreeNode; "Dimension Set Tree Node")
        {
            trigger OnAfterGetRecord()
            begin

                DeleteAll();
            end;
        }

    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
