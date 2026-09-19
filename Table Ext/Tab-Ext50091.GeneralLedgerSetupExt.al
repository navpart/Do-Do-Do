tableextension 50091 "General Ledger Setup Ext" extends "General Ledger Setup"
{
    fields
    {
       field(50000;"Password Length";Integer)
        {
        }
        field(50001;"Loan Number Series";Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50002;"Password Reset Interval";DateFormula)
        {
        }
        field(50003;"Warning Days Before Expire";Integer)
        {
        }
        field(50004;"Latest PurchIndentNo";Code[10])
        {
        }
        field(50005;"Latest Purch.OrderNo";Code[10])
        {
        }
        field(50006;"Latest PurchDeliv.No";Code[10])
        {
        }
        field(50007;"xLatest Purch.Inv.No.";Code[10])
        {
        }
        field(50008;"xLatest PurchCrNoteNo";Code[10])
        {
        }
        field(50009;"xLatest Sales OfferNo";Code[10])
        {
        }
        field(50010;"xLatest Sales OrderNo";Code[10])
        {
        }
        field(50011;"xLatest SalesDeliv.No";Code[10])
        {
        }
        field(50012;"xLatest Sales Inv.No";Code[10])
        {
        }
        field(50013;"xLatest SalesCrNoteNo";Code[10])
        {
        }
        field(50014;"xSame No. Series";Boolean)
        {
            BlankZero = true;
        }
        field(50015;"xLatest Int.Note No";Code[10])
        {
        }
        field(50016;"xPurch.Inv.Disc.Acc.";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50017;"xSales Inv.Disc.Acc.";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50018;"xPurchase Charge Acc.";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50019;"xSales Charge Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50020;"xPurch.Cash Disc.Acc.";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50021;"xSales Cash Disc.Acc.";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50022;"xProd.Purch.Booking";Option)
        {
            BlankZero = true;
            OptionMembers = "Product Group","Supplier Group";
        }
        field(50023;"xProd.Sales Booking";Option)
        {
            BlankZero = true;
            OptionMembers = "Product Group","Customer Group";
        }
        field(50024;"xLine Discount Calc.";Option)
        {
            BlankZero = true;
            OptionMembers = "C/P + Quantity","Quantity x C/P";
        }
        field(50025;"Is xInv.No.Changeable";Boolean)
        {
            BlankZero = true;
        }
        field(50026;"xBalance per Voucher";Boolean)
        {
            BlankZero = true;
        }
        field(50027;"xStock Warning";Boolean)
        {
            BlankZero = true;
        }
        field(50029;"xDelivery/Purch.Inv.";Boolean)
        {
            BlankZero = true;
        }
        field(50030;"xDelivery/Sales Inv.";Boolean)
        {
            BlankZero = true;
        }
        field(50035;"xLatest Job No.";Code[20])
        {
        }
        field(50151;"FinanceBudget Cons.";Integer)
        {
            BlankZero = true;
        }
        field(50152;"CustomerBudget Cons.";Integer)
        {
            BlankZero = true;
        }
        field(50153;"SupplierBudget Cons.";Integer)
        {
            BlankZero = true;
        }
        field(50161;"Last Cashreq. No.";Code[10])
        {
        }
        field(50162;"Last Chequereq. No.";Code[10])
        {
        }
        field(50163;"Last ChequeReceipt";Code[10])
        {
        }
        field(50164;"Last CashReceipt";Code[10])
        {
        }
        field(50165;"Last Pick to Worksh.";Code[10])
        {
        }
        field(50166;"Last StockTransfer";Code[10])
        {
        }
        field(50167;"Last Return from W/S";Code[10])
        {
        }
        field(50168;"Last Travelling Sus.";Code[10])
        {
        }
        field(50169;"Last CashInvoice";Code[10])
        {
        }
        field(50170;"Last Correction";Code[10])
        {
        }
        field(50171;"Last BankVoucher";Code[10])
        {
        }
        field(50172;"Last Sundry debit n.";Code[10])
        {
        }
        field(50173;"Last S. Cr. Note No.";Code[10])
        {
        }
        field(50174;"Stk Class. Date";Date)
        {
        }
        field(50175;"Prod. Grp. Filter";Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Inventory Posting Group";
        }
        field(50176;"Location Filter";Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
        field(50177;"stock value";Decimal)
        {
            BlankZero = true;
            TableRelation = "Item Ledger Entry";
        }
        field(50178;"Superior Filter";Code[10])
        {
            
        }
        field(50179;"Bookinggroupdel.";Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Customer Posting Group";
        }
        field(50180;"Type Filter";Option)
        {
            BlankZero = true;
            FieldClass = FlowFilter;
            OptionMembers = Purchase,Sales,Receipt,Issue;
        }
        field(50181;"Last Vouch. For Fuel";Code[10])
        {
        }
        field(50182;"Customer Block";Code[15])
        {
        }
        field(50183;"Supplier Block";Code[15])
        {
        }
        field(50184;"Latest IOU No.";Code[10])
        {
        }
        field(50185;"Internal Profit";Decimal)
        {
            MaxValue = 10;
            MinValue = 0;
        }
        field(50186;"Last GAM Correction";Code[10])
        {
        }
        field(50187;"Stock Quantity";Decimal)
        {
            CalcFormula = Sum("Value Entry"."Invoiced Quantity" WHERE ("Global Dimension 1 Code"=FIELD("Global Dimension 1 Filter"),
                                                                       "Location Code"=FIELD("Location Filter"),
                                                                       "Posting Date"=FIELD("Date Filter")));
            FieldClass = FlowField;
        }
        field(50190;"Latest Obstk Inv. No";Code[10])
        {
        }
        field(50191;"Last O. Cr. Note No.";Code[10])
        {
        }
        field(50200;"Stock Quantity2";Decimal)
        {
            BlankZero = true;
            TableRelation = "Item Ledger Entry";
        }
        field(50201;"LCY Unit";Code[10])
        {
        }
        field(50202;"Dealer Order Request";Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50203;"Cash Requisition No.";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50204;"Cash Receipt No.";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50205;"Cheque Requisition No.";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50206;"Cheque Receipt No.";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50207;"IOU Nos.";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50209;"Retirement Nos.";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50210;"Deposit Nos.";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50211;"Cheque Receipt mgt";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50212;"Journal Voucher No.";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50213;"E-Receipt Voucher No.";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50214;"E-Payment Voucher No.";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50215;"Document Approval";Code[10])
        {
            TableRelation = "No. Series".Code;
        }
    }
}
