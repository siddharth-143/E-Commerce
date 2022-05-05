<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row" style="padding-top: 50px">
            <asp:repeater id="rptrProducts" runat="server">
                <ItemTemplate>
                    <div class="col-sm-3 col-md-3">
                        <a style="text-decoration:none" href="ProductView.aspx?PID=<%#Eval("PID") %>">
                        <div class="thumbnail">
                            <img src="Images/ProductImages/<%#Eval("PID") %>/<%#Eval("ImageName") %><%#Eval("Extention") %>" alt="<%#Eval("Name") %>">
                            <div class="p-2">
                                <div class="probrand pb-1" style="color:red;"><%#Eval("BrandName") %></div>
                                <div class="proName pb-1" style="color:black;"><%#Eval("PName") %></div>
                                <div class="proPrice pb-1"><span class="proOgPriceView"><%#Eval("PSelPrice", "{0:0.00}") %></span> <span class=""><%#Eval("PPrice", "{0:0.00}") %></span> <span class="proPriceDiscountView">(<%#Eval("DiscAmount", "{0:0.00}") %>  Off)</span></div>
                            </div>
                        </div>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:repeater>
        </div>
    </div>
</asp:Content>

