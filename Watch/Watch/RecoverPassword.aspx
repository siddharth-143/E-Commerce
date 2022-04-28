<%@ Page Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="RecoverPassword.aspx.cs" Inherits="RecoverPassword" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
    <div class="form-horizontal">
        <h2>Reset Password</h2>
        <hr />

        <div class="form-group">
            <asp:label id="lblMsg" runat="server" cssclass="col-md-2 control-label" font-bold="True" font-size="XX-Large"></asp:label>
        </div>

        <div class="form-group">
            <asp:label id="lblPassword" runat="server" cssclass="col-md-2 control-label" text="New Password" visible="False"></asp:label>
            <div class="col-md-3">
                <asp:textbox id="tbNewPass" cssclass="form-control" textmode="Password" runat="server" placeholder="Password" visible="False"></asp:textbox>
                <asp:requiredfieldvalidator id="RequiredFieldValidatorPass" cssclass="text-danger" runat="server" errormessage="Please enter your new Password !" controltovalidate="tbNewPass" Display="Dynamic" ValidationGroup="A"></asp:requiredfieldvalidator>
            </div>
        </div>

        <div class="form-group">
            <asp:label id="lblRetyPass" runat="server" cssclass="col-md-2 control-label" text="Confirm Password" visible="False"></asp:label>
            <div class="col-md-3">
                <asp:textbox id="tbConfirmPass" cssclass="form-control" textmode="Password" runat="server" placeholder="Password" visible="False" ValidationGroup="A"></asp:textbox>
                <asp:comparevalidator id="CompareValidatorPass" runat="server" cssclass="text-danger" errormessage="Both Password must be same !" controltovalidate="tbNewPass" controltocompare="tbConfirmPass"></asp:comparevalidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-2"></div>
            <div class="col-md-6">
                <asp:button id="btRecPass" runat="server" cssclass="btn btn-primary" text="Reset" visible="False" onclick="btRecPass_Click" />
            </div>
        </div>
    </div>
</div>
</asp:Content>
