tableextension 50021 "Acc. Schedule Line Ext" extends "Acc. Schedule Line"
{
    fields
    {
        field(50200; Accounttype; Option)
        {
            OptionMembers = ,Customer,Supplier,FixedAssets;
        }
        field(50201; Print; Boolean)
        {
            InitValue = true;
        }
        field(50202; "Multiply (-1)"; Boolean)
        {
            InitValue = false;
        }
        field(50203; HyperionAccount; Code[15])
        {
        }
        field(50204; Specification; Boolean)
        {
        }
        field(50205; "Branch Code"; Code[20])
        {
            //CaptionClass = '1,1,2';
            //TableRelation = "Dimension Value".Code WHERE(Global Dimension No.=CONST(2));
        }
        field(50206; PeriodChoice; Option)
        {
            OptionMembers = " ",PRIMO,ULTIMO;
        }
    }
}
