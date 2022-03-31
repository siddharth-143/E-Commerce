<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdCartAmount" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="hdCartDiscount" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="hdTotalPayed" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="hdPid" runat="server"></asp:HiddenField>

    <div class="container">
        <div class="row" style="padding-top: 20px;">
            <div class="col-md-9">
                <div class="form-horizontal">
                    <h3>Delivery Address</h3>
                    <hr />
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" CssClass="control-label" Text="Name"></asp:Label>
                        <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" CssClass="control-label" Text="Address"></asp:Label>
                        <asp:TextBox ID="txtAddress" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label3" runat="server" CssClass="control-label" Text="Pin Code"></asp:Label>
                        <asp:TextBox ID="txtPinCode" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtPinCode"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label4" runat="server" CssClass="control-label" Text="Mobile Number"></asp:Label>
                        <asp:TextBox ID="txtMobileNumber" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtMobileNumber"></asp:RequiredFieldValidator>
                    </div>

                </div>
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

                </div>
            </div>
            <div class="col-md-12">
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
                        <asp:Button ID="btnPaytm" runat="server" Text="Pay with Wallet" />
                    </div>
                    <div class="tab-pane fade" id="cards">
                        <h3>PAY WITH PAYTM</h3>
                        <p>Not Available</p>
                         <asp:Button ID="btnPay" runat="server" Text="Pay with Credit/Debit Card" />
                    </div>
                    <div class="tab-pane fade" id="cod">
                        <h3>CASH ON DELIVERY</h3>
                        <p>Available</p>
                         <asp:Button ID="btnCOD" runat="server" Text="Order Now" OnClick="btnCOD_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

