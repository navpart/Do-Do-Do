page 50037 "Model List"
{
    CardPageID = "Parts By Model Card";
    DeleteAllowed = false;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = Model;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                // field("Model Description"; Rec."Model Description")
                // {
                // }
                // field(unitinoperation; Rec.unitinoperation)
                // {
                //     Caption = 'Units in Operation';
                //     DecimalPlaces = 0 : 0;
                // }
                field("Total Qty Sold"; Rec."Total Qty Sold")
                {

                }
                field("Line Items"; Rec."Line Items")
                {

                }
                field("Line Items with Stock Q'ty"; Rec."Line Items with Stock Q'ty")
                {

                }
                // field("Inventory Line Item"; Rec."Inventory Line Item")
                // {
                // }
                // field("Other Specification"; Rec."Other Specification")
                // {
                // }
                // field("Prod Date"; Rec."Prod Date")
                // {
                // }
                field("Line No."; Rec."Line No.")
                {

                }
            }
        }
    }

    actions
    {
    }
}

