<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageUser.aspx.cs" Inherits="ManageUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="form-control card mt-3 w-50">
            <div class="card-header">
                Search Users
            </div>
            <div class="card-body">
                <p>Users Name</p>
                <asp:TextBox ID="txtSearch" type="search" runat="server" CssClass="form-control" Width="320px"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtSearch" ValidationGroup="A"></asp:RequiredFieldValidator>
                <div>
                    <asp:Button ID="btnSearch" type="search" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="Search" ValidationGroup="A" />
                    <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>
            </div>
        </div>
        <hr />
        <asp:GridView ID="gvCustomers" class="table table-striped" runat="server" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="OnPaging" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="Uid" HeaderText="Name" />
                <asp:BoundField DataField="Username" HeaderText="Username" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                <asp:ButtonField CommandName="Ed" Text="Edit" ControlStyle-CssClass="btn btn-primary" />
                <asp:ButtonField CommandName="Del" Text="Remove" ControlStyle-CssClass="btn btn-danger" />
                <asp:ButtonField CommandName="Details" Text="Details" ControlStyle-CssClass="btn btn-secondary" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

