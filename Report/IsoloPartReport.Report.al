report 50072 "Isolo Part  Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/IsoloPartReport.rdl';

    dataset
    {
        dataitem(ServInvLineData; "Service Invoice Line")
        {
            DataItemTableView = WHERE("Customer No." = FILTER('TCSC*'));
            RequestFilterFields = "Posting Date";
            column(CustomerNo_ServiceInvoiceLine; "Customer No.")
            {
            }
            column(DocumentNo_ServiceInvoiceLine; "Document No.")
            {
            }
            column(LineNo_ServiceInvoiceLine; "Line No.")
            {
            }
            column(Description_ServiceInvoiceLine; Description)
            {
            }
            column(Type_ServiceInvoiceLine; Type)
            {
            }
            column(No_ServiceInvoiceLine; "No.")
            {
            }
            column(CustomerOrderNo_ServiceInvoiceLine; "Customer Order No.")
            {
            }
            column(GLAccTableCaption2; TABLECAPTION + ': ' + GLFilter2)
            {
            }
            column(GLFilter2; GLFilter2)
            {
            }
            column(Quantity_ServiceInvoiceLine; Quantity)
            {
            }
            column(UnitPrice_ServiceInvoiceLine; "Unit Price")
            {
            }
            column(RegistrationNo_ServiceInvoiceLine; "Registration No.")
            {
            }
            column(UnitCostLCY_ServiceInvoiceLine; "Unit Cost (LCY)")
            {
            }
            column(AmountIncludingVAT_ServiceInvoiceLine; "Amount Including VAT")
            {
            }
            column(CustomerName_ServiceInvoiceLine; "Customer Name")
            {
            }
            column(JobType_ServiceInvoiceLine; "Job Type")
            {
            }
            column(Show_Detail; Hide)
            {
            }

            trigger OnAfterGetRecord()
            begin
                GLFilter2 := GETFILTERS;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Option)
                {
                    field("Show Detail"; Hide)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        GLFilter := ServInvLineData.GETFILTERS;
    end;

    var
        GLDateFilter: Text[30];
        GLFilter: Text;
        GLFilter2: Text;
        Hide: Boolean;
}

