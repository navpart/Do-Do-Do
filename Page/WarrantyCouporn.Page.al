page 50111 "Warranty Couporn"
{
    ApplicationArea = All;
    AutoSplitKey = true;
    Caption = 'Warranty Couporn';
    CardPageID = "Toyota Warranty Registration";
    DelayedInsert = true;
    Editable = true;
    MultipleNewLines = true;
    PageType = List;
    PopulateAllFields = true;
    SourceTable = "Warranty Coupon";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Dealer's No."; Rec."Dealer's No.")
                {
                }
                field("Dealer's Name"; Rec."Dealer's Name")
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Chassis Number"; Rec."Chassis Number")
                {
                    Editable = false;
                }
                field("Engine  Number"; Rec."Engine  Number")
                {
                }
                field("Ledger No."; Rec."Ledger No.")
                {
                    DrillDownPageID = "Item Tracking Entries Form";
                    LookupPageID = "Item Tracking Entries Form";
                }
                field(VIN; Rec.VIN)
                {
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                }
                field("Owner's Name"; Rec."Owner's Name")
                {
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                }
                field("Warranty Cop Rec. Date"; Rec."Warranty Cop Rec. Date")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field(City; Rec.City)
                {
                }
                field("Delay Days"; Rec."Delay Days")
                {
                    Editable = false;
                }
                field("Post Code"; Rec."Post Code")
                {
                }
                field(State; Rec.State)
                {
                }
                field("Owner Type"; Rec."Owner Type")
                {
                }
                field("Business Sector"; Rec."Business Sector")
                {
                }
                field("Contact Persons"; Rec."Contact Persons")
                {
                }
                field("Attach FTR"; Rec."Attach FTR")
                {
                    Visible = false;
                }
                field("Attach TWC"; Rec."Attach TWC")
                {
                    Visible = false;
                }
                field("Original Speedometer Rep Date"; Rec."Original Speedometer Rep Date")
                {
                    Visible = false;
                }
                field("Original Speedometer Rep at"; Rec."Original Speedometer Rep at")
                {
                    Visible = false;
                }
                field("Owner Age"; Rec."Owner Age")
                {
                }
                field("Owner Sex"; Rec."Owner Sex")
                {
                }
                field("Driver Name"; Rec."Driver Name")
                {
                }
                field("Mobile Phone"; Rec."Mobile Phone")
                {
                }
                field(Phone; Rec.Phone)
                {
                }
                field("Fax Line"; Rec."Fax Line")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                    Visible = false;
                }
                field("Document Code"; Rec."Document Code")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Attachment")
            {
                Caption = '&Attachment';
                action(Open)
                {
                    Caption = 'Open';
                    ShortCutKey = 'Return';

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Warranty Coupon";
                    begin
                        IF InteractTemplLanguage.GET(Rec.VIN) THEN;
                        //  InteractTemplLanguage.OpenAttachment;
                    end;
                }
                action(Create)
                {
                    Caption = 'Create';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Warranty Coupon";
                    begin
                        /*IF NOT InteractTemplLanguage.GET(VIN) THEN BEGIN
                          InteractTemplLanguage.INIT;
                          InteractTemplLanguage."Interaction Template Code" := Code;
                          InteractTemplLanguage."Language Code" := "Language Code (Default)";
                          InteractTemplLanguage.Description := Description;
                          InteractTemplLanguage.INSERT;
                        END;
                        */
                        IF InteractTemplLanguage.GET(Rec.VIN) THEN;
                        //InteractTemplLanguage.CreateAttachment;
                        //CurrPage.UPDATE;

                    end;
                }
                action("Copy &from")
                {
                    Caption = 'Copy &from';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Warranty Coupon";
                    begin
                        /*IF NOT InteractTemplLanguage.GET(Code,"Language Code (Default)") THEN BEGIN
                          InteractTemplLanguage.INIT;
                          InteractTemplLanguage."Interaction Template Code" := Code;
                          InteractTemplLanguage."Language Code" := "Language Code (Default)";
                          InteractTemplLanguage.Description := Description;
                          InteractTemplLanguage.INSERT;
                          COMMIT;
                        END;
                        */
                        IF InteractTemplLanguage.GET(Rec.VIN) THEN;
                        //InteractTemplLanguage.CopyFromAttachment;
                        //CurrPage.UPDATE;

                    end;
                }
                action(Import)
                {
                    Caption = 'Import';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Warranty Coupon";
                    begin
                        /*IF NOT InteractTemplLanguage.GET(Code,"Language Code (Default)") THEN BEGIN
                          InteractTemplLanguage.INIT;
                          InteractTemplLanguage."Interaction Template Code" := Code;
                          InteractTemplLanguage."Language Code" := "Language Code (Default)";
                          InteractTemplLanguage.Description := Description;
                          InteractTemplLanguage.INSERT;
                        END;
                        */
                        IF InteractTemplLanguage.GET(Rec.VIN) THEN;
                        //InteractTemplLanguage.ImportAttachment;
                        //CurrPage.UPDATE;

                    end;

                }
                action("E&xport")
                {
                    Caption = 'E&xport';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Warranty Coupon";
                    begin
                        IF InteractTemplLanguage.GET(Rec.VIN) THEN;
                        //  InteractTemplLanguage.ExportAttachment;
                    end;
                }
                action(Remove)
                {
                    Caption = 'Remove';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Warranty Coupon";
                    begin
                        IF InteractTemplLanguage.GET(Rec.VIN) THEN;
                        //  InteractTemplLanguage.RemoveAttachment(TRUE);
                    end;
                }
            }
        }
    }
}

