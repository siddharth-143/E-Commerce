<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="OrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div id="dvPrint" runat="server">
            <table>
                <tr>
                    <td colspan="2">
                        <center><b><u>Order Details</u></b></center>
                    </td>
                </tr>
                <tr>
                    <td>Company Name : <u><b>AspSnippets.com</b></u></td>
                    <td>Date : <u>
                        <asp:Label ID="lblDate" Text="" runat="server" /></u></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnPrint" Text="Print" runat="server" />
        </div>
    </div>
</asp:Content>

