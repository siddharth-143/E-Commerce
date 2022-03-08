<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserHome.aspx.cs" Inherits="UserHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Sign Up</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="CSS/Custom.css" rel="stylesheet" />
        <script>
        $(document).ready(function myfunction() {
            $("#btnCart").click(function myfunction() {
                window.location.href = "/Cart.aspx";
            });
        });
    </script>
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
                                        <hr class="dropdown-divider">
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
                            <li>
                                <button id="btnCart" type="button" class="btn btn-default navbar-btn">
                                    Cart <span class="badge bg-secondary" id="pCount" runat="server"></span>
                                </button>
                            </li>
                            <li class="nav-item">
                                <asp:Button ID="btnSignIn" runat="server" Text="Sign In" CssClass="btn btn-default navbar-btn" OnClick="btnSignIn_Click" />
                                <asp:Button ID="btnSignOut" runat="server" Text="Sign Out" CssClass="btn btn-default navbar-btn" OnClick="btnSignOut_Click" />
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
        <asp:Label ID="lblSuccess" runat="server" CssClass="text-success"></asp:Label>
    </form>

    <!-- Footer start -->
    <hr />
    <footer class="footer-pos">
        <div class="container">
            <p class="float-right"><a href="#">Back to top</a></p>
            <p>&copy; 2022 Watch.com &middot; <a href="Default.aspx">Home</a> &middot; <a href="#">About</a> &middot; <a href="#">Contact</a> &middot; <a href="#">Products</a></p>
        </div>
    </footer>
    <!-- Footer end -->
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="JS/Main.js" type="text/javascript"></script>
</body>
</html>
