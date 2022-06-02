<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="Time.aspx.cs" Inherits="Time" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/jQuery.print.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#Button1").click(function () {
                $("#PrintDiv").print();
            })
        })
    </script>
    <hr />
    <div id="PrintDiv">
        Cust Name:<asp:Label ID="lblCustName" runat="server" Text="Label"></asp:Label>

        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" DataKeyNames="PurchaseID">
            <Columns>
                <asp:BoundField DataField="PurchaseID" HeaderText="PurchaseID" SortExpression="PurchaseID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="PName" HeaderText="PName" SortExpression="PName" />
                <asp:BoundField DataField="CartAmount" HeaderText="CartAmount" SortExpression="CartAmount" />
                <asp:BoundField DataField="CartDiscount" HeaderText="CartDiscount" SortExpression="CartDiscount" />
                <asp:BoundField DataField="TotalPayed" HeaderText="TotalPayed" SortExpression="TotalPayed" />
                <asp:BoundField DataField="PaymentType" HeaderText="PaymentType" SortExpression="PaymentType" />
                <asp:BoundField DataField="PaymentStatus" HeaderText="PaymentStatus" SortExpression="PaymentStatus" />
                <asp:BoundField DataField="DateOfPurchase" HeaderText="DateOfPurchase" SortExpression="DateOfPurchase" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="PinCode" HeaderText="PinCode" SortExpression="PinCode" />
                <asp:BoundField DataField="MobileNumber" HeaderText="MobileNumber" SortExpression="MobileNumber" />
                <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyDatabaseConnectionString1 %>" SelectCommand="SELECT * FROM [tblPurchase]"></asp:SqlDataSource>
    </div>
    <div>
        <input id="Button1" type="button" value="Print" class=" btn btn-primary active" />
    </div>

</asp:Content>

