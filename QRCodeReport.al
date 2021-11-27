report 50125 QRCodeList
{
    Caption = 'QRCode List Report';
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = '.\QRCodeList.rdl';
    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "Sell-to Customer No.";
            column(No_; "No.")
            {

            }
            column(Sell_to_Customer_Name_2; "Sell-to Customer Name 2")
            {

            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {

            }
            column(Sell_to_Address; "Sell-to Address")
            {
            }
            column(Sell_to_Contact; "Sell-to Contact")
            {
            }
            column(Sell_to_City; "Sell-to City")
            {
            }
            column(Sell_to_Contact_No_; "Sell-to Contact No.")
            {
            }
            dataitem("Company Information"; "Company Information")
            {
                column(Name; Name)
                {
                }
                column(Picture; Picture)
                {
                }
                column(Phone_No_; "Phone No.")
                {
                }
            }


            column(temp; barcode2)
            {

            }
            trigger OnAfterGetRecord()
            begin
                barcode2 := InitArguments("Sell-to Customer No.")
            end;
        }
    }
    var
        BarCode2: text;

    local procedure InitArguments(ItemNo: text): text
    var
        BaseURL: Text;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        TypeHelper: Codeunit "Type Helper";
        client: HttpClient;
        response: HttpResponseMessage;
        InStr: InStream;

    begin
        client.get('https://barcode.tec-it.com/barcode.ashx?data=' + itemno + '&code=QRCode', response);
        TempBlob.CreateInStream(InStr);
        response.Content().ReadAs(InStr);
        BarCode2 := Base64Convert.ToBase64(InStr);
        exit(BarCode2);
    end;
}