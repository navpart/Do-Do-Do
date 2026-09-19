tableextension 50076 "Service Item Line Ext" extends "Service Item Line"
{
    fields
    {
        field(50000;"Job Type";Option)
        {
            OptionCaption = ' ,PM,GR,Others,Warranty,Internal,D/Estimate,B&P,B&P Estimate,Painting';
            OptionMembers = " ",PM,GR,Others,Warranty,Internal,"D/Estimate","B&P","B&P Estimate",Painting;
        }
    }
}
