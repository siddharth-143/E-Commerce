<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="EmptyCart.aspx.cs" Inherits="EmptyCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto mt-5">
                <div class="payment">
                    <div class="payment_header" style="background-color: dodgerblue">
                        <div class="check">
                            <i class="emptycart">✓</i>
                        </div>
                    </div>
                    <div class="content">
                        <br />
                        <div class="back" style="position: center; border-radius: 20px">
                            <img src="Images/Empty-Cart.jpg" height="200px" width="200px" />
                        </div>
                        <h1>Empty Cart !</h1>
                        <p>Thank you! for Visiting our website.Have a nice day :) </p>
                        <%--<a href="Default.aspx" style="background-color: dodgerblue; text-decoration-style: none">Start Shopping</a>--%>
                        <asp:Button ID="btnHome" runat="server" CssClass="btn btn-primary" Text="Go to Home" OnClick="btnHome_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

