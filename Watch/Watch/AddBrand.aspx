<%@ Page Title="Add Brands" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddBrand.aspx.cs" Inherits="AddBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdfID" runat="server" />
    <div class="container">
        <%--        <div class="form-horizontal">
            <h2>Add Brand</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Brand Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtBrandName1" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtBrandName"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                </div>
            </div>
        </div>--%>
        <div class="form-control card mt-3">
            <div class="card-header">
                Add Brands
            </div>
            <div class="card-body">
                <p>Brand Name</p>
                <asp:TextBox ID="txtBrandName" type="search" runat="server" CssClass="form-control" Width="320px"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtBrandName" ValidationGroup="A"></asp:RequiredFieldValidator>
                <div>
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add" ValidationGroup="A" OnClick="btnAdd_Click" />
                    <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-info" Text="Update" Enabled="false" ValidationGroup="A" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnClear" runat="server" CssClass="btn btn-warning" Text="Clears" OnClick="btnClear_Click" />
                    <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>
            </div>
        </div>
        <br />

        <h1>Brands</h1>
        <hr />
        <%--        <div class="panel panel-default">
            <div class="panel-heading">All Brands</div>
            <asp:Repeater ID="rptrBrands" runat="server">
                <HeaderTemplate>
                    <div class="panel-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Brand</th>
                                    <th>Edit</th>
                                </tr>
                            </thead>
                            <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("BrandID") %></td>
                        <td><%# Eval("Name") %></td>
                        <td><asp:LinkButton ID="LinkButton2" runat="server">Edit</asp:LinkButton></td>
                        <td><asp:LinkButton ID="LinkButton1" runat="server">Remove</asp:LinkButton></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
                </table>
        </div>
                </FooterTemplate>
            </asp:Repeater>
        </div>--%>


        <asp:GridView ID="GridView1" class="table table-striped" runat="server" AutoGenerateColumns="False" CssClass="table" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="BrandID" HeaderText="ID" />
                <asp:BoundField DataField="Name" HeaderText="Brand Name" />
                <asp:ButtonField CommandName="Ed" Text="Edit">
                    <ControlStyle CssClass="btn btn-info btn-sm" />
                </asp:ButtonField>
                <asp:ButtonField CommandName="Del" Text="Delete">
                    <ControlStyle CssClass="btn btn-danger" />
                </asp:ButtonField>
            </Columns>
        </asp:GridView>

    </div>
</asp:Content>

