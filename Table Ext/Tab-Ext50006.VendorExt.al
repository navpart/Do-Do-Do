tableextension 50006 "Vendor Ext" extends Vendor
{
    fields
    {
        field(50182;Administrator;Boolean)
        {
        }
        field(50183;"Name of deceased";Text[30])
        {
        }
        field(50184;Shareholder;Boolean)
        {
        }
        field(50185;"BankNo.";Code[15])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(50186;Bankmandate;Boolean)
        {
        }
        field(50187;"Number of shares";Decimal)
        {
        }
        field(50200;"Supplier 2nd";Code[20])
        {
        }
        field(50203;"Currency adj.";Code[10])
        {
        }
        field(50204;Department;Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1,"Global Dimension 1 Code");
                MODIFY;
            end;
        }
        field(50205;"Intest rate";Decimal)
        {
        }
        field(50206;"Budget Delimitation";Code[10])
        {
        }
        field(50207;Budgeted;Decimal)
        {
        }
        field(50208;"Original-NAIRAmount";Decimal)
        {
        }
        field(50209;Currencyadjusted;Decimal)
        {
        }
        field(50210;"Imported on";Date)
        {
        }
        field(50211;"Aut. Exch. Rate Adj.";Boolean)
        {
        }
        field(50220;"Balance Due by Posting Date";Decimal)
        {
            
            FieldClass = FlowField;
            CalcFormula = -Sum("Detailed Vendor Ledg. Entry"."Amount (LCY)" WHERE ("Vendor No."=FIELD("No."),
                                                                                   "Posting Date"=FIELD("Date Filter"),
                                                                                   "Currency Code"=FIELD("Currency Filter"),
                                                                                   "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter")));
            Description = 'Inserted for the purpose of Customer Ageing report.';
            Editable = false;
            
        }
        field(50251;InterestPercentage;Decimal)
        {
        }
        field(50252;State;Code[10])
        {
        }
        field(50253;"Address 3";Text[30])
        {
        }
        field(50254;"P.O.Box";Text[15])
        {
        }
        field(50255;"Is Supplier OK";Boolean)
        {
        }
        field(60000;Hospital;Boolean)
        {
        }
        field(60001;Trainer;Boolean)
        {
        }
        field(60002;"Course Type Filter";Code[30])
        {
        }
        field(60003;"Training Cost";Decimal)
        {
            /*
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = Sum("Training Courses"."Total Cost" WHERE ("Vendor Code"=FIELD("No.")));
            DecimalPlaces = 2:2;
            */
        }
        field(60004;"Treatment Cost-This Period";Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2:2;
        }
        field(60005;"Treatment Cost-YTD";Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2:2;
        }
        field(60006;"Old No.";Code[10])
        {
        }
        field(60007;"Workshop Service Supplier";Boolean)
        {
        }
        field(60008;"Corporate No.";Code[20])
        {
            TableRelation = Customer."No." WHERE ("Customer Category"=CONST(Corporate));
        }
        field(60009;Occupation;Text[30])
        {
        }
        field(60010;"Type of ID";Option)
        {
            OptionCaption = ' ,Driver License,National ID,Int. Passport,RC No';
            OptionMembers = " ","Driver License","National ID","Int. Passport","RC No";
        }
        field(60011;"Birthday/Date of Incorp";Date)
        {
        }
        field(60012;"Contact 2";Text[30])
        {
        }
    }
}
