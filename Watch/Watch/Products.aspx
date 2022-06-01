<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hfPName" runat="server" Value='<%# Eval("PName") %>' />
    <asp:HiddenField ID="hfPPrice" runat="server" Value='<%# Eval("PPrice") %>' />
    <asp:HiddenField ID="hfSelPrice" runat="server" Value='<%# Eval("PSelPrice") %>' />
    <div class="container">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row" style="padding-top: 50px;">
                    <div class="col-sm-3">
                        <div class="list-group position-fixed" style="width: 20%">
                            <a href="Products.aspx" class="list-group-item list-group-item-action fw-bold center" aria-current="true">All Watches</a>
                            <asp:Repeater ID="rptCategory" runat="server">
                                <ItemTemplate>
                                    <a class="list-group-item list-group-item-action fw-bold center" href="Products.aspx?cat=<%# Eval("CatID") %>"><%# Eval("CatName") %></a>
                                    <asp:HiddenField ID="hfCatID" runat="server" Value='<%# Eval("CatID") %>' />
                                </ItemTemplate>
                            </asp:Repeater>

                            <asp:Repeater ID="rptGender" runat="server">
                                <ItemTemplate>
                                    <a class="list-group-item list-group-item-action fw-bold center" href="Products.aspx?gen=<%# Eval("GenderID") %>"><%# Eval("GenderName") %></a>
                                </ItemTemplate>
                            </asp:Repeater>
                            <%--<a class="list-group-item list-group-item-action fw-bold center" href="#" aria-current="true">Below 10000</a>--%>
                            <asp:LinkButton ID="lbBelow" CssClass="list-group-item list-group-item-action fw-bold center" runat="server">Below 10000</asp:LinkButton>
                            <a class="list-group-item list-group-item-action fw-bold center" href="#" aria-current="true">Above 10000</a>
                        </div>
                    </div>

                    <div class="col-sm-8">
                        <div class="row">
                            <asp:Repeater ID="rptrProducts" runat="server">
                                <ItemTemplate>
                                    <div class="col-sm-4 col-md-4">
                                        <a style="text-decoration: none" href="ProductView.aspx?PID=<%#Eval("PID") %>">
                                            <div class="item">
                                                <div class="thumbnail">
                                                    <img src="Images/ProductImages/<%#Eval("PID") %>/<%#Eval("ImageName") %><%#Eval("Extention") %>" alt="<%#Eval("Name") %>">
                                                    <div class="p-2">
                                                        <div class="probrand pb-1" style="color: red;"><%#Eval("BrandName") %></div>
                                                        <div class="proName pb-1" style="color: black;"><%#Eval("PName") %></div>
                                                        <div class="proPrice pb-1"><span class="proOgPriceView"><%#Eval("PSelPrice", "{0:0.00}") %></span> <span class=""><%#Eval("PPrice", "{0:0.00}") %></span> <span class="proPriceDiscountView">(<%#Eval("DiscAmount", "{0:0.00}") %>Off)</span></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>









        <div class="col-md-7">
            <asp:Repeater ID="rptrProductDetails" runat="server">
                <ItemTemplate>
                    <div class="divDet1 pt-2">
                        <h1 class="proNameView"><%#Eval("PName") %></h1>
                        <span class="proOgPriceView"><%#Eval("PSelPrice", "{0:0.00}") %></span><span class="proPriceDiscountView"> <%# string.Format("{0}",Convert.ToInt64(Eval("PPrice"))-Convert.ToInt64(Eval("PSelPrice"))) %> OFF</span>
                        <p class="proPriceView"><%#Eval("PPrice", "{0:0.00}") %></p>
                    </div>
                    <div class="divDet1">
                        <h5 class="h5Size">Description</h5>
                        <p>
                            <%#Eval("PDescription") %>
                        </p>
                    </div>
                    <div>
                        <p><%# ((int)Eval("FreeDelivery")==1)?"Free Delivery":"" %></p>
                        <p><%# ((int)Eval("30DayRet")==1)?"30 Days Returns":"" %></p>
                        <p><%# ((int)Eval("COD")==1)?"Cash on Delivery":"" %></p>
                    </div>
                    <asp:HiddenField ID="hfCatID" runat="server" Value='<%# Eval("PcategoryID") %>' />
                    <asp:HiddenField ID="hfGenderID" runat="server" Value='<%# Eval("PGender") %>' />
                    <asp:HiddenField ID="hfBrandID" runat="server" Value='<%# Eval("PBrandID") %>' />

                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

