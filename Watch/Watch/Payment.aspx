<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdPID" Value='<%# Eval("PID") %>' runat="server" />
    <asp:HiddenField ID="hdPName" Value='<%# Eval("PName") %>' runat="server" />
    <asp:HiddenField ID="hdCartAmount" runat="server" />
    <asp:HiddenField ID="hdCartDiscount" runat="server" />
    <asp:HiddenField ID="hdTotalPayed" runat="server" />
    <asp:HiddenField ID="hdQty" runat="server" />

    <div class="container">
        <div class="row" style="padding-top: 20px;">
            <div class="col-md-9">
                <div class="form-horizontal">
                    <h3>Delivery Address</h3>
                    <hr />
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" CssClass="control-label" Text="Name"></asp:Label>
                        <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtName" Display="Dynamic" ValidationGroup="A"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" CssClass="control-label" Text="Address"></asp:Label>
                        <asp:TextBox ID="txtAddress" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtAddress" Display="Dynamic" ValidationGroup="A"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label3" runat="server" CssClass="control-label" Text="Pin Code"></asp:Label>
                        <asp:TextBox ID="txtPinCode" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtPinCode" Display="Dynamic" ValidationGroup="A"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label4" runat="server" CssClass="control-label" Text="Mobile Number"></asp:Label>
                        <asp:TextBox ID="txtMobileNumber" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtMobileNumber" Display="Dynamic" ValidationGroup="A"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <div class="col-md-3 pt-5" runat="server" id="divPriceDetails">
                <div style="border-bottom: 3px solid #eaeaec;">
                    <h5 class=" proNameViewCart">PRICE DETAILS</h5>

                    <div class="cartTotal">
                        <label>Cart Total</label>
                        <span class="float-end " runat="server" id="spanTotal"></span>
                    </div>
                    <div>
                        <label class=" ">Cart Discount</label>
                        <span class="float-end priceGreen" runat="server" id="spanDiscount"></span>
                    </div>
                </div>
                <div class="">
                    <div class="proPriceView">
                        <label class=" ">Total</label>
                        <span class="float-end priceGray" runat="server" id="spanCartTotal"></span>
                    </div>
                </div>

            </div>

            <%--  <div class="col-md-12">
                <h3>Choose Payment Mode</h3>
                <hr />
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#wallets" type="button" role="tab" aria-controls="wallets" aria-selected="true">WALLETS</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#cards" type="button" role="tab" aria-controls="cards" aria-selected="false">CREDIT/DEBIT CARDS</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#cod" type="button" role="tab" aria-controls="cod" aria-selected="false">COD</button>
                    </li>
                </ul>

                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="wallets">
                        <h3>PAY WITH WALLET</h3>
                        <p>Not Available</p>
                        <asp:Button ID="Button1" disabled="true" runat="server" Text="Pay with Wallet" />
                    </div>
                    <div class="tab-pane fade" id="cards">
                        <h3>PAY WITH PAYTM</h3>
                        <p>Not Available</p>
                        <asp:Button ID="btnPay" disabled="true" runat="server" Text="Pay with Credit/Debit Card" />
                    </div>
                    <div class="tab-pane fade" id="cod">
                        <h3>CASH ON DELIVERY</h3>
                        <p>Available</p>
                        <asp:Button ID="btnCOD" runat="server" class="btn btn-primary" Text="Order Now" OnClick="btnCOD_Click" ValidationGroup="A" />
                        <asp:Label ID="lblMsg" runat="server"></asp:Label>
                    </div>
                </div>
            </div>--%>

            <div class="col-md-12">
                <h3>Payment Mode</h3>
                <h4>Cash On Delivery</h4>
                <hr />
                <asp:Button ID="btnCOD" runat="server" class="btn btn-primary" Text="Place Order" OnClick="btnCOD_Click" ValidationGroup="A" />
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
        </div>










        <div>
            <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="false" Visible="false" CellPadding="6"
                ForeColor="#333333" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="PID" HeaderText="Product ID" ItemStyle-Width="150px" />
                    <asp:BoundField DataField="PName" HeaderText="Product Name" />
                    <asp:BoundField DataField="Qty" HeaderText="Quantity" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>

