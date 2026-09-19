report 50323 "Appointment Customer List"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/AppointmentCustomerList.rdl';

    dataset
    {
        dataitem(DataItem2792; "Service Appointment Scheduled")
        {
            DataItemTableView = SORTING("Service Item", "Service Code");
            RequestFilterFields = "Service Item", "Next Call Date.";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; USERID)
            {
            }
            column(Service_Appointment_Scheduled__Next_Call_Date__; "Next Call Date.")
            {
            }
            column(Service_Appointment_Scheduled__Customer_Name_; "Customer Name")
            {
            }
            column(Service_Appointment_Scheduled__Service_Item_; "Service Item")
            {
            }
            column(Service_Appointment_Scheduled__Customer_No__; "Customer No.")
            {
            }
            column(Service_Appointment_Scheduled_Description; Description)
            {
            }
            column(Service_Appointment_Scheduled__Contact_Person_; "Contact Person")
            {
            }
            column(Service_Appointment_Scheduled__Phone_No_1__; "Phone No 1.")
            {
            }
            column(Service_Appointment_Scheduled__Model_Code_; "Model Code")
            {
            }
            column(Service_Appointment_ScheduledCaption; Service_Appointment_ScheduledCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Service_Appointment_Scheduled__Next_Call_Date__Caption; FIELDCAPTION("Next Call Date."))
            {
            }
            column(Service_Appointment_Scheduled__Service_Item_Caption; FIELDCAPTION("Service Item"))
            {
            }
            column(Service_Appointment_Scheduled__Customer_No__Caption; FIELDCAPTION("Customer No."))
            {
            }
            column(Service_Appointment_Scheduled_DescriptionCaption; FIELDCAPTION(Description))
            {
            }
            column(Service_Appointment_Scheduled__Contact_Person_Caption; FIELDCAPTION("Contact Person"))
            {
            }
            column(Phone_No_Caption; Phone_No_CaptionLbl)
            {
            }
            column(Service_Appointment_Scheduled__Customer_Name_Caption; FIELDCAPTION("Customer Name"))
            {
            }
            column(Service_Appointment_Scheduled__Model_Code_Caption; FIELDCAPTION("Model Code"))
            {
            }
            column(Service_Appointment_Scheduled_Service_Code; "Service Code")
            {
            }

            trigger OnAfterGetRecord()
            begin
                SETRANGE("Next Call Date.", TODAY);
                "Next Call Date." := TODAY;
                IF CusRec.GET("Customer No.") THEN BEGIN
                    VALIDATE("Customer No.");
                    "Contact Person" := CusRec.Contact;
                    "Phone No 1." := CusRec."Phone No.";
                END;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Service Item");
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        CusRec: Record 18;
        Service_Appointment_ScheduledCaptionLbl: Label 'Service Appointment Scheduled';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Phone_No_CaptionLbl: Label 'Phone No.';
}

