<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddQuantity.aspx.cs" Inherits="AddQuantity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="form-horizontal">
            <h2>Add Quantity</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Quantity"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtBrandName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtBrandName"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                </div>
            </div>
            <br />

            <h1>Quantity</h1>
            <hr />
            <div class="panel panel-default">
                <div class="panel-heading">All Quantity</div>
                <asp:Repeater ID="rptrQuantity" runat="server">
                    <HeaderTemplate>
                        <div class="panel-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Quantity</th>
                                        <th>Edit</th>
                                    </tr>
                                </thead>
                                <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("ProQuntID") %></td>
                            <td><%# Eval("PID") %></td>
                            <td><%# Eval("Quantity") %></td>
                            <td>Edit</td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                </table>
        </div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
        </div>
</asp:Content>

