<%@ Page Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
<div class="container">
    <div class="form-horizontal">
        <h2>Recover Password</h2>
        <hr />
        <h4>Please enter your email address, we will send you the instructions to reset your password.</h4>
        <div class="form-group">
            <asp:label id="lblEmail" runat="server" cssclass="col-md-2 control-label" text="Your Email"></asp:label>
            <div class="col-md-3">
                <asp:textbox id="tbEmailID" cssclass="form-control" runat="server" placeholder="Email"></asp:textbox>
                <asp:requiredfieldvalidator id="RequiredFieldValidatorEmail" cssclass="text-danger" runat="server" errormessage="Please enter your email ID !" controltovalidate="tbEmailID" Display="Dynamic" ValidationGroup="A"></asp:requiredfieldvalidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-2"></div>
            <br />
            <div class="col-md-6">
                <asp:button id="btPassRec" runat="server" cssclass="btn btn-primary" text="Send" onclick="btPassRes_Click" ValidationGroup="A" />
                <asp:label id="lblPassRec" runat="server"></asp:label>
            </div>
        </div>
    </div>

</div>
</asp:content>
