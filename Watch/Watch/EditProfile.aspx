<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="container center-page">
            <label class="col-xs-11" style="font-weight: bold">Username</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbUname" runat="server" Class="form-control" placeholder="Username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldtbUname" runat="server" ControlToValidate="tbUname" Display="Dynamic" ErrorMessage="UserName is Required !" ValidationGroup="A" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11" style="font-weight: bold">FullName</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbName" runat="server" class="form-control" placeholder="FullName"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbName" Display="Dynamic" ErrorMessage="Full Name is Required !" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11" style="font-weight: bold">Password</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbPass" type="password" name="password" runat="server" class="form-control" placeholder="Password" TextMode="Password" data-toggle="password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbPass" Display="Dynamic" ErrorMessage="Password is Requires Field !" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11" style="font-weight: bold">Confirm Password</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbCPass" type="password" name="password" runat="server" class="form-control" placeholder="Confirm Password" TextMode="Password" data-toggle="password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbCPass" Display="Dynamic" ErrorMessage="Confirm Password is Required Field !" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11" style="font-weight: bold">Email</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbEmail" runat="server" class="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbEmail" Display="Dynamic" ErrorMessage="Email is Required Filed !" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11" style="font-weight: bold">Mobile</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbMobile" runat="server" class="form-control" placeholder="Mobile" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbMobile" ErrorMessage="Mobile Number is Required Field !" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11" style="font-weight: bold">Gender</label>
            <div class="col-xs-11">
                <asp:RadioButton ID="rbMale" runat="server" Text="Male" GroupName="gender" />
                <asp:RadioButton ID="rbFemale" runat="server" Text="Female" GroupName="gender" />
            </div>

            <%--           <label class="col-xs-11" style="font-weight: bold">Address</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbAddress" runat="server" class="form-control" placeholder="Address" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbAddress" ErrorMessage="Address is Required Field !" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
            </div>--%>

            <div class="col-xs-11 space-vert center">
                <asp:Button ID="btnSave" runat="server" class="btn btn-success" Text="Save" ValidationGroup="A" OnClick="btnSave_Click" />
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

