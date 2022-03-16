<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="International_Travel_Company.WebForm1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
<script src="Scripts/jquery-3.4.1.js"></script>
<script src="Scripts/bootstrap.js"></script>
<link href="Content/bootstrap.css" rel="stylesheet" />
<script>
    //Load Data in Table when documents is ready  
    $(document).ready(function () {
        loadData();
    });

    //Load Data function  
    function loadData() {
        $.ajax({
            url: "api/TTravel",
            type: "GET",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {
                var html = '';
                $.each(result, function (key, item) {
                    html += '<tr>';
                    html += '<td>' + item.Currency_ISO_Code + '</td>';
                    html += '<td>' + item.Travel_timestamp + '</td>';
                    html += '<td>' + item.Travel_Price_Amount_in_payment_currency + '</td>';
                    html += '<td>h</td>';
                    html += '<td>t</td>';
                    html += '<td><a href="#" onclick="return getbyID(' + item.Travel_Id + ')">Edit</a> | <a href="#" onclick="Delele(' + item.Travel_Id + ')">Delete</a></td>';
                    html += '</tr>';
                });
                $('.tbody').html(html);
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    //Add Data Function   
    function Add() {
        var res = validate();
        if (res == false) {
            return false;
        }
        var empObj = {
            EmployeeID: $('#EmployeeID').val(),
            Name: $('#Name').val(),
            Age: $('#Age').val(),
            State: $('#State').val(),
            Country: $('#Country').val()
        };
        $.ajax({
            url: "/Home/Add",
            data: JSON.stringify(empObj),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {
                loadData();
                $('#myModal').modal('hide');
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    //Function for getting the Data Based upon Employee ID  
    function getbyID(EmpID) {
        alert(EmpID);
        $('#Name').css('border-color', 'lightgrey');
        $('#Age').css('border-color', 'lightgrey');
        $('#State').css('border-color', 'lightgrey');
        $('#Country').css('border-color', 'lightgrey');
        $.ajax({
            url: "/Home/getbyID/" + EmpID,
            typr: "GET",
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: function (result) {
                $('#EmployeeID').val(result.EmployeeID);
                $('#Name').val(result.Name);
                $('#Age').val(result.Age);
                $('#State').val(result.State);
                $('#Country').val(result.Country);

                /*$('#myModal').modal('show');*/
                $('#btnUpdate').show();
                $('#btnAdd').hide();
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
        return false;
    }

    //function for updating employee's record  
    function Update() {
        var res = validate();
        if (res == false) {
            return false;
        }
        var empObj = {
            EmployeeID: $('#EmployeeID').val(),
            Name: $('#Name').val(),
            Age: $('#Age').val(),
            State: $('#State').val(),
            Country: $('#Country').val(),
        };
        $.ajax({
            url: "/Home/Update",
            data: JSON.stringify(empObj),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {
                loadData();
                $('#myModal').modal('hide');
                $('#EmployeeID').val("");
                $('#Name').val("");
                $('#Age').val("");
                $('#State').val("");
                $('#Country').val("");
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    //function for deleting employee's record  
    function Delele(ID) {
        var ans = confirm("Are you sure you want to delete this Record?");
        if (ans) {
            $.ajax({
                url: "/Home/Delete/" + ID,
                type: "POST",
                contentType: "application/json;charset=UTF-8",
                dataType: "json",
                success: function (result) {
                    loadData();
                },
                error: function (errormessage) {
                    alert(errormessage.responseText);
                }
            });
        }
    }

    //Function for clearing the textboxes  
    function clearTextBox() {
        $('#EmployeeID').val("");
        $('#Name').val("");
        $('#Age').val("");
        $('#State').val("");
        $('#Country').val("");
        $('#btnUpdate').hide();
        $('#btnAdd').show();
        $('#Name').css('border-color', 'lightgrey');
        $('#Age').css('border-color', 'lightgrey');
        $('#State').css('border-color', 'lightgrey');
        $('#Country').css('border-color', 'lightgrey');
    }
    //Valdidation using jquery  
    function validate() {
        var isValid = true;
        if ($('#Name').val().trim() == "") {
            $('#Name').css('border-color', 'Red');
            isValid = false;
        }
        else {
            $('#Name').css('border-color', 'lightgrey');
        }
        if ($('#Age').val().trim() == "") {
            $('#Age').css('border-color', 'Red');
            isValid = false;
        }
        else {
            $('#Age').css('border-color', 'lightgrey');
        }
        if ($('#State').val().trim() == "") {
            $('#State').css('border-color', 'Red');
            isValid = false;
        }
        else {
            $('#State').css('border-color', 'lightgrey');
        }
        if ($('#Country').val().trim() == "") {
            $('#Country').css('border-color', 'Red');
            isValid = false;
        }
        else {
            $('#Country').css('border-color', 'lightgrey');
        }
        return isValid;
    }
</script>
    </asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<div class="container">  
        <h2>Employees Record</h2>   
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="clearTextBox();">Add New Employee</button><br /><br />  
        <table class="table table-bordered table-hover">  
            <thead>  
                <tr>  
                    <th>  
                        ID  
                    </th>  
                    <th>  
                        Name  
                    </th>  
                    <th>  
                        Age  
                    </th>  
                    <th>  
                        State  
                    </th>  
                    <th>  
                        Country  
                    </th>  
                    <th>  
                        Action  
                    </th>  
                </tr>  
            </thead>  
            <tbody class="tbody">  
  
            </tbody>  
        </table>  
    </div>  
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
        <div class="modal-dialog">  
            <div class="modal-content">  
                <div class="modal-header">  
                    <button type="button" class="close" data-dismiss="modal">×</button>  
                    <h4 class="modal-title" id="myModalLabel">Add Employee</h4>  
                </div>  
                <div class="modal-body">  
                    <form>  
                        <div class="form-group">  
                            <label for="EmployeeId">ID</label>  
                            <input type="text" class="form-control" id="EmployeeID" placeholder="Id" disabled="disabled"/>  
                        </div>  
                        <div class="form-group">  
                            <label for="Name">Name</label>  
                            <input type="text" class="form-control" id="Name" placeholder="Name"/>  
                        </div>  
                        <div class="form-group">  
                            <label for="Age">Age</label>  
                            <input type="text" class="form-control" id="Age" placeholder="Age" />  
                        </div>  
                        <div class="form-group">  
                            <label for="State">State</label>  
                            <input type="text" class="form-control" id="State" placeholder="State"/>  
                        </div>  
                        <div class="form-group">  
                            <label for="Country">Country</label>  
                            <input type="text" class="form-control" id="Country" placeholder="Country"/>  
                        </div>  
                    </form>  
                </div>  
                <div class="modal-footer">  
                    <button type="button" class="btn btn-primary" id="btnAdd" onclick="return Add();">Add</button>  
                    <button type="button" class="btn btn-primary" id="btnUpdate" style="display:none;" onclick="Update();">Update</button>  
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>  
                </div>  
            </div>  
        </div>          
    </div>
</asp:Content>