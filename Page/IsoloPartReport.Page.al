page 80070 "Isolo Part Report"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Service Invoice Line";
    SourceTableView = WHERE("Customer No." = FILTER('TCSC*'),
                            "Type" = FILTER('Item'),
                            "Posting Group" = FILTER('N_PARTCONS|N_PARTS'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Line No."; Rec."Line No.")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("No."; Rec."No.")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Posting Group"; Rec."Posting Group")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Description 2"; Rec."Description 2")
                {
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                }
                field("VAT %"; Rec."VAT %")
                {
                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                }
                field("Allow Invoice Disc."; Rec."Allow Invoice Disc.")
                {
                }
                field("Gross Weight"; Rec."Gross Weight")
                {
                }
                field("Net Weight"; Rec."Net Weight")
                {
                }
                field("Units per Parcel"; Rec."Units per Parcel")
                {
                }
                field("Unit Volume"; Rec."Unit Volume")
                {
                }
                field("Appl.-to Item Entry"; Rec."Appl.-to Item Entry")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field("Customer Price Group"; Rec."Customer Price Group")
                {
                }
                field("Work Type Code"; Rec."Work Type Code")
                {
                }
                field("Shipment No."; Rec."Shipment No.")
                {
                }
                field("Shipment Line No."; Rec."Shipment Line No.")
                {
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                }
                field("Inv. Discount Amount"; Rec."Inv. Discount Amount")
                {
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                }
                field("VAT Calculation Type"; Rec."VAT Calculation Type")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Transport Method"; Rec."Transport Method")
                {
                }
                field("Attached to Line No."; Rec."Attached to Line No.")
                {
                }
                field("Exit Point"; Rec."Exit Point")
                {
                }
                field("Area"; Rec."Area")
                {
                }
                field("Transaction Specification"; Rec."Transaction Specification")
                {
                }
                field("Tax Area Code"; Rec."Tax Area Code")
                {
                }
                field("Tax Liable"; Rec."Tax Liable")
                {
                }
                field("Tax Group Code"; Rec."Tax Group Code")
                {
                }
                field("VAT Clause Code"; Rec."VAT Clause Code")
                {
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                }
                field("VAT Base Amount"; Rec."VAT Base Amount")
                {
                }
                field("System-Created Entry"; Rec."System-Created Entry")
                {
                }
                field("Line Amount"; Rec."Line Amount")
                {
                }
                field("VAT Difference"; Rec."VAT Difference")
                {
                }
                field("VAT Identifier"; Rec."VAT Identifier")
                {
                }
                field("Pmt. Discount Amount"; Rec."Pmt. Discount Amount")
                {
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                }
                field("Variant Code"; Rec."Variant Code")
                {
                }
                field("Bin Code"; Rec."Bin Code")
                {
                }
                field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
                {
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                }
                field("Quantity (Base)"; Rec."Quantity (Base)")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Substitution Available"; Rec."Substitution Available")
                {
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                }
                field(Nonstock; Rec.Nonstock)
                {
                }
                field("Service Item No."; Rec."Service Item No.")
                {
                }
                field("Appl.-to Service Entry"; Rec."Appl.-to Service Entry")
                {
                }
                field("Service Item Line No."; Rec."Service Item Line No.")
                {
                }
                field("Service Item Serial No."; Rec."Service Item Serial No.")
                {
                }
                field("Service Item Line Description"; Rec."Service Item Line Description")
                {
                }
                field("Serv. Price Adjmt. Gr. Code"; Rec."Serv. Price Adjmt. Gr. Code")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Needed by Date"; Rec."Needed by Date")
                {
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                }
                field("Quantity Consumed"; Rec."Quantity Consumed")
                {
                }
                field("Qty. Consumed (Base)"; Rec."Qty. Consumed (Base)")
                {
                }
                field("Service Price Group Code"; Rec."Service Price Group Code")
                {
                }
                field("Fault Area Code"; Rec."Fault Area Code")
                {
                }
                field("Symptom Code"; Rec."Symptom Code")
                {
                }
                field("Fault Code"; Rec."Fault Code")
                {
                }
                field("Resolution Code"; Rec."Resolution Code")
                {
                }
                field("Exclude Warranty"; Rec."Exclude Warranty")
                {
                }
                field(Warranty; Rec.Warranty)
                {
                }
                field("Contract No."; Rec."Contract No.")
                {
                }
                field("Contract Disc. %"; Rec."Contract Disc. %")
                {
                }
                field("Warranty Disc. %"; Rec."Warranty Disc. %")
                {
                }
                field("Component Line No."; Rec."Component Line No.")
                {
                }
                field("Spare Part Action"; Rec."Spare Part Action")
                {
                }
                field("Fault Reason Code"; Rec."Fault Reason Code")
                {
                }
                field("Replaced Item No."; Rec."Replaced Item No.")
                {
                }
                field("Exclude Contract Discount"; Rec."Exclude Contract Discount")
                {
                }
                field("Replaced Item Type"; Rec."Replaced Item Type")
                {
                }
                field("Price Adjmt. Status"; Rec."Price Adjmt. Status")
                {
                }
                field("Line Discount Type"; Rec."Line Discount Type")
                {
                }
                field("Copy Components From"; Rec."Copy Components From")
                {
                }
                field("Return Reason Code"; Rec."Return Reason Code")
                {
                }
                field("Allow Line Disc."; Rec."Allow Line Disc.")
                {
                }
                field("Customer Disc. Group"; Rec."Customer Disc. Group")
                {
                }
                field(WSR; Rec.WSR)
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Customer Order No."; Rec."Customer Order No.")
                {
                }
                field("Registration No."; Rec."Registration No.")
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Job Type"; Rec."Job Type")
                {
                }
                field("Local Buys"; Rec."Local Buys")
                {
                }
                field("Invt. Post. Grp"; Rec."Invt. Post. Grp")
                {
                }
                field(VIN; Rec.VIN)
                {
                }
            }
        }
    }

    actions
    {
    }
}

