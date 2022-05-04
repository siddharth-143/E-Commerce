<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="TimePass.aspx.cs" Inherits="TimePass" %>

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
                <div class="row" style="padding-top: 20px;">
                    <div class="col-md-8">
                        <h5 class="proNameViewCart" runat="server" id="h5NoItems"></h5>
                        <asp:Repeater ID="rptrCartProducts" runat="server">
                            <ItemTemplate>
                                <div class="d-flex" style="border: 1px solid #eaeaec;">
                                    <div class="flex-shrink-0 px-2 pt-2">
                                        <a href="ProductView.aspx?PID=<%#Eval("PID") %>" target="_blank">
                                            <img width="180px" src="Images/ProductImages/<%#Eval("PID") %>/<%#Eval("Name") %><%#Eval("Extention") %>" alt="<%#Eval("Name") %>" onerror="this.onerror=null;this.src='Images/noimage.jpg';">
                                        </a>
                                    </div>
                                    <div class="flex-grow-1 ms-3">
                                        <h5 class="media-heading proNameViewCart pt-1"><%#Eval("PName") %></h5>
                                        <%--<span class="proPriceView"><%#Eval("PSelPrice","{0:c}") %></span>--%>
                                        <%--<span class="proOgPriceView"><%#Eval("PPrice","{0:0,00}") %></span>--%>
                                        <span class="proOgPriceView"><%#Eval("PSelPrice","{0:c}") %></span><span class="proPriceDiscountView"> <%# string.Format("{0}",Convert.ToInt64(Eval("PPrice"))-Convert.ToInt64(Eval("PSelPrice"))) %> OFF</span>
                                        <p class="proPriceView"><%#Eval("PPrice","{0:c}") %></p>
                                        <h6 class="fw-bold">Description</h6>
                                        <%--<span><%#Eval("PDescription") %></span>--%>
                                        <div class="pull-right form-inline">
                                            <asp:Label ID="lblQty" runat="server" Text="Qty:" Font-Size="Large"></asp:Label>
                                            <asp:Button ID="BtnMinus" CommandArgument='<%# Eval("PID") %>' CommandName="DoMinus" Font-Size="Large" runat="server" Text="-" />&nbsp
                                    <asp:TextBox ID="txtQty" runat="server" Width="40" Font-Size="Large" TextMode="SingleLine" Style="text-align: center" Text='<%# Eval("Qty") %>'></asp:TextBox>&nbsp
                                     <asp:Button ID="BtnPlus" CommandArgument='<%# Eval("PID") %>' CommandName="DoPlus" runat="server" Text="+" Font-Size="Large" />&nbsp&nbsp&nbsp                                          
                                        </div>
                                        <p>
                                            <%--<asp:Button CommandArgument='<%#Eval("PID") %>' CommandName="RemoveThisCart" ID="btnRemoveItem" CssClass="removeButton" runat="server" Text="REMOVE" />--%>
                                            <asp:Button CommandArgument='<%#Eval("CartID") %>' CommandName="RemoveThisCart" ID="btnRemoveCart" CssClass="removeButton" runat="server" Text="Remove" />
                                            <br />
                                        </p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
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
                                <asp:Button ID="btnBuyNow" CssClass="buyNowBtn" runat="server" Text="BUY NOW" OnClick="btnBuyNow_Click" />
                            </div>
                            <div>
                                <asp:Button Style="border-radius: 3px; outline: 0; margin-top: 10px; margin-bottom: 20px; font-size: 13px; min-height: 22px; padding: 10px 15px; font-weight: 500; background: rgba(255,102,0,1); border: 1px solid #14cda8; color: #fff; width: 100%;" ID="btnViewOrder" runat="server" Text="VIEW ORDERES" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
