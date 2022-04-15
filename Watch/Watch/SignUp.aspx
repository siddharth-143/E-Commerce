<%@ Page Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
        <!-- Sign Up start -->
        <div class="container center-page">
            <label class="col-xs-11" style="font-weight: bold">Username</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbUname" runat="server" Class="form-control" placeholder="Username"></asp:TextBox>
            </div>

            <label class="col-xs-11" style="font-weight: bold">Name</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbName" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
            </div>

            <label class="col-xs-11" style="font-weight: bold">Password</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbPass" type="password" name="password" runat="server" class="form-control" placeholder="Password" TextMode="Password" data-toggle="password"></asp:TextBox>
            </div>

            <label class="col-xs-11">Confirm Password</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbCPass" type="password" name="password" runat="server" class="form-control" placeholder="Confirm Password" TextMode="Password" data-toggle="password"></asp:TextBox>
            </div>

            <label class="col-xs-11" style="font-weight: bold">Email</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbEmail" runat="server" class="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
            </div>

            <label class="col-xs-11" style="font-weight: bold">Mobile</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbMobile" runat="server" class="form-control" placeholder="Mobile" TextMode="Number"></asp:TextBox>
            </div>

            <label class="col-xs-11" style="font-weight: bold">Gender</label>
            <div class="col-xs-11">
            <asp:RadioButton ID="rbMale" runat="server" Text="Male" GroupName="gender" />  
            <asp:RadioButton ID="rbFemale" runat="server" Text="Female" GroupName="gender" />  
            </div>

            <div class="col-xs-11 space-vert">
                <asp:Button ID="btSignup" runat="server" class="btn btn-success" Text="Sign Up" OnClick="btSignup_Click" />
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
        </div>
        <!-- Sign Up end -->
</asp:content>
