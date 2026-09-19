tableextension 50000 "Customer Price Group Ext." extends "Customer Price Group"
{
    fields
    {
        field(50000; "Allow Quantity Disc."; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Allow Cust./Item Disc."; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}
