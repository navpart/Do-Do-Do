pageextension 50004 "Item Card Ext" extends "Item Card"
{

    layout
    {
        modify("Unit Cost")
        {
            Caption = 'Landing Cost (AVG)';
            Editable = false;
        }
        modify("Last Direct Cost")
        {
            Caption = 'FOB (Current)';
            Editable = false;
        }

        addafter("Unit Cost")
        {
            field("FOB (FIXED)"; Rec."FOB (FIXED)")
            {
                Caption = 'FOB (Fixed)';
                ApplicationArea = All;
                Editable = false;
            }
        }
        addafter("Unit Cost")
        {
            field("Fixed Cost"; Rec."Fixed Cost")
            {
                Caption = 'Landing Cost (Fixed)';
                ApplicationArea = All;
                Editable = false;
            }
        }

        addbefore("Profit %")
        {
            field("TNL Profit %"; Rec."TNL Profit %")
            {
                ApplicationArea = All;
            }
        }



        addafter(Warehouse)
        {
            group(OtherInformation)
            {
                Caption = 'Other Information';

                field("Model No."; Rec."Model No.")
                {
                    ApplicationArea = Basic, Suite;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        IF Rec."Item Type" = Rec."Item Type"::"Non-Stock" THEN
                            Rec.TESTFIELD("Item Source");
                    end;
                }
                field("Model Name"; Rec."Model Name")
                {
                    ApplicationArea = Basic, Suite;
                    ShowMandatory = true;
                }
                field("Item No Category"; Rec."Item No Category")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Degree; Rec.Degree)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Item Color"; Rec."Item Color")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Pre-Owned Colour"; Rec."Pre-Owned Colour")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Year of Production"; Rec."Year of Production")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Estimated Mileage"; Rec."Estimated Mileage")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Product Code"; Rec."Product Code")
                {
                    ApplicationArea = Basic, Suite;
                    ShowMandatory = true;
                }
                field("Part Category"; Rec."Part Category")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Part Group"; Rec."Part Group")
                {
                    ApplicationArea = Basic, Suite;
                    ShowMandatory = true;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic, Suite;
                    ShowMandatory = true;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic, Suite;
                    ShowMandatory = true;
                }
                field("Isolo Shelf No."; Rec."Isolo Shelf No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Isolo Shelf No.';
                }
                field("Net Change"; Rec."Net Change")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Stockvalue."; Rec."Stockvalue.")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Item Price Group"; Rec."Item Price Group")
                {
                    ApplicationArea = Basic, Suite;
                    ShowMandatory = true;
                }
                field("Lekki Inventory"; Rec."Lekki Inventory")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Dojo Inventory"; Rec."Dojo Inventory")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Dojo Oregun  Inventory"; Rec."Dojo Oregun  Inventory")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Abuja Inventory"; Rec."Abuja Inventory")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("PortHarcourt Inventory"; Rec."PortHarcourt Inventory")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Engine; Rec.Engine)
                {
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }

    actions
    {
        addafter(History)
        {
            action(UpdateSellingPrice)
            {
                ApplicationArea = All;
                Caption = 'Update Selling Price';
                Image = UpdateUnitCost;
                ToolTip = 'Updates the Unit Price for this item based on the Item Price Group settings.';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ItemPriceGrp: Record "Item Price Group";
                begin
                    ItemPriceGrp.UpdateSellingPriceForItem(Rec."No.");
                end;
            }
        }
    }
}