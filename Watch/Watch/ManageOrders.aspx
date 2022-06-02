<%@ Page Title="Orders Report" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageOrders.aspx.cs" Inherits="ManageOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form-control card mt-3 mb-3">
        <div class="card-header">
            Order Report
        </div>
        <div class="card-body">
            <div class="d-flex">
                <p>Start Date</p>
                <p class="ms-lg-5" style="padding-left: 250px">End Date</p>
            </div>
            <div class="d-flex">
                <asp:TextBox ID="txtStartDate" type="search" runat="server" CssClass="form-control" Width="320px"></asp:TextBox>
                <asp:TextBox ID="txtEndDate" type="search" runat="server" CssClass="form-control ms-5" Width="320px"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" OnClick="FilterData" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtStartDate" ValidationGroup="A"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" OnClick="FilterData" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtEndDate" ValidationGroup="A"></asp:RequiredFieldValidator>
            <div>
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search" ValidationGroup="A" OnClick="FilterData" />
                <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
            </div>
        </div>
    </div>

    <asp:GridView class="table table-striped" ID="GridView1" runat="server">
    </asp:GridView>
</asp:Content>

