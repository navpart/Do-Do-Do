page 50109 "Non Registrated Parts"
{
    PageType = Card;
    SourceTable = "Parts Enquiry";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Part No"; Rec."Part No")
                {
                }
                field("Part Description"; Rec."Part Description")
                {
                }
                field("Quantity Demanded"; Rec."Quantity Demanded")
                {
                    Caption = 'Quantity';
                    DecimalPlaces = 0 : 0;
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field(Urgent; Rec.Urgent)
                {
                }
                field(Commited; Rec.Commited)
                {
                }
                field("Request Date"; Rec."Request Date")
                {
                }
                field("Time of Request"; Rec."Time of Request")
                {
                }
                field("Stock Type"; Rec."Stock Type")
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Frequency of Request"; Rec."Frequency of Request")
                {
                }
                field(Ordered; Rec.Ordered)
                {
                }
            }
            group(Details)
            {
                Caption = 'Details';
                field("User ID"; Rec."User ID")
                {
                }
                field("Request by"; Rec."Request by")
                {
                }
                field("Request Customer Name"; Rec."Request Customer Name")
                {
                }
                field("Request Customer Address"; Rec."Request Customer Address")
                {
                }
                field("Request Customer Contact"; Rec."Request Customer Contact")
                {
                }
                field("Request phone"; Rec."Request phone")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("General Prod Posting Group"; Rec."General Prod Posting Group")
                {
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                }
                field(Variant; Rec.Variant)
                {
                }
                field("Commited Value"; Rec."Commited Value")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(List1)
            {
                Caption = 'List';
                action(List)
                {
                    Caption = 'List';
                    RunObject = Page 50110;
                    ShortCutKey = 'Shift+Ctrl+L';
                }
            }
        }
        area(processing)
        {
            action("Register The Item")
            {
                Caption = 'Register The Item';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    IF CONFIRM('Are You Sure You want to register the Parts? ', FALSE) THEN
                        Rec.InsertItem;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CustOnAfterGetCurrRecord;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Entry No":="Entry No"+1;;
        CustOnAfterGetCurrRecord;
    end;

    local procedure CustOnAfterGetCurrRecord()
    begin
        xRec := Rec;
        Rec."Request Date" := TODAY;
        // "Entry No":="Entry No"+1;
    end;
}

