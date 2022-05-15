<%@ Page Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="SignIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="text-center">
        <main class="form-signin">
            <img class="mb-4" src="Images/Clock.png" alt="" width="150" height="120">
            <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

            <div class="form-floating">
                <asp:TextBox ID="UserName" CssClass="form-control" runat="server" placeholder="Username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" CssClass="text-danger" runat="server" ErrorMessage="The Username field is Required !" ControlToValidate="UserName" Display="Dynamic" ValidationGroup="A"></asp:RequiredFieldValidator>
                <label for="floatingInput">UserName</label>
            </div>
            <div class="form-floating">
                <asp:TextBox ID="Password" type="password" CssClass="form-control" runat="server" placeholder="Password" TextMode="Password" data-toggle="password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="The Password field is Required !" ControlToValidate="Password" Display="Dynamic" ValidationGroup="A"></asp:RequiredFieldValidator>
                <label for="floatingPassword">Password</label>
            </div>

            <div class="checkbox mb-3">
                <asp:CheckBox ID="CheckBox1" runat="server" />
                <asp:Label ID="Label3" runat="server" CssClass="control-label" Text="Remember me ?"></asp:Label>
            </div>
            <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
            <asp:Button ID="Button1" runat="server" Text="Sign in" class="w-100 btn btn-lg btn-primary" type="submit" OnClick="Button1_Click" ValidationGroup="A" />
            <asp:LinkButton ID="lbForgotPass" CssClass="float-end" runat="server" PostBackUrl="~/ForgotPassword.aspx">Forgot Password !</asp:LinkButton>
            <p class="mt-5 mb-3 text-muted">
                Don't have Account? 
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/SignUp.aspx">Sign Up</asp:LinkButton>
            </p>
        </main>
    </div>
</asp:Content>
