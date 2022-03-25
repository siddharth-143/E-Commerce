<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecoverPassword.aspx.cs" Inherits="RecoverPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Reset Your Password !</title>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="CSS/Custom.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%-- Navigation start --%>
            <nav id="navbar_top" class="navbar navbar-expand-lg navbar-light bg-light" role="navigation">
                <div class="container-fluid">
                    <a class="navbar-brand" href="Default.aspx"><span>
                        <img src="Images/logo.jpg" height="30" /></span>  Watch.com</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="Default.aspx">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Contact</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">All Watches
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="Products.aspx">All Products</a></li>
                                    <li>
                                        <hr class="dropdown-divider" />
                                    </li>
                                    <li><a class="dropdown-item" href="#">Men</a></li>
                                    <li><a class="dropdown-item" href="#">Women</a></li>
                                    <li>
                                        <hr class="dropdown-divider" />
                                    </li>
                                    <li><a class="dropdown-item" href="#">Fastrack</a></li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">About</a>
                            </li>
                        </ul>
                        <!-- Search form -->
                        <div class="form-inline d-flex">
                            <input class=" form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </div>
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li>
                                <button id="btnCart" type="button" class="btn btn-default navbar-btn ms-2 me-2">
                                    Cart <span class="badge bg-primary" id="pCount" runat="server"></span>
                                </button>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="SignIn.aspx">Sign In</a>
                            </li>
                        </ul>
                        <%--            <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>--%>
                    </div>
                </div>
            </nav>
            <%-- Navigation End --%>
        </div>

        <div class="container">
            <div class="form-horizontal">
                <h2>Reset Password</h2>
                <hr />

                <div class="form-group">
                    <asp:Label ID="lblMsg" runat="server" CssClass="col-md-2 control-label" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblPassword" runat="server" CssClass="col-md-2 control-label" Text="New Password" Visible="False"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="tbNewPass" CssClass="form-control" TextMode="Password" runat="server" placeholder="Password" Visible="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" CssClass="text-danger" runat="server" ErrorMessage="Please enter your new Password !" ControlToValidate="tbNewPass"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblRetyPass" runat="server" CssClass="col-md-2 control-label" Text="Confirm Password" Visible="False"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="tbConfirmPass" CssClass="form-control" TextMode="Password" runat="server" placeholder="Password" Visible="False"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidatorPass" runat="server" CssClass="text-danger" ErrorMessage="Both Password must be same !" ControlToValidate="tbNewPass" ControlToCompare="tbConfirmPass"></asp:CompareValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btRecPass" runat="server" CssClass="btn btn-primary" Text="Reset" Visible="False" OnClick="btRecPass_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- Footer start-->
    <hr />
    <footer>
        <div class="container">
            <p class="float-right"><a href="#">Back to top</a></p>
            <p>&copy; 2022 Watch.com &middot; <a href="Default.aspx">Home</a> &middot; <a href="#">About</a> &middot; <a href="#">Contact</a> &middot; <a href="#">Products</a></p>
        </div>
    </footer>
    <!-- Footer end-->

    <script src="Scripts/bootstrap.min.js"></script>
    <script src="JS/Main.js" type="text/javascript"></script>
</body>
</html>
