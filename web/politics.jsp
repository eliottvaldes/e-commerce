<%-- 
    Document   : newjsppolitics
    Created on : 2/12/2020, 01:18:02 AM
    Author     : Eliot
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">          
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
        <link rel="icon" type="image/png" href="assets/images/icon.png" sizes="192x192">
        <title>The World Of Creations- Tienda Online</title>
        <!--PARA LA PLATILLA BASE-->      
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">      
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/tooplate-main.css">
        <link rel="stylesheet" href="assets/css/owl.css">
    </head>
    <body>
        <%
            String usuario = "";
            HttpSession sesionOk = request.getSession();

            if (sesionOk.getAttribute("usuario") == null) {
                //Si la sesión no es valida
        %>
        <jsp:forward page="politics.html">
            <jsp:param name="error" value="Es obligatorio identificarse"/>
        </jsp:forward>
        <%
            } else {
                //Si la sesion si es valida
                usuario = (String) sesionOk.getAttribute("usuario");
            }
        %>




        <!-- Pre Header -->
        <div id="pre-header" class="login-menu">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <ul>
                            <li class="cart"><a role="button" class="button producto" href="favoritos.jsp"> <i class="fa fa-heart"></i></a></li> 
                            <li class="cart"><a role="button" class="button producto" href="dis_cart.jsp"> <i class="fa fa-shopping-cart"></i></a></li> 
                            <li ><a href="LogOut" onclick="localStorage.clear();" >  Salir  <i class="fa fa-sign-out"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
            <div class="container">
                <a class="navbar-brand" ><img src="assets/images/header-logo.jpg" height="48px" width="170px" alt=""></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="indexwl.jsp"><i class="fa fa-home"></i> Inicio                
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="products.jsp"><i class="fa fa-tags"></i> Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.jsp"><i class="fa fa-users"></i> Acerca de nosotros</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="contact.jsp"><i class="fa fa-envelope"></i> Contáctanos
                                <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container mx-auto py-5">
            <br><br>
            <span>
                <h2>Terminos y condiciones</h2>
                <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, 
                    making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words..
                </p>
                <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias 
                    excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum
                    quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime 
                    placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.
                </p><br>
                <h3>Cookies</h3>
                <p>On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, 
                    so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty 
                    through weakness of will, which is the same as saying through
                </p>
                <p>These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being 
                    able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or 
                    the obligations of business it will frequently occur that pleasures
                </p><br>
                <h3>License</h3>
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore 
                    veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia 
                    consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.
                </p><br>
                <h3>You must not</h3>
                <p>Republish material form Chamb.com<br>
                    Sell, rent or sub-license material form https:Chamb.com<br>
                    Reproduce, duplicate or copy material form Chamb.com<br>
                    Redistribute content from Chamb (unless content is specifically made for redistribution).
                </p><br>
                <h3>User Comments</h3>
                <p>This Agreement shall begin on the date hereof. <br>
                    Certain parts of this website offer the opportunity for users to post and exchange opinions, information, material and data ('Comments') in areas of the website. Chamb does not screen, edit, publish or review Comments prior to their appearance on the website and Comments do not reflect the views or opinions ofChamb, its agents or affiliates. Comments reflect the view and opinion of the person who posts such view or opinion. To the extent permitted by applicable laws Chambshall not be responsible or liable for the Comments or for any loss cost, liability, damages or expenses caused and or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.<br>
                    Chambreserves the right to monitor all Comments and to remove any Comments which it considers in its absolute discretion to be inappropriate, offensive or otherwise in breach of these Terms and Conditions.<br>
                    You warrant and represent that: <br>
                    You are entitled to post the Comments on our website and have all necessary licenses and consents to do so; <br>
                    The Comments do not infringe any intellectual property right, including without limitation copyright, patent or trademark, or other proprietary right of any third party; <br>
                    The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material or material which is an invasion of privacy<br>
                    The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity. <br>
                    You hereby grant to Chamb a non-exclusive royalty-free license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.
                </p>
                <p>Online directory distributors when they list us in the directory may link to our Web site in the same manner as they hyperlink to the Web sites of other listed businesses;
                    and <br>Systemwide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site. <br> These organizations may link to our home page, to publications or to other Web site information so long as the link: (a) is not in any way misleading;
                    (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party's site.<br> We may consider and approve in our sole discretion other link requests from the following types of organizations:<br> commonly-known consumer and/or business information sources such as Chambers of Commerce, American Automobile Association, AARP and Consumers Union;<br>
                    dot.com community sites;<br>
                    associations or other groups representing charities, including charity giving sites, online directory distributors;<br>
                    internet portals;<br>
                    accounting, law and consulting firms whose primary clients are businesses; and<br>
                    educational institutions and trade associations.<br> We will approve link requests from these organizations if we determine that: (a) the link would not reflect unfavorably on us or our accredited businesses (for example, trade associations or other organizations representing inherently suspect types of business, such as work-at-home opportunities, shall not be allowed to link); (b)the organization does not have an unsatisfactory record with us; (c) the benefit to us from the visibility associated with the hyperlink outweighs the absence of ; and (d) where the link is in the context of general resource information or is otherwise consistent with editorial content in a newsletter or similar product furthering the mission of the organization.
                </p><br>
                <h3>Disclaimer</h3>
                <p>To the maximum extent permitted by applicable law, we exclude all representations, warranties and coditions relating to our website and the use of this website(including, without limitation, any
                    warranties implied by law in respect of satisfactory wuality, fitness for purpose and/or the use of reasonable care and skill). Nothing in disclaimer will:
                </p>
                <p>limit or exclude our or your liability for death or personal injury resulting from negligence;
                    limit or exclude our or your liability for fraud or fraudulent misrepresentation;<br>
                    limit any  of our or your liabilities that may not be excluded under applicable low; or<br>
                    exclude any of our or your liabilities that may not be excluded under applicable law.<br>
                    The limitations and exclusions of liability set out in this Section and elswhere in this disclaimer:(a) are subject to the paragraph; and (b) govern all liabilities arising under the disclaimer<br>
                    or in relation to the subject matter of this disclaimer, including liabilities arising in contract, in tort (including negligence) and for breach of statutory duty.
                </p>            
            </span>
        </div>
        <!-- Subscribe Form Starts Here -->
        <div class="subscribe-form">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <div class="line-dec"></div>
                            <h1>¡Aprovecha ofertas de temporada!</h1>
                        </div>
                    </div>
                    <div class="col-md-8 offset-md-2">
                        <div class="main-content">
                            <p>En la compra superior a $1000 MXN el costo de envío va por nuestra cuenta</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Subscribe Form Ends Here -->

        <!-- Footer Starts Here -->
        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="logo">
                            <img src="assets/images/lo.jpg" height="70px" width="165px" alt="">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="footer-menu">
                            <ul>
                                <li><a href="indexwl.jsp">Inicio</a></li>
                                <li><a href="help.jsp">Ayuda</a></li>
                                <li><a href="politics.jsp"> <span>Politicas de privacidad</a> </li>
                                <li><a href="contact.jsp">Contáctanos</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="social-icons">
                            <ul>
                                <li><a href="https://www.facebook.com/The-World-Of-Creations-107994600676781/"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="https://web.whatsapp.com/"><i class="fa fa-whatsapp"></i></a></li>

                                <li><a href="https://www.instagram.com/the_world_of_creations_"><i class="fa fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Ends Here -->


        <!-- Sub Footer Starts Here -->
        <div class="sub-footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="copyright-text">
                            <p>Copyright &copy; 2020 The World Of Creations</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sub Footer Ends Here -->

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Additional Scripts -->
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>
        <script src="assets/js/isotope.js"></script>
        <script src="assets/js/flex-slider.js"></script>

        


    </body>
</html>
