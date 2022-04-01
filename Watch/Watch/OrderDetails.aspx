<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="OrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="background-color:#fff;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-8 col-lg-6 col-xl-6">
                        <div class="card card-stepper" style="border-radius: 16px;">
                            <div class="card-header p-71">
                                <p class="lead fw-bold mb-3" style="color: #f37a27;">Purchase Reciept</p>

                                <div class="row">
                                    <div class="col mb-1">
                                        <p class="small text-muted mb-1">Date</p>
                                        <p>10 April 2021</p>
                                    </div>
                                    <div class="col mb-1">
                                        <p class="small text-muted mb-1">Order No.</p>
                                        <p>012j1gvs356c</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body p-4">
                                <div class="d-flex flex-row mb-4 pb-2">
                                    <div class="flex-fill">
                                        <h5 class="bold">Headphones Bose 35 II</h5>
                                        <p class="text-muted">Qt: 1 item</p>
                                        <span class="proOgPriceView">500</span><span class="proPriceDiscountView">  -210 OFF</span>
                                        <h4 class="mb-3">$ 299 <span class="small text-muted">via (COD) </span></h4>
                                        <div class="">
                                            <h5 class="bold">Description</h5>
                                            <p>
                                                Fastrack blueDial Analog Watch for Girls
                                            </p>
                                        </div>
                                    </div>
                                    <div>
                                        <img class="align-self-center img-fluid" src="Images/ASGARD03.jpg" width="250">
                                    </div>
                                </div>
                                <ul id="progressbar-1" class="mx-0 mt-0 mb-5 px-0 pt-0 pb-4">
                                    <li class="step0 active" id="step1"><span style="margin-left: 22px; margin-top: 12px;">PLACED</span></li>
                                    <li class="step0 active text-center" id="step2"><span>SHIPPED</span></li>
                                    <li class="step0 text-muted text-end" id="step3"><span style="margin-right: 22px;">DELIVERED</span></li>
                                </ul>
                            </div>
                            <div class="card-footer p-4">
                                <div class="d-flex justify-content-between">
                                    <p class="mt-1 pt-1 mb-0">Want any help? <a href="#!" style="color: #f37a27;">Please contact us</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</asp:Content>

