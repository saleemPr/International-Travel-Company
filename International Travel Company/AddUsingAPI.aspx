<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="AddUsingAPI.aspx.cs" Inherits="International_Travel_Company.AddUsingAPI" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
            function Add() {
                var empObj = {
                    Currency_ISO_Code: $("#<%=Currency_ISO.ClientID %>").val(),
                    Travel_timestamp: $("#<%=Travel_time.ClientID %>").val(),
                    Travel_Price_Amount_in_payment_currency: $("#<%=prices.ClientID %>").val()
                };
                $.ajax({
                    url: "api/TTravel/",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify(empObj),
                    type: "POST",
                    dataType: "Json"
                });
            }
    </script>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Add Travel</h1>
    <hr />
    <div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" ValidationGroup="done" />
    </div>
     <div id="Added" style="padding-left:25%;padding-bottom:10px;font-size:medium" class="text-success" runat="server" visible="false">Added</div>
    <div id="exist" style="padding-left:25%;padding-bottom:10px;font-size:medium" class="text-danger" runat="server" visible="false">Already exist</div>
    <div class="form-horizontal">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Currency_ISO" CssClass="col-md-2 control-label">Currency ISO Code</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Currency_ISO" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Currency_ISO"
                    CssClass="text-danger" ErrorMessage="The Currency iso code field is required." ValidationGroup="done" >*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Currency_ISO" ErrorMessage="It's Not ISO Code" ValidationExpression="[A-Z]{3}\b" ValidationGroup="done" CssClass="text-danger">Error</asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Travel_time" CssClass="col-md-2 control-label">Travel timestamp</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Travel_time" TextMode="DateTime" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Travel_time"
                    CssClass="text-danger" ErrorMessage="The travel timestammp field is required." ValidationGroup="done" >*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="prices" CssClass="col-md-2 control-label">Travel Price Amount</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="prices" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="prices"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The travel price amount field is required." ValidationGroup="done" >*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="prices" ErrorMessage="Numbers Only" ValidationExpression="^([1-9]\d*(\.|\,)\d*|0?(\.|\,)\d*[1-9]\d*|[1-9]\d*)$" ValidationGroup="done" CssClass="text-danger">Error</asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" ID="button" Text="Save Travel" OnClick="Addition_Click" CssClass="btn btn-default" ValidationGroup="done" />
            </div>
        </div>
    </div>
</asp:Content>
