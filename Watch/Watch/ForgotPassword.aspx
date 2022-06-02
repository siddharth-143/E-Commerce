<%@ Page Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--    <div class="container">
        <div class="form-horizontal">
            <h2>Recover Password</h2>
            <hr />
            <h4>Please enter your email address, we will send you the instructions to reset your password.</h4>
            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" CssClass="col-md-2 control-label" Text="Your Email"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="tbEmailID" CssClass="form-control" runat="server" placeholder="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" CssClass="text-danger" runat="server" ErrorMessage="Please enter your email ID !" ControlToValidate="tbEmailID" Display="Dynamic" ValidationGroup="A"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-2"></div>
                <br />
                <div class="col-md-6">
                    <asp:Button ID="btPassRec" runat="server" CssClass="btn btn-primary" Text="Send" OnClick="btPassRes_Click" ValidationGroup="A" />
                    <asp:Label ID="lblPassRec" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>--%>

    <div class="container">
        <div class="container center-page">
            <label class="col-xs-11" style="font-weight: bold">Username</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbUname" runat="server" Class="form-control" placeholder="Username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldtbUname" runat="server" ControlToValidate="tbUname" Display="Dynamic" ErrorMessage="UserName is Required !" ValidationGroup="A" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11" style="font-weight: bold">Email</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbEmail" runat="server" class="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbEmail" Display="Dynamic" ErrorMessage="Email is Required Filed !" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11" style="font-weight: bold">New Password</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbPass" type="password" name="password" runat="server" class="form-control" placeholder="Password" TextMode="Password" data-toggle="password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbPass" Display="Dynamic" ErrorMessage="Password is Requires Field !" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11" style="font-weight: bold">Confirm Password</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbCPass" type="password" name="password" runat="server" class="form-control" placeholder="Confirm Password" TextMode="Password" data-toggle="password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbCPass" Display="Dynamic" ErrorMessage="Confirm Password is Required Field !" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
            </div>

            <div class="col-xs-11 space-vert center">
                <asp:Button ID="btSignup" runat="server" class="btn btn-success" Text="Change Password" ValidationGroup="A" OnClick="btSignup_Click" />
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
