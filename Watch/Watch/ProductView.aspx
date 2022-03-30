<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="ProductView.aspx.cs" Inherits="ProductView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row" style="padding-top: 50px">
            <div class="col-md-5">
                <div style="max-width: 480px" class="thumbnail">
                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
                        </div>
                        <div class="carousel-inner">
                            <asp:Repeater ID="rptrImages" runat="server">
                                <ItemTemplate>
                                    <div class="carousel-item <%# GetActiveClass(Container.ItemIndex) %>">
                                        <img class="d-block w-100" src="Images/ProductImages/<%#Eval("PID") %>/<%#Eval("Name") %><%#Eval("Extention") %>" alt="<%#Eval("Name") %>" onerror="this.onerror=null;this.src='Images/noimage.jpg';">
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <asp:Repeater ID="rptrProductDetails" runat="server">
                    <ItemTemplate>
                        <div class="divDet1 pt-2">
                            <h1 class="proNameView"><%#Eval("PName") %></h1>
                            <span class="proOgPriceView"><%#Eval("PPrice") %></span><span class="proPriceDiscountView"> <%# string.Format("{0}",Convert.ToInt64(Eval("PPrice"))-Convert.ToInt64(Eval("PSelPrice"))) %> OFF</span>
                            <p class="proPriceView"><%#Eval("PSelPrice") %></p>
                        </div>
                        <div class="divDet1">
                            <asp:Button ID="btnAddToCart" OnClick="btnAddToCart_Click" CssClass="mainButton" runat="server" Text="ADD TO CART" />

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
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
