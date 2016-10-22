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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Software Testing and Assurance Project - Commission">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Monthly Report</title>

    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet"/>
    <!-- Custom styles -->
    <link href="css/style.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <script src="js/lte-ie7.js"></script>
    <![endif]-->
</head>
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
        <a href="bossInfoBrief.action" class="logo">Gunsmith <span class="lite">Admin</span></a>
        <!--logo end-->

        <div class="top-nav notification-row">
            <!-- notificatoin dropdown start-->
            <ul class="nav pull-right top-menu">
                <!-- user login dropdown start-->
                <li class="dropdown">
                    <a data-toggle="dropdown"
                       class="dropdown-toggle" href="#"> <span class="username">${sessionScope.boss.name}</span>
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu extended logout">
                        <div class="log-arrow-up"></div>
                        <!-- gunsmith只能登出-->
                        <!--<li class="eborder-top">-->
                        <!--<a href="myProfile.html"><i class="icon_profile"></i> My Profile</a>-->
                        <!--</li>-->
                        <!--<li>-->
                        <!--<a href="resetPassword.html"><i class="icon_key_alt"></i> Reset Password</a>-->
                        <!--</li>-->
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
        <div id="sidebar" class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu">
                <li class="">
                    <a class="" href="bossInfoBrief.action">
                        <i class="icon_house_alt"></i> <span>Home</span>
                    </a>
                </li>

                <li class="sub-menu active">
                    <a class="" href="curMonthlyReport.jsp">
                        <i class="icon_document_alt"></i> <span>Monthly Report</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a class="" href="historyReport.jsp">
                        <i class="icon_documents_alt"></i> <span>History Report</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a class="" href="gsManageSalesman.jsp">
                        <i class="icon_genius"></i> <span>Salesman Manage</span>
                    </a>
                </li>
            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->

    <!--main content start-->
    <section id="main-content">
        <section class="wrapper"> <!--overview start-->
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header">
                        <i class="icon_menu-circle_alt"></i> Monthly Report
                    </h3>
                    <ol class="breadcrumb">
                        <li><i class="icon_house_alt"></i><a href="bossInfoBrief.action">Home</a></li>
                        <li><i class="icon_document_alt"></i>Monthly Report</li>
                    </ol>
                </div>
            </div>

            <s:actionmessage cssStyle="list-style-type:none;" escape="false"/>

            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">Current
                            Month Sales Report
                        </header>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Salesperson</th>
                                    <th>CommitDate</th>
                                    <th>Locks Num</th>
                                    <th>Stocks Num</th>
                                    <th>Barrels Num</th>
                                    <th>Total Dollar</th>
                                    <th>Commission</th>
                                </tr>
                                </thead>
                                <tbody>
                                <s:iterator value="commissionLists">
                                    <tr>
                                        <td>
                                            <s:property value="salesmanID"/>
                                        </td>
                                        <td>
                                            <s:property value="salesDate"/>
                                        </td>
                                        <td>
                                            <s:property value="locksum"/>
                                        </td>
                                        <td>
                                            <s:property value="stocksum"/>
                                        </td>
                                        <td>
                                            <s:property value="barrelsum"/>
                                        </td>
                                        <td>
                                            <s:property value="totalPrice"/>
                                        </td>
                                        <td>
                                            <s:property value="totalCommission"/>
                                        </td>
                                    </tr>
                                </s:iterator>
                                </tbody>
                            </table>
                        </div>
                    </section>
                </div>
            </div>

            <br>
            <br>

            <!-- project team & activity end --> </section>
    </section>
    <!--main content end-->
</section>
<!-- container section start -->

<!-- javascripts -->
<script src="js/jquery.js"></script>
<!-- bootstrap -->
<script src="js/bootstrap.min.js"></script>
<!-- nice scroll -->
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
<!--custome script for all page-->
<script src="js/scripts.js"></script>
</body>
</html>