﻿<%@ Page Title="Add Gender" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddGender.aspx.cs" Inherits="AddGender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdfID" runat="server" />
    <div class="container">
        <div class="form-control card mt-3">
            <div class="card-header">
                Add Gender
            </div>
            <div class="card-body">
                <p>Gender Name</p>
                <asp:TextBox ID="txtGender" runat="server" CssClass="form-control" Width="320px"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtGender" ValidationGroup="A"></asp:RequiredFieldValidator>
                <div>
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add" ValidationGroup="A" OnClick="btnAdd_Click" />
                    <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-info" Text="Update" Enabled="false" ValidationGroup="A" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnClear" runat="server" CssClass="btn btn-warning" Text="Clears" OnClick="btnClear_Click" />
                    <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>
            </div>
        </div>
        <br />

        <h1>Gender</h1>
        <hr />
        <div class="row">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="GenderID" HeaderText="ID" />
                    <asp:BoundField DataField="GenderName" HeaderText="Gender Name" />
                    <asp:ButtonField CommandName="Ed" Text="Edit">
                        <ControlStyle CssClass="btn btn-info btn-sm" />
                    </asp:ButtonField>
                    <asp:ButtonField CommandName="Del" Text="Delete">
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:ButtonField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
