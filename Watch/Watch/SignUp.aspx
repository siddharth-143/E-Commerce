<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Sign Up</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="CSS/Custom.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar start -->
        <div>
            <nav id="navbar_top" class="navbar navbar-expand-lg navbar-light bg-light" role="navigation">
                <div class="container-fluid">
                    <a class="navbar-brand" href="Default.aspx"><span><img src="Images/logo.jpg" height="30"/></span>  Watch.com</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" href="Default.aspx">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Contact</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">All Watches
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
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
                            <li class="active">
                                <a class="nav-link" href="SignUp.aspx">Sign Up</a>
                            </li>
                            <li>
                                <a class="nav-link" href="SignIn.aspx">Sign In</a>
                            </li>
                        </ul>
                        <%--     <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>--%>
                    </div>
                </div>
            </nav>
        </div>
        <!-- Navbar end -->

        <!-- Sign Up start -->
        <div class="container center-page">
            <label class="col-xs-11">Username</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbUname" runat="server" Class="form-control" placeholder="Username"></asp:TextBox>
            </div>

            <label class="col-xs-11">Name</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbName" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
            </div>

            <label class="col-xs-11">Password</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbPass" type="password" name="password" runat="server" class="form-control" placeholder="Password" TextMode="Password" data-toggle="password"></asp:TextBox>
            </div>

            <label class="col-xs-11">Confirm Password</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbCPass" type="password" name="password" runat="server" class="form-control" placeholder="Confirm Password" TextMode="Password" data-toggle="password"></asp:TextBox>
            </div>

            <label class="col-xs-11">Email</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbEmail" runat="server" class="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
            </div>

            <label class="col-xs-11">Mobile</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbMobile" runat="server" class="form-control" placeholder="Mobile" TextMode="Number"></asp:TextBox>
            </div>

            <div class="col-xs-11 space-vert">
                <asp:Button ID="btSignup" runat="server" class="btn btn-success" Text="Sign Up" OnClick="btSignup_Click" />
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
        </div>
        <!-- Sign Up end -->
    </form>
    <hr />
    <!-- Footer start -->
    <footer class="footer-pos">
        <div class="container">
            <p class="float-right"><a href="#">Back to top</a></p>
            <p>&copy; 2022 Welcome.com &middot; <a href="Default.aspx">Home</a> &middot; <a href="#">About</a> &middot; <a href="#">Contact</a> &middot; <a href="#">Products</a></p>
        </div>
    </footer>
    <!-- Footer end -->
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="JS/Main.js" type="text/javascript"></script>
</body>
</html>
