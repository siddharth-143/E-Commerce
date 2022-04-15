<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row" style="padding-top: 20px;">
            <div class="col-md-8">
                <h5 class="proNameViewCart" runat="server" id="h5NoItems"></h5>
                <asp:repeater id="rptrCartProducts" runat="server">
                    <ItemTemplate>
                        <div class="d-flex" style="border: 1px solid #eaeaec;">
                            <div class="flex-shrink-0 px-2 pt-2">
                                <a href="ProductView.aspx?PID=<%#Eval("PID") %>" target="_blank">
                                    <img width="180px" src="Images/ProductImages/<%#Eval("PID") %>/<%#Eval("Name") %><%#Eval("Extention") %>" alt="<%#Eval("Name") %>" onerror="this.onerror=null;this.src='Images/noimage.jpg';">
                                </a>
                            </div>
                            <div class="flex-grow-1 ms-3">
                                <h5 class="media-heading proNameViewCart pt-1"><%#Eval("PName") %></h5>
                           <span class="proOgPriceView"><%#Eval("PSelPrice","{0:c}") %></span><span class="proPriceDiscountView"> <%# string.Format("{0}",Convert.ToInt64(Eval("PPrice"))-Convert.ToInt64(Eval("PSelPrice"))) %> OFF</span>                            
                                <p class="proPriceView"><%#Eval("PPrice","{0:c}") %></p>
                                <h6 class="fw-bold">Description</h6>
                                <span><%#Eval("PDescription") %></span>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:repeater>
            </div>
            <div class="col-md-3 pt-5" runat="server" id="divPriceDetails">
                <div style="border: 1px solid #eaeaec;">
                    <h5 class="proNameViewCart">PRICE DETAILS</h5>

                    <div>
                        <label>Cart Total</label>
                        <span class="float-end priceGray" id="spanCartTotal" runat="server"></span>
                    </div>
                    <div>
                        <label>Cart Discount</label>
                        <span class="float-end priceGreen" id="spanDiscount" runat="server"></span>
                    </div>
                </div>
                <div>
                    <div class="proPriceView">
                        <label>Total</label>
                        <span class="float-end" id="spanTotal" runat="server"></span>
                    </div>
                    <div>
                        <asp:button style="border-radius: 3px; outline: 0; margin-top: 10px; margin-bottom: 20px; font-size: 13px; min-height: 22px; padding: 10px 15px; font-weight: 500; background: rgba(255,102,0,1); border: 1px solid #14cda8; color: #fff; width: 100%;" id="btnViewOrder" runat="server" text="VIEW ORDERES" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

