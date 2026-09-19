tableextension 50054 "Employee Qualification Ext" extends "Employee Qualification"
{
    fields
    {
        field(50002; Source; Option)
        {
            Description = 'keep this';
            OptionMembers = " ",Applicant;

            trigger OnValidate()
            begin

                IF (Source = Source::Applicant) THEN
                    VALIDATE(Type, Type::External);
            end;
        }
        field(50003; "Application Status"; Option)
        {
            OptionMembers = " ","Under Interview","Short Listed",Accepted,Rejected;
        }
        field(50004; "Qualification Group"; Option)
        {
            OptionMembers = " ",Educational,Professional;
        }
    }
}
