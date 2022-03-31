<%@ Page Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Middle Content start -->
    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="Images/c4.jpg" class="d-block w-100" alt="cc" width="100%" height="100%" aria-hidden="true" preserveaspectratio="xMidYMid slice" focusable="false" />
                <rect width="100%" height="100%" fill="#777" />

                <div class="container">
                    <div class="carousel-caption text-start">
                        <p><a class="btn btn-lg btn-primary" href="SignUp.aspx">Sign up today</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="Images/c2.jpg" width="100%" height="100%" aria-hidden="true" preserveaspectratio="xMidYMid slice" focusable="false" />
                <rect width="100%" height="100%" fill="#777" />

                <div class="container">
                    <div class="carousel-caption">
                        <p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="Images/c3.jpg" width="100%" height="100%" aria-hidden="true" preserveaspectratio="xMidYMid slice" focusable="false" />
                <rect width="100%" height="100%" fill="#777" />

                <div class="container">
                    <div class="carousel-caption text-end">
                        <h1>Uniquely apart, of masterpice together.</h1>
                        <p>Celebrate diversity in femininity with our eclectic collection of watches.</p>
                        <p><a class="btn btn-lg btn-primary" href="ProductView.aspx">Browse Watches</a></p>
                    </div>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <!-- Marketing messaging and featurettes
  ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row">
            <div class="col-lg-4">
                <img src="Images/Apple%205s01.jpg" class="bd-placeholder-img rounded-circle" width="140" height="140" role="img" aria-label="Placeholder: 140x140" preserveaspectratio="xMidYMid slice" focusable="false" />
                <rect width="100%" height="100%" fill="#777" />
                <h2>Titan</h2>
                <p>Fastrack Digital Unisex Smart Watch with Red Strap.</p>
                <p><a class="btn btn-secondary" href="ProductView.aspx?PID=13">View details &raquo;</a></p>
            </div>
            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img src="Images/ASGARD03.jpg" class="bd-placeholder-img rounded-circle" width="140" height="140" role="img" aria-label="Placeholder: 140x140" preserveaspectratio="xMidYMid slice" focusable="false" />
                <rect width="100%" height="100%" fill="#777" />

                <h2>Fastrack</h2>
                <p>Fastrack blueDial Analog Watch for Girls.</p>
                <p><a class="btn btn-secondary" href="ProductView.aspx?PID=24">View details &raquo;</a></p>
            </div>
            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img src="Images/i.jpg" class="bd-placeholder-img rounded-circle" width="140" height="140" role="img" aria-label="Placeholder: 140x140" preserveaspectratio="xMidYMid slice" focusable="false" />
                <rect width="100%" height="100%" fill="#777" />

                <h2>Boat</h2>
                <p>Fastrack Monochrome Green Dial Analog Watch for Girls.</p>
                <p><a class="btn btn-secondary" href="ProductView.aspx?PID=25">View details &raquo;</a></p>
            </div>
            <!-- /.col-lg-4 -->
        </div>
        <!-- /.row -->


        <%-- Cards Start --%>
        <div class="container center">
            <div class="row row-cols-1 row-cols-md-4 g-4 center">
                <div class="col">
                    <div class="card h-100" style="width: 18rem;">
                        <img src="Images/q.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Fastrack</h5>
                            <p class="card-text">Fastrack HitList - Black Dial Analog Watch for Girls with Date Display.</p>
                            <a href="ProductView.aspx?PID=26" class="btn btn-primary">View &raquo;</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100" style="width: 18rem;">
                        <img src="Images/5.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">XYZ</h5>
                            <p class="card-text">It is the best watch and beautifull.</p>
                            <a href="ProductView.aspx?PID=16" class="btn btn-primary">View &raquo;</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100" style="width: 18rem;">
                        <img src="Images/6.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Realme</h5>
                            <p class="card-text">RealMe watch is best watch.</p>
                            <a href="ProductView.aspx?PID=14" class="btn btn-primary">View &raquo;</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100" style="width: 18rem;">
                        <img src="Images/ASGARD04.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Fastrack</h5>
                            <p class="card-text">Fastrack Digital Unisex Smart Watch with Red Strap.</p>
                            <a href="ProductView.aspx?PID=24" class="btn btn-primary">View &raquo;</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- Cards Ends --%>


        <!-- START THE FEATURETTES -->

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">First featurette heading. <span class="text-muted">It’ll blow your mind.</span></h2>
                <p class="lead">Some great placeholder content for the first featurette here. Imagine some exciting prose here.</p>
                <p><a class="btn btn-secondary" href="ProductView.aspx?PID=24">View details &raquo;</a></p>
            </div>
            <div class="col-md-5">
                <a href="ProductView.aspx?PID=24">
                    <img src="Images/ASGARD01.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" role="img" aria-label="Placeholder: 500x500" preserveaspectratio="xMidYMid slice" focusable="false" />
                    <rect width="100%" height="100%" fill="#eee" />
                </a>
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7 order-md-2">
                <h2 class="featurette-heading">Oh yeah, it’s that good. <span class="text-muted">See for yourself.</span></h2>
                <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
                <p><a class="btn btn-secondary" href="ProductView.aspx?PID=24">View details &raquo;</a></p>
            </div>
            <div class="col-md-5 order-md-1">
                <a href="ProductView.aspx?PID=24">
                    <img src="Images/ASGARD02.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" role="img" aria-label="Placeholder: 500x500" preserveaspectratio="xMidYMid slice" focusable="false" />
                    <rect width="100%" height="100%" fill="#eee" />
                </a>
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
                <p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p>
                <p><a class="btn btn-secondary" href="ProductView.aspx?PID=24">View details &raquo;</a></p>
            </div>
            <div class="col-md-5">
                <a href="ProductView.aspx?PID=24">
                    <img src="Images/ASGARD03.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" role="img" aria-label="Placeholder: 500x500" preserveaspectratio="xMidYMid slice" focusable="false" />
                    <rect width="100%" height="100%" fill="#eee" />
                </a>
            </div>
        </div>

        <hr class="featurette-divider" />

        <!-- /END THE FEATURETTES -->

        <!-- Middle Content end-->
</asp:Content>
