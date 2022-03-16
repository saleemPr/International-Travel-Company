<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" CodeBehind="TravelDates.aspx.cs" Inherits="International_Travel_Company.Contact" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script src="Scripts/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            showdata();
        });
            function showdata() {
            $.ajax({
                url: "api/TTravel",
                type: "GET",
                dataType: "Json",
                success: function (data) {
                    $('#tblStudent tbody').empty();
                    $("#<%=Currency_ISO.ClientID %>").val(""),
                    $("#<%=Travel_time.ClientID %>").val(""),
                    $("#<%=prices.ClientID %>").val("")

                    $.each(data, function (i, item) {
                        if (item.Status == "Canceled") {
                            html = '<td>Canceled</td>'
                        }
                        else {
                            
                            var html = '<td>' + '<a data-toggle="modal" data-target="#myModal" href="#" onclick="return getbyID(' + item.Travel_Id + ')">Edit</a>'
                                + '</td>' + '<td>' + '<a href="#" onclick="return canceltravel(' + item.Travel_Id + ')">Cancel</a>' + '</td>';
                        }
                            var rows = "<tr>"
                                + "<td class='prtoducttd'>" + item.Currency_ISO_Code + "</td>"
                                + "<td class='prtoducttd'>" + item.Travel_timestamp + "</td>"
                                + "<td class='prtoducttd'>" + item.Travel_Price_Amount_in_payment_currency + '</td>'
                                + html + '</td>' + "</tr>";
                            $('#tblStudent tbody').append(rows);
                        });
                        
                }
            });
            }
        function getbyID(ID) {
            $('#targid').val(ID);
            $("#<%=HiddenField1.ClientID %>").val(ID);
        }
        function canceltravel(ID) {
            $.ajax({
                url: "api/TTravel/" + ID,
                contentType: "application/json;charset=utf-8",
                type: "Post",
                dataType: "Json",
                success: function () {
                    showdata();
                }
            });
        }
        function Edite(IDs) {
            var empObj = {
                Travel_Id: IDs,
                Currency_ISO_Code: $("#<%=Currency_ISO.ClientID %>").val(),
                Travel_timestamp: $("#<%=Travel_time.ClientID %>").val(),
                Travel_Price_Amount_in_payment_currency: $("#<%=prices.ClientID %>").val()
            };
            $.ajax({
                url: "api/TTravel/",
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(empObj),
                type: "Put",
                dataType: "Json",
                success: function () {
                    showdata();
                }
            });
            
        }
    </script>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br /><br />
    <h1>Travel Dates</h1>
    <hr />
    <div id="exist" style="text-align:center;padding-bottom:10px;font-size:medium" class="text-danger" runat="server" visible="false">Already exist</div>
    <table id="tblStudent" class="table table-bordered table-striped table-responsive table-hover">  
        <thead>  
            <tr>  
                <th id="Click" align="left" class="productth">Currency ISO Code</th>  
                <th align="left" class="productth">Travel timestamp</th>  
                <th align="left" class="productth">Travel Price Amount in payment currency</th>  
            </tr>  
        </thead>
        <tbody></tbody>  
    </table>
    <input type="hidden" id="targid"/>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
        <div class="modal-dialog">  
            <div class="modal-content">  
                <div class="modal-header">  
                    <button type="button" class="close" data-dismiss="modal">×</button>  
                    <h4 class="modal-title" id="myModalLabel">Edite Travel</h4>  
                </div>  
                <div class="modal-body">  
                        <div class="form-group">  
                            <asp:Label runat="server" AssociatedControlID="Currency_ISO" CssClass="control-label">Currency ISO Code</asp:Label>
                                <asp:TextBox runat="server" ID="Currency_ISO" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Currency_ISO"
                                    CssClass="text-danger" ErrorMessage="required." />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Currency_ISO" ErrorMessage="It's Not ISO Code" ValidationExpression="[A-Z]{3}\b" 
                                CssClass="text-danger"></asp:RegularExpressionValidator>
                        </div>  
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="Travel_time" CssClass="control-label">Travel timestamp</asp:Label>
                                <asp:TextBox runat="server" ID="Travel_time" TextMode="DateTime" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Travel_time"
                                    CssClass="text-danger" ErrorMessage="required." />
                        </div>  
                        <div class="form-group">  
                            <asp:Label runat="server" AssociatedControlID="prices" CssClass="control-label">Travel Price Amount</asp:Label>
                                <asp:TextBox runat="server" ID="prices" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="prices"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="required." />
                        </div>
                </div>
                <div class="modal-footer">
<%--                    <button type="button" class="btn btn-primary" id="btnAdd" onclick="return Edite();" data-dismiss="modal">Edit</button>--%>
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                    <asp:Button runat="server" Text="Save Travel" CssClass="btn btn-default" OnClick="Edite_Click" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>  
                </div>  
            </div>  
        </div>          
    </div>  
</asp:Content>