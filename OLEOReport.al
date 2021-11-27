report 50129 "OLEO Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'OLEO Report';
    DefaultLayout = RDLC;
    RDLCLayout = './OLEOReport.rdl';


    dataset
    {

        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.");

            RequestFilterFields = "No.";
            column(Payment_Terms_Code; "Payment Terms Code")
            {

            }
            column(Due_Date; "Due Date")
            {
            }
            column(Ship_to_County; "Ship-to County")
            {
            }
            column(Transport_Method; "Transport Method")
            {
            }
            column(No_; "No.")
            {
            }
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {
            }
            column(Document_Date; "Document Date")
            {
            }
            column(Order_Date; "Order Date")
            {
            }
            column(Posting_Date; "Posting Date")
            {
            }
            column(Shipment_Date; "Shipment Date")
            {
            }
            column(Ship_to_City; "Ship-to City")
            {
            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {
            }
            column(Sell_to_Address; "Sell-to Address")
            {
            }
            column(Sell_to_City; "Sell-to City")
            {
            }
            column(Sell_to_County; "Sell-to County")
            {
            }
            column(Sell_to_Country_Region_Code; "Sell-to Country/Region Code")
            {
            }
            column(Sell_to_Post_Code; "Sell-to Post Code")
            {
            }
            column(Bill_to_Address; "Bill-to Address")
            {
            }
            column(Bill_to_City; "Bill-to City")
            {
            }
            column(Bill_to_County; "Bill-to County")
            {
            }
            column(Bill_to_Name; "Bill-to Name")
            {
            }
            column(Bill_to_Country_Region_Code; "Bill-to Country/Region Code")
            {
            }
            column(Bill_to_Post_Code; "Bill-to Post Code")
            {
            }
            column(Ship_to_Address; "Ship-to Address")
            {
            }
            column(Ship_to_Post_Code; "Ship-to Post Code")
            {
            }
            column(Ship_to_Name; "Ship-to Name")
            {
            }

            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                // RequestFilterFields = "Document No.";
                DataItemLink = "Document No." = field("No."), "Document No." = field("No.");
                DataItemLinkReference = "Sales Invoice Header";
                DataItemTableView = SORTING("Document No.");
                column(Description; Description)
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(Amount; Amount)
                {
                }
                column(AmountInWords; AmountInWords)
                {



                }


                dataitem("Company Information"; "Company Information")
                {
                    column(Bank_Account_No_; "Bank Account No.")
                    {
                    }
                    column(Bank_Branch_No_; "Bank Branch No.")
                    {
                    }
                    column(Bank_Name; "Bank Name")

                    {
                    }
                    column(Picture; Picture)
                    {
                    }
                    column(Name; Name)
                    {
                    }
                    column(Address; Address)
                    {
                    }
                    column(County; County)
                    {
                    }
                    column(Post_Code; "Post Code")
                    {
                    }
                    column(City; City)
                    {
                    }
                    column(Country_Region_Code; "Country/Region Code")
                    {
                    }
                    column(Phone_No_; "Phone No.")
                    {
                    }

                }


                trigger OnAfterGetRecord()
                var
                    AmountVendor: Decimal;
                    TotalAmount: Decimal;
                begin

                    "Sales Invoice Header".Reset();
                    "Sales Invoice Header".SetRange("No.", "No.");

                    if "Sales Invoice Header".FindSet() then
                        repeat
                            TotalAmount := TotalAmount + "Sales Invoice Header".Amount;

                            AmountVendor := Round(TotalAmount, 0.01);

                            RepCheck.InitTextVariable();

                            RepCheck.FormatNoText(NoText, AmountVendor, "Sales Invoice Header".GetCurrencySymbol());

                            AmountInWords := NoText[1];
                        until "Sales Invoice Header".Next() = 0;

                end;

            }
        }



    }
    var
        RepCheck: report 1401;
        NoText: array[2] of Text[80];
        AmountInWords: Text;




}