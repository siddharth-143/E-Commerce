<%@ Page Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="UserHome.aspx.cs" Inherits="UserHome" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:Label ID="lblSuccess" runat="server" CssClass="text-success" Font-Bold="True"></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="Edit Profile" CssClass="btn btn-primary float-end" OnClick="Button1_Click" />
        <br />
        <table class="table table-striped border-2">
            <tr>
                <td>Username</td>
                <td>
                    <asp:Label ID="lblUsername" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Full Name</td>
                <td>
                    <asp:Label ID="lblFullName" runat="server" Font-Bold="True"></asp:Label></td>
            </tr>
            <tr>
                <td>Email</td>
                <td>
                    <asp:Label ID="lblEmail" runat="server" Font-Bold="True"></asp:Label></td>
            </tr>
            <tr>
                <td>Mobile</td>
                <td>
                    <asp:Label ID="lblMobile" runat="server" Font-Bold="True"></asp:Label></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>
                    <asp:Label ID="lblGender" runat="server" Font-Bold="True"></asp:Label></td>
            </tr>
            <tr>
                <td>Address</td>
                <td>
                    <asp:Label ID="lblAddress" runat="server" Font-Bold="True"></asp:Label></td>
                <td>
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary" OnClick="btnEdit_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger" Visible="false" OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>

        <asp:Panel ID="pHide" runat="server" Visible="False">
            <div id="h1" class="form-control">
                <label style="font-weight: bold">Edit Address</label>
                <asp:TextBox ID="tbAddress" type="password" name="Address" runat="server" class="form-control" placeholder="Enter Address" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" runat="server" ControlToValidate="tbAddress" Display="Dynamic" ErrorMessage="Address Required Field !" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                <br />
                <div>
                    <asp:Button ID="btnUpdate" runat="server" class="btn btn-info" Text="Update" ValidationGroup="A" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnClear" runat="server" class="btn  btn-warning" Text="Clear" ValidationGroup="" OnClick="btnClear_Click" />
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>
            </div>
        </asp:Panel>

        <div>
            <h2>Orders Detail's</h2>
            <asp:GridView ID="GridView1" CssClass="table table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="PurchaseID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="PurchaseID" HeaderText="PurchaseID" InsertVisible="False" ReadOnly="True" SortExpression="PurchaseID" />
                    <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                    <asp:BoundField DataField="CartAmount" HeaderText="CartAmount" SortExpression="CartAmount" />
                    <asp:BoundField DataField="CartDiscount" HeaderText="CartDiscount" SortExpression="CartDiscount" />
                    <asp:BoundField DataField="TotalPayed" HeaderText="TotalPayed" SortExpression="TotalPayed" />
                    <asp:BoundField DataField="PaymentType" HeaderText="PaymentType" SortExpression="PaymentType" />
                    <asp:BoundField DataField="DateOfPurchase" HeaderText="DateOfPurchase" SortExpression="DateOfPurchase" />
                     <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="PinCode" HeaderText="PinCode" SortExpression="PinCode" />
                    <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyDatabaseConnectionString1 %>" SelectCommand="SELECT [PurchaseID], [UserID], [CartAmount], [CartDiscount], [TotalPayed], [PaymentType], [DateOfPurchase], [Address], [PinCode], [Qty] FROM [tblPurchase] WHERE ([UserID] = @UserID2)">
                <SelectParameters>
                    <asp:SessionParameter Name="UserID2" SessionField="UserID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
