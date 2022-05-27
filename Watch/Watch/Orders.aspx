<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdPName" Value='<%# Eval("PName") %>' runat="server" />
    <div class="container">
        <asp:Label ID="lblSuccess" runat="server" CssClass="text-success" Font-Bold="True"></asp:Label>
        <div>
            <h2>Orders Detail's</h2>
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            <asp:GridView ID="GridView1" CssClass="table table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="PurchaseID" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="PurchaseID" HeaderText="PurchaseID" InsertVisible="False" ReadOnly="True" SortExpression="PurchaseID" />
                    <%--<asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />--%>
                    <%--<asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />--%>
                    <asp:BoundField DataField="PName" HeaderText="PName" SortExpression="PName" />
                    <%--<asp:BoundField DataField="TotalPayed" HeaderText="CartAmount" SortExpression="CartAmount" />--%>
                    <%--<asp:BoundField DataField="CartDiscount" HeaderText="CartDiscount" SortExpression="CartDiscount" />--%>
                    <asp:BoundField DataField="CartAmount" HeaderText="TotalPayed" SortExpression="TotalPayed" />
                    <%--<asp:BoundField DataField="PaymentType" HeaderText="PaymentType" SortExpression="PaymentType" />--%>
                    <%--<asp:BoundField DataField="PaymentStatus" HeaderText="PaymentStatus" SortExpression="PaymentStatus" />--%>
                    <asp:BoundField DataField="DateOfPurchase" HeaderText="DateOfPurchase" SortExpression="DateOfPurchase" />
                    <%--<asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />--%>
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="PinCode" HeaderText="PinCode" SortExpression="PinCode" />
                    <%--<asp:BoundField DataField="MobileNumber" HeaderText="MobileNumber" SortExpression="MobileNumber" />--%>
                    <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                    <asp:ButtonField CommandName="Del" Text="Cancel Order">
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:ButtonField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyDatabaseConnectionString1 %>" SelectCommand="SELECT * FROM [tblPurchase] WHERE ([UserID] = @UserID)">
                <SelectParameters>
                    <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

