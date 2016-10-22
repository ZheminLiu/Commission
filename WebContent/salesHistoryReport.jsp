<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Software Testing and Assurance Project - Commission">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Sales History Report</title>

    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet"/>
    <!-- hint style -->
    <link href="css/jquery.gritter.css" rel="stylesheet">
    <!-- Custom styles -->
    <link href="css/style.css" rel="stylesheet">
    <!-- daterangepicker styles -->
    <link href="css/daterangepicker.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <script src="js/lte-ie7.js"></script>
    <![endif]-->
</head>

<body>
<!-- container section start -->
<section id="container" class="">
    <!--header start-->
    <header class="header dark-bg">
        <div class="toggle-nav">
            <div class="icon-reorder tooltips"
                 data-original-title="Toggle Navigation" data-placement="bottom">
                <i class="icon_menu"></i>
            </div>
        </div>

        <!--logo start-->
        <a href="userInfoBrief.action" class="logo">Salesman <span class="lite">Admin</span></a>
        <!--logo end-->

        <div class="top-nav notification-row">
            <!-- notificatoin dropdown start-->
            <ul class="nav pull-right top-menu">
                <!-- user login dropdown start-->
                <li class="dropdown">
                    <a data-toggle="dropdown"
                       class="dropdown-toggle" href="#"> <span class="username">${sessionScope.user.name}</span>
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu extended logout">
                        <div class="log-arrow-up"></div>
                        <li class="eborder-top">
                            <a href="salesMyProfile.jsp"><i class="icon_profile"></i> My Profile</a>
                        </li>
                        <li>
                            <a href="salesResetPassword.jsp"><i class="icon_key_alt"></i> Reset Password</a>
                        </li>
                        <li>
                            <a href="login.jsp"><i class="icon_clock_alt"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
                <!-- user login dropdown end -->
            </ul>
            <!-- notificatoin dropdown end-->
        </div>
    </header>
    <!--header end-->

    <!--sidebar start-->
    <aside>
        <div id="sidebar" class="nav-collapse">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu">
                <li class="">
                    <a class="" href="userInfoBrief.action">
                        <i class="icon_house_alt"></i> <span>Home</span>
                    </a>
                </li>

                <li class="sub-menu active">
                    <a class="" href="salesHistoryReport.jsp">
                        <i class="icon_documents_alt"></i> <span>History Report</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a class="" href="salesCommission.jsp">
                        <i class="icon_document_alt"></i> <span>Commission Report</span>
                    </a>
                </li>
            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->

    <!--main content start-->
    <section id="main-content">

        <section class="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="icon_menu-circle_alt"></i>Sales History Report</h3>
                </div>

                <div class="col-md-4 col-md-offset-8 col-xs-12 m-b-20">
                    <span>Please enter the query time :</span>
                    <input id="date-range-picker" class="pull-right form-control" type="text" name="date-range-picker">
                </div>

            </div>

            <div class="row">
                <div class="col-lg-12">

                    <section class="panel">
                        <table class="table table-striped table-advance table-hover">
                            <thead>
                            <tr>
                                <th> Num</th>
                                <th> Date</th>
                                <th> Area</th>
                                <th> locksNum</th>
                                <th> stocksNum</th>
                                <th> barrelsNum</th>
                            </tr>
                            </thead>
                            <tbody id="salesHistory" class="hidden">
                            <tr>
                                <td>{Num}</td>
                                <td>{Date}</td>
                                <td>{Area}</td>
                                <td>{locksNum}</td>
                                <td>{stocksNum}</td>
                                <td>{barrelsNum}</td>
                            </tr>
                            </tbody>
                        </table>

                        <table  id="paging" class="table table-bordered"
                               style="WORD-BREAK: break-all; WORD-WRAP: break-word;">
                            <tfoot class="hidden">
                            <tr>
                                <td>
                                    <ul class="pagination" active="active" disabled="disabled">
                                        <li class="previous"><span aria-hidden="true">Pre</span></li>
                                        <li class="page"><a></a></li>
                                        <li class="next"><span aria-hidden="true">Next</span></li>
                                    </ul>
                                </td>
                            </tr>
                            </tfoot>
                        </table>

                    </section>


                </div>
            </div>

        </section>
    </section>
    <!--main content end-->
</section>
<!-- container section end -->


<!-- javascripts -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- nicescroll -->
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
<!--custome script for all page-->
<script src="js/scripts.js"></script>

<script src="js/moment.min.js"></script>
<script src="js/daterangepicker.js"></script>
<script src="js/jquery.gritter.min.js"></script>
<script src="js/jquery.table.js"></script>
<script src="js/custom/hint.js"></script>
<script src="js/custom/Validform.js"></script>
<script src="js/custom/salesHistoryReport.js"></script>
<script src="js/custom/timepicker.js"></script>

</body>
</html>
