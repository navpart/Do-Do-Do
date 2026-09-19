report 50442 "Pool Car Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/PoolCarReport.rdl';

    dataset
    {
        dataitem(DataItem1000000000; "Pool Car Allocation")
        {
            RequestFilterFields = "Allocation No.", "Registration No.", "Pickup Date";
            column(CompanyData_Name; CompanyData.Name)
            {
            }
            column(CompanyData_Address; CompanyData.Address)
            {
            }
            column(CompanyData__Address_2_; CompanyData."Address 2")
            {
            }
            column(CompanyData_City; CompanyData.City)
            {
            }
            column(CompanyData__Address_4_; CompanyData."Address 4")
            {
            }
            column(Tel_____CompanyData__Internation_phone_; 'Tel.: ' + CompanyData."Internation phone")
            {
            }
            column(CompanyData__Phone_No__; CompanyData."Phone No.")
            {
            }
            column(CompanyData__Phone_No__2_; CompanyData."Phone No. 2")
            {
            }
            column(Fax____CompanyData__Fax_No__; 'Fax: ' + CompanyData."Fax No.")
            {
            }
            column(Reg__No_____CompanyData__Registration_No__; 'Reg. No.: ' + CompanyData."Registration No.")
            {
            }
            column(Vat_No_____CompanyData__VAT_Reg__No__; 'Vat No.: ' + CompanyData."VAT Reg. No.")
            {
            }
            column(CompanyAddr1; CompanyAddr[1])
            {
            }
            column(CompanyAddr2; CompanyAddr[2])
            {
            }
            column(CompanyAddr3; CompanyAddr[3])
            {
            }
            column(CompanyAddr4; CompanyAddr[4])
            {
            }
            column(CompanyAddr5; CompanyAddr[5])
            {
            }
            column(CompanyAddr6; CompanyAddr[6])
            {
            }
            column(CompanyAddr7; CompanyAddr[7])
            {
            }
            column(CompanyAddr8; CompanyAddr[8])
            {
            }
            column(CustomerAddr_1_; CustomerAddr[1])
            {
            }
            column(CustomerAddr_2_; CustomerAddr[2])
            {
            }
            column(CustomerAddr_3_; CustomerAddr[3])
            {
            }
            column(CustomerAddr_4_; CustomerAddr[4])
            {
            }
            column(CustomerAddr_5_; CustomerAddr[5])
            {
            }
            column(CustomerAddr_6_; CustomerAddr[6])
            {
            }
            column(CustomerAddr_7_; CustomerAddr[7])
            {
            }
            column(CustomerAddr_8_; CustomerAddr[8])
            {
            }
            column(PickupTime_PoolCarAllocation; "Pickup Time")
            {
            }
            column(ReturnTime_PoolCarAllocation; "Return Time")
            {
            }
            column(AllocationNo_PoolCarAllocation; "Allocation No.")
            {
            }
            column(RegistrationNo_PoolCarAllocation; "Registration No.")
            {
            }
            column(ModelName_PoolCarAllocation; "Model Name")
            {
            }
            column(PickupDate_PoolCarAllocation; "Pickup Date")
            {
            }
            column(ReturnDate_PoolCarAllocation; "Return Date")
            {
            }
            column(ActualReturnTime_PoolCarAllocation; "Actual Return Time")
            {
            }
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
        CompanyData: Record 79;
        CompanyAddr: array[8] of Text[40];
        CustomerAddr: array[8] of Text[40];
}

