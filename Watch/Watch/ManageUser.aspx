<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageUser.aspx.cs" Inherits="ManageUser" %>

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
                </div>
            </div>
        </div>
        <br />

        <h1>Users Details</h1>
        <hr />
        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="OnPaging" class="table table-striped" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:BoundField DataField="Uid" HeaderText="#" ItemStyle-Width="150px" />
                <asp:BoundField DataField="Username" HeaderText="User Name" ItemStyle-Width="150px" />
                <asp:BoundField DataField="Name" HeaderText="Full Name" ItemStyle-Width="200px" />
                <asp:BoundField DataField="Password" HeaderText="Password" ItemStyle-Width="150px" />
                <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-Width="250px" />
                <asp:BoundField DataField="Mobile" HeaderText="Mobile" ItemStyle-Width="150px" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" ItemStyle-Width="150px" />
                <asp:BoundField DataField="Usertype" HeaderText="User Type" ItemStyle-Width="150px" />
                <asp:CommandField ShowEditButton="true" />
                <asp:CommandField ShowDeleteButton="true" />
            </Columns>
        </asp:GridView>
        <div>
            <asp:Label ID="lblresult" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>

