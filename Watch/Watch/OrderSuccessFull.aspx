<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="OrderSuccessFull.aspx.cs" Inherits="OrderSuccessFull" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto mt-5">
                <div class="payment">
                    <div class="payment_header">
                        <div class="check">
                            <i class="fa fa-check" aria-hidden="true"></i>
                        </div>
                    </div>
                    <div class="content">
                        <br />
                        <div class="back" style="">
                            <i class="checkmark">✓</i>
                        </div>
                        <h1>Order Placed Success !</h1>
                        <p>Thank you! for Visiting our website.Have a nice day :) </p>
                        <a href="Default.aspx">Go to Home</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

