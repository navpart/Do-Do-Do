tableextension 50083 "Service Invoice Header Ext" extends "Service Invoice Header"
{
    fields
    {
        field(50256; "Customer Order No."; Code[20])
        {
            Editable = false;
        }
        field(50257; "Registration No."; Code[20])
        {
            Editable = false;
        }
        field(50261; "Total Line Amount"; Decimal)
        {
            CalcFormula = Sum("Service Invoice Line".Amount WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                "Total VAT Amount" := "Total Line Amount Incl. (VAT)" - "Total Line Amount";
            end;
        }
        field(50262; "Total Line Amount Incl. (VAT)"; Decimal)
        {
            CalcFormula = Sum("Service Invoice Line"."Amount Including VAT" WHERE("Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                "Total VAT Amount" := "Total Line Amount Incl. (VAT)" - "Total Line Amount";
            end;
        }
        field(50263; "Total VAT Amount"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                CALCFIELDS("Total Line Amount");
                CALCFIELDS("Total Line Amount Incl. (VAT)");

                "Total VAT Amount" := "Total Line Amount Incl. (VAT)" - "Total Line Amount";
            end;
        }
        field(50266; "Total Discount Amount"; Decimal)
        {
            CalcFormula = Sum("Service Invoice Line"."Line Discount Amount" WHERE("Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50267; "Total Labour Cost"; Decimal)
        {
            CalcFormula = Sum("Service Invoice Line"."Line Amount" WHERE("Document No." = FIELD("No."),
                                                                          Type = FILTER(Cost),
                                                                          "Job Type" = CONST(GR)));
            Caption = 'Total GR Labour Amount ';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50268; "Total Item Cost"; Decimal)
        {
            CalcFormula = Sum("Service Invoice Line"."Line Amount" WHERE("Document No." = FIELD("No."),
                                                                          Type = FILTER(Item),
                                                                          "Job Type" = CONST(GR)));
            Caption = 'Total GR Items';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50269; "Total DADS Cost"; Decimal)
        {
            CalcFormula = Sum("Service Invoice Line"."Line Amount" WHERE("Document No." = FIELD("No."),
                                                                          Type = FILTER(Cost),
                                                                          Description = FILTER('DAMAGE ACCESSMENT DIAGNOSIS|ESTIMATION CHARGES|DAMAGE ASSESSMENT&DIAGNOSIS COST')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50270; "Salesperson Name"; Text[50])
        {
            Editable = false;
        }
        field(50271; "Total Paint cost"; Decimal)
        {
            CalcFormula = Sum("Service Invoice Line"."Line Amount" WHERE("Document No." = FIELD("No."),
                                                                          Type = FILTER(Item),
                                                                          "Location Code" = FILTER('131PWISOLO'),
                                                                          "Job Type" = filter(BP)));
            Caption = 'Total B&P Materials';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50272; Sundry; Decimal)
        {
            CalcFormula = Sum("Service Invoice Line"."Line Amount" WHERE("Document No." = FIELD("No."),
                                                                          Type = FILTER(Cost),
                                                                          Description = FILTER('SUNDRY')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50273; "Total PM"; Decimal)
        {
            CalcFormula = Sum("Service Invoice Line".Amount WHERE("Document No." = FIELD("No."),
                                                                   Type = CONST(Item),
                                                                   "Job Type" = filter(PM)));
            Caption = 'Total PM Item';
            FieldClass = FlowField;
        }
        field(50274; "Total GR"; Decimal)
        {
            CalcFormula = Sum("Service Invoice Line".Amount WHERE("Document No." = FIELD("No."),
                                                                   Type = CONST(Cost),
                                                                   "Job Type" = CONST(PM)));
            FieldClass = FlowField;
        }
        field(50275; "Total B&P"; Decimal)
        {
            CalcFormula = Sum("Service Invoice Line".Amount WHERE("Document No." = FIELD("No."),
                                                                   Type = FILTER(Cost),
                                                                   "Job Type" = filter(BP)));
            Caption = 'Total B&P Labour';
            FieldClass = FlowField;
        }

        field(50277; "Received Date"; Date)
        {
            /* CalcFormula = Lookup("Customer Order HeaderX"."Reception Date" WHERE ("No."=FIELD("Customer Order No.")));
            FieldClass = FlowField; */
        }
        field(50278; "Delivery Date"; Date)
        {
            CalcFormula = Lookup("Customer Order HeaderX"."Date Delivered" WHERE("No." = FIELD("Customer Order No.")));
            FieldClass = FlowField;
        }
        field(50279; "Model Name"; Text[40])
        {
            CalcFormula = Lookup("Customer Order HeaderX"."Model Name" WHERE("No." = FIELD("Customer Order No.")));
            FieldClass = FlowField;
        }
        field(50280; "Vehicle Classification"; Option)
        {

            OptionCaption = ' ,Gray,TNL Sold';
            OptionMembers = " ",Gray,"TNL Sold";

        }
        field(50281; Brand; Code[20])
        {
            CalcFormula = Lookup("Customer Order HeaderX".Brand WHERE("No." = FIELD("Customer Order No.")));
            FieldClass = FlowField;
        }
        field(50282; "Customer Type"; Option)
        {

            OptionCaption = 'CPUS,Warranty,Internal';
            OptionMembers = CPUS,Warranty,Internal;

        }
        field(50283; "Job Type"; Option)
        {

            OptionCaption = ' ,PM,GR,Others,Warranty,Internal,D/Estimate,BP,BP Estimate,Painting';
            OptionMembers = " ",PM,GR,Others,Warranty,Internal,"D/Estimate",BP,"BP Estimate",Painting;
        }
        field(50284; "Total Labour Amount"; Decimal)
        {
            CalcFormula = Sum("Service Invoice Line".Amount WHERE("Document No." = FIELD("No."),
                                                                   Type = CONST(Cost)));
            FieldClass = FlowField;
        }
        field(50285; "Total B&P Items"; Decimal)
        {
            CalcFormula = Sum("Service Invoice Line".Amount WHERE("Document No." = FIELD("No."), Type = FILTER(Item), "Job Type" = const(BP)));
            FieldClass = FlowField;
        }

        field(50286; "Total Others"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Service Invoice Line".Amount WHERE("Document No." = FIELD("No."), "Job Type" = CONST(Others)));
        }
        field(50287; "Total Warranty"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Service Invoice Line".Amount WHERE("Document No." = FIELD("No."), "Job Type" = CONST(Warranty)));
        }
        field(50288; "Total Empty"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Service Invoice Line".Amount WHERE("Document No." = FIELD("No."), "Job Type" = CONST(" ")));
        }
        field(90000; "IRN"; Text[150])
        {
            Caption = 'IRN';
        }
        field(90001; "Sent to NRS"; Boolean)
        {
            Caption = 'Sent to NRS';
        }
        field(90002; "Error Message"; Text[250])
        {
            Caption = 'Error Message';
        }




    }
    keys
    {
        key(ExtKey1; "Salesperson Code")
        {
        }
        key(ExtKey2; "Customer Order No.")
        {
        }
    }

    Procedure SendeInvoiceToFIRS()
    var
        eInvoiceNRSMgt: Codeunit "eInvoice NRS Mgt.";
    begin
        eInvoiceNRSMgt.SendServiceInvoiceToNRS(Rec);
    end;

}
