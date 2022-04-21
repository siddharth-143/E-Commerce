<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Demo.aspx.cs" Inherits="Demo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="form-horizontal">
            <h2>Add Brand</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="User Details"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtSearch" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="Enter User Details !!!" ControlToValidate="txtSearch"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnSearch" type="search" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="Search" />
                    <%--  <asp:Button Text="Search" runat="server" OnClick="Search" />--%>
                </div>
            </div>
        </div>
        <br />

        <h1>Users Details</h1>
        <hr />
        <div class="panel panel-default">
            <div class="panel-heading">All Users</div>
            <asp:DataList ID="dlCustomers" runat="server">
                <HeaderTemplate>
                    <div class="panel-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>UserName</th>
                                    <th>Full Name</th>
                                    <th>Password</th>
                                    <th>Email</th>
                                    <th>Mobile</th>
                                    <th>Gender</th>
                                    <th>UserType</th>
                                    <th>Update</th>
                                    <th>Delete</th>
                                    <th>Edit</th>
                                </tr>
                            </thead>
                            <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>

                        <td>
                            <asp:Label ID="lblId" Text='<%#Eval("Uid") %>' runat="server"></asp:Label></td>
                        <%--<td><%# Eval("Uid") %></td>--%>
                        <td><%# Eval("Username") %></td>
                        <td><%# Eval("Name") %></td>
                        <td><%# Eval("Password") %></td>
                        <td><%# Eval("Email") %></td>
                        <td><%# Eval("Mobile") %></td>
                        <td><%# Eval("Gender") %></td>
                        <td><%# Eval("UserType") %></td>
                        <td>
                            <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text="Update" />
                        </td>
                        <td>
                            <asp:Button ID="btnDelete" OnClick="OnDelete"
                                OnClientClick="return confirm('Are you sure?')" CssClass="btn btn-danger" runat="server" Text="Delete" />
                        </td>
                        <td>
                            <asp:Button ID="btnEdit" CssClass="btn btn-success" runat="server" Text="Edit" />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
                </table>
        </div>
                </FooterTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>

