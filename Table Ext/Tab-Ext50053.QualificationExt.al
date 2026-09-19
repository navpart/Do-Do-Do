tableextension 50053 "Qualification Ext" extends Qualification
{
    fields
    {
        field(50000;"Qualification Goup";Option)
        {
            OptionMembers = " ",Educational,Professional;
        }
        field(50001;"Qualified Applicants";Integer)
        {
            /* CalcFormula = Count("Employee Qualification" WHERE (Qualification Code=FIELD(Code),
                                                                Employee Status=FIELD(Aplication Status Filter),
                                                                Source=CONST(Applicant)));
            Editable = false;
            FieldClass = FlowField; */
        }
        field(50002;"Aplication Status Filter";Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = " ","Under Interview","Short Listed",Accepted,Rejected;
        }
    }
}
