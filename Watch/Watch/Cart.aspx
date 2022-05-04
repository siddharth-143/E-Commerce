<%@ Page Title="Cart" Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <button id="btnCart2" runat="server" class="btn btn-primary navbar-btn pull-right" onserverclick="btnCart2_ServerClick" type="button">
                    Cart <span id="CartBadge" runat="server" class="badge">0</span>
                </button>
                <div class="row" style="padding-top: 20px">
                    <div class="col-md-8">
                        <h4 class="proNameViewCart" runat="server" id="h5NoItems"></h4>
                        <asp:Repeater ID="RptrCartProducts" OnItemCommand="RptrCartProducts_ItemCommand" runat="server">
                            <ItemTemplate>
                                <%--Show cart details start--%>
                                <div class="d-flex" style="border: 1px solid #eaeaec;">
                                    <div class="flex-shrink-0 px-2 pt-2">
                                        <a href="ProductView.aspx?PID=<%# Eval("PID") %>" target="_blank">
                                            <img width="180px" src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %>" onerror="this.src='Images/noimage.jpg'" />
                                        </a>
                                    </div>
                                    <div class="flex-grow-1 ms-3">
                                        <h4 class="media-heading proNameViewCart pt-1"><%# Eval("PName") %></h4>

                                        <%-- Try something new --%>
                                        <span class="ProPriceViewCart">Rs.&nbsp <%# Eval("PPrice","{0:0.00}") %></span>  <span class="proPriceDiscountView">Off Rs.<%# string.Format("{0}",Convert.ToInt64(Eval("PSelPrice"))-Convert.ToInt64(Eval("PPrice"))) %></span>                                     
                                        <span class="proOgPriceView">Rs.&nbsp <%# Eval("PSelPrice","{0:0.00}") %></span>
                                          <%-- Try something new --%>
                                        <br />
                                        <span class="proOgPriceView">Rs.&nbsp <%# Eval("PSelPrice","{0:0.00}") %></span>  <span class="proPriceDiscountView">Off Rs.<%# string.Format("{0}",Convert.ToInt64(Eval("PPrice"))-Convert.ToInt64(Eval("PSelPrice"))) %></span>
                                        <p class="proPriceView">Rs.&nbsp <%# Eval("PPrice","{0:0.00}") %></p>

                                        <div class="pull-right form-inline">
                                            <asp:Label ID="lblQty" runat="server" Text="Qty:" Font-Size="Large"></asp:Label>
                                            <asp:Button ID="BtnMinus" CommandArgument='<%# Eval("PID") %>' CommandName="DoMinus" Font-Size="Large" runat="server" Text="-" />&nbsp
                                            <asp:TextBox ID="txtQty" runat="server" Width="40" Font-Size="Large" TextMode="SingleLine" Style="text-align: center" Text='<%# Eval("Qty") %>'></asp:TextBox>&nbsp
                                            <asp:Button ID="BtnPlus" CommandArgument='<%# Eval("PID") %>' CommandName="DoPlus" runat="server" Text="+" Font-Size="Large" />&nbsp&nbsp&nbsp                                          
                                        </div>
                                        <br />
                                        <p>
                                            <asp:Button CommandArgument='<%#Eval("CartID") %>' CommandName="RemoveThisCart" ID="btnRemoveCart" CssClass="removeButton" runat="server" Text="Remove" />
                                            <br />
                                            <span class="proNameViewCart pull-right">SubTotal: Rs.&nbsp <%# Eval("SubSAmount","{0:0.00}") %></span>
                                        </p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <%--Show cart details Ending--%>
                    </div>

                    <div class="col-md-3 pt-5" runat="server" id="divAmountSect">
                        <div style="border: 1px solid #eaeaec;">
                            <h5 class=" proNameViewCart">Price Details</h5>
                            <div>
                                <label class=" ">Total</label>
                                <span class="float-end priceGray" runat="server" id="spanCartTotal"></span>
                            </div>
                            <div>
                                <label class=" ">Cart Discount</label>
                                <span class="float-end priceGreen" runat="server" id="spanDiscount"></span>
                            </div>
                        </div>
                        <div>
                            <div class="cartTotal">
                                <label>Cart Total</label>
                                <span class="float-end " runat="server" id="spanTotal"></span>
                                <div>
                                    <asp:Button Style="border-radius: 3px; outline: 0; margin-top: 10px; margin-bottom: 20px; font-size: 13px; min-height: 22px; padding: 10px 15px; font-weight: 500; background: rgba(255,102,0,1); border: 1px solid #14cda8; color: #fff; width: 100%;" ID="btnBuyNow" runat="server" OnClick="btnBuyNow_Click" Text="BUY NOW" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

