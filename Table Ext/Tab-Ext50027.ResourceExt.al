tableextension 50027 "Resource Ext" extends Resource
{
    fields
    {
       field(50006;xAddress;Text[80])
        {
        }
        field(50010;xTitle;Text[50])
        {
        }
        field(50150;"ID Card No";Code[15])
        {
            NotBlank = true;
        }
        field(50151;"Man Hour Per Day";Integer)
        {
        }
        field(50152;"Salary Per Hour";Decimal)
        {
        }
        field(50153;Grade;Option)
        {
            OptionCaption = ' ,Junior1,Junior2,Junior3,Intermediate,Senior1,Senior2,Senior3';
            OptionMembers = " ",Junior1,Junior2,Junior3,Intermediate,Senior1,Senior2,Senior3;
        }
        field(50154;"Time Bucket";Decimal)
        {
        }
        field(50155;"Appointment Rate";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(50156;"Time Booked";Integer)
        {
        }
        field(50157;"Total Appointment Time";Integer)
        {
        }
        field(50158;"Remaining Time";Integer)
        {
        }
        field(50159;"Total Rem Appt Time";Integer)
        {
        }
        field(50160;Teams;Option)
        {
            OptionCaption = ' ,Quick Service,PMS A,PMS B,Running Repair,Body,Diagnosis';
            OptionMembers = " ","Quick Service","PMS A","PMS B","Running Repair",Body,Diagnosis;
        }
        field(50161;"Allocated Hours";Decimal)
        {
            
        }
    }
}
