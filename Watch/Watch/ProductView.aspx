<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ProductView.aspx.cs" Inherits="ProductView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="padding-top: 50px">
        <div>
            <div style="max-width:480px" class="thumbnail">
                <img src="Images/ProductImages/14/Realme01.jpg" />
            </div>
        </div>
        <div class="col-md-7">
            <div>
                <h1 class="proNameView">REAL ME 6S</h1>
                <span class="proOgPriceView">Rs. 1899</span><span class="proPriceDiscountView"> 210 OFF</span>
                <p class="proPriceView">Rs. 1288</p>
            </div>
            <div class="divDet1">
                <asp:Button ID="btnAddToCart" CssClass="mainButton" runat="server" Text="ADD TO CART" />
            </div>
            <div class="divDet1">
                <h5 class="h5Size">Desciption</h5>
                <p>I am siddharth from solapur i love this watch and i want you also buy watch for your like onces ..</p>
            </div>
            <div>
                <p>Free Delivery</p>
                <p>30 Days Returns</p>
                <p>Cash on Delivery</p>
            </div>
        </div>
    </div>
</asp:Content>

