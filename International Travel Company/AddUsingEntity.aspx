<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="AddUsingEntity.aspx.cs" Inherits="International_Travel_Company.Add" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.4.1.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
            <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Currency_ISO" CssClass="col-md-2 control-label">Currency ISO Code</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Currency_ISO" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Currency_ISO"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Travel_time" CssClass="col-md-2 control-label">Travel timestamp</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Travel_time" TextMode="DateTime" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Travel_time"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="prices" CssClass="col-md-2 control-label">Travel Price Amount</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="prices" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="prices"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="Add_Click" Text="Save Travel" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
