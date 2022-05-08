<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="EditUser.aspx.cs" Inherits="EditUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="form-horizontal">
            <h2>Login</h2>
            <hr />
            <div class="d-flex">
                <label class="col-md-1 control-label center p-1" style="font-weight: bold">Username</label>
                <div class="col-md-4">
                    <asp:TextBox ID="tbUname" runat="server" Class="form-control" placeholder="Username"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldtbUname" runat="server" ControlToValidate="tbUname" Display="Dynamic" ErrorMessage="UserName is Required !" ValidationGroup="A" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <label class=" px-lg-5 col-md-1 control-label center p-1" style="font-weight: bold">FullName</label>
                <div class="col-md-5  px-4 ">
                    <asp:TextBox ID="tbName" runat="server" class="form-control" placeholder="FullName"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbName" Display="Dynamic" ErrorMessage="Full Name is Required !" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="d-flex py-4">
                <label class="col-md-1 control-label center p-1" style="font-weight: bold">Password</label>
                <div class="col-md-4">
                    <asp:TextBox ID="tbPass" type="password" name="password" runat="server" class="form-control" placeholder="Password" TextMode="Password" data-toggle="password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbPass" Display="Dynamic" ErrorMessage="Password is Requires Field !" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                </div>

                <label class=" px-lg-5 col-md-1 control-label" style="font-weight: bold">Confirm Password</label>
                <div class="col-md-5  px-4 ">
                    <asp:TextBox ID="tbCPass" type="password" name="password" runat="server" class="form-control" placeholder="Confirm Password" TextMode="Password" data-toggle="password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbCPass" Display="Dynamic" ErrorMessage="Confirm Password is Required Field !" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="d-flex">
                <label class="col-md-1 control-label center p-1" style="font-weight: bold">Email</label>
                <div class="col-md-4">
                    <asp:TextBox ID="tbEmail" runat="server" class="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbEmail" Display="Dynamic" ErrorMessage="Email is Required Filed !" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                </div>

                <label class="px-lg-5 col-md-1 control-label center p-1" style="font-weight: bold">Mobile</label>
                <div class="col-md-5  px-4">
                    <asp:TextBox ID="tbMobile" runat="server" class="form-control" placeholder="Mobile" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbMobile" ErrorMessage="Mobile Number is Required Field !" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="d-flex">
                <label class="col-md-1 control-label center" style="font-weight: bold">Gender</label>
                <div class="col-md-4">
                    <asp:RadioButton ID="rbMale" runat="server" Text="Male" GroupName="gender" />
                    <asp:RadioButton ID="rbFemale" runat="server" Text="Female" GroupName="gender" />
                    <asp:HiddenField ID="hdfUid" runat="server" />
                </div>
            </div>
        </div>

        <div class="center">
            <div class="center px-5">
                <asp:Button ID="btnAdd" runat="server" class="btn btn-secondary" Text="Add New User" ValidationGroup="A" OnClick="btnAdd_Click" />
                <asp:Button ID="btnUpdate" runat="server" class="btn btn-primary" Text="Update" ValidationGroup="A" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnCancel" runat="server" class="btn btn-danger" Text="Cancel" ValidationGroup="" OnClick="btnCancel_Click" />
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

