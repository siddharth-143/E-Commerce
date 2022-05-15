<%@ Page Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="UserHome.aspx.cs" Inherits="UserHome" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:Label ID="lblSuccess" runat="server" CssClass="text-success" Font-Bold="True"></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="Edit Profile" CssClass="btn btn-primary float-end" OnClick="Button1_Click" />
        <br />
        <table class="w-100 table border-2">
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
    </div>
</asp:Content>
