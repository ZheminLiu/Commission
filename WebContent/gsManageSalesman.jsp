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

    <title>Salesman Management</title>

    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet"/>
    <!-- hint style -->
    <link href="css/jquery.gritter.css" rel="stylesheet">
    <!-- Custom styles -->
    <link href="css/style.css" rel="stylesheet">

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

                <li class="sub-menu">
                    <a class="" href="curMonthlyReport.jsp">
                        <i class="icon_document_alt"></i> <span>Monthly Report</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a class="" href="historyReport.jsp">
                        <i class="icon_documents_alt"></i> <span>History Report</span>
                    </a>
                </li>

                <li class="sub-menu active">
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
        <section class="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="icon_table"></i> SalesmanList</h3>
                </div>
            </div>

            <div class="row col-sm-12">
                <button class="btn btn-lg btn-warning pull-right m-b-20" data-toggle="modal"
                        data-target="#addUser">Add new salesman
                </button>
            </div>

            <div class="row">
                <div class="col-lg-12">

                    <section class="panel">
                        <table id="table" class="table table-striped table-advance table-hover">
                            <thead>
                            <tr>
                                <th><i class="icon_genius"></i> Num</th>
                                <th><i class="icon_profile"></i> Full Name</th>
                                <th><i class="icon_document_alt"></i> Linkman</th>
                                <th><i class="icon_mail_alt"></i> Email</th>
                                <th><i class="icon_mobile"></i> Mobile</th>
                                <th><i class="icon_pin_alt"></i> Address</th>
                                <th><i class="icon_cogs"></i> Action</th>
                            </tr>
                            <thead>
                            <tbody>
                            <tr id="{userID}">
                                <td>{Num}</td>
                                <td data="Name">{Name}</td>
                                <td data="Linkman">{Linkman}</td>
                                <td data="Email">{Email}</td>
                                <td data="Mobile">{Mobile}</td>
                                <td data="Address">{Address}</td>
                                <td>
                                    <div class="btn-group">
                                        <a class="btn btn-primary" data-toggle="tootip" title="Edit"
                                           onclick="showmodel(this)">
                                            <i class="icon_pencil-edit_alt"></i>
                                        </a>
                                        <a class="btn btn-danger" data-toggle="tootip" title="Delete"
                                           onclick="deleteuser(this)">
                                            <i class="icon_close_alt"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
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

<!-- Edit salesman -->
<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true"
     id="editUser">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close"
                        type="button">&times;</button>
                <h4 class="modal-title">Details</h4>
            </div>
            <div class="modal-body">
                <form id="edituserform" class="form-horizontal" method="post">

                    <div class="form-group">
                        <label class="control-label col-sm-3">Name<span class="error">*</span></label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id='name' name='name' datatype="*1-20"
                                   nullmsg="Please input name!">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Password<span class="error">*</span></label>

                        <div class="col-sm-5">
                            <input type="password" class="form-control" id="password" name="password" datatype="*6-16"
                                   nullmsg="Please input new password!">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Mobile<span class="error">*</span></label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id='mobile' name='mobile' datatype="*"
                                   nullmsg="Please input mobile!">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Email<span class="error">*</span></label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id='email' name='email' datatype="e"
                                   nullmsg="Please input Email!">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Linkman<span class="error">*</span></label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id='linkman'
                                   name='linkman' datatype="*" nullmsg="Please input linkman!">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Address</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="address" name="address">
                        </div>
                    </div>

                    <div class="form-group hidden">
                        <label class="col-sm-3 control-label"></label>

                        <div class="col-sm-6">
                            <input type="text" class="form-control" id='uid'
                                   name='userID'/>
                        </div>
                    </div>

                </form>
            </div>

            <div class="modal-footer">
                <button class="btn btn-primary" type="submit" id="save">Save</button>
                <button class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>
<!-- Add salesman -->
<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true"
     id="addUser">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close"
                        type="button">&times;</button>
                <h4 class="modal-title">Details</h4>
            </div>
            <div class="modal-body">
                <form id="adduserfrom" class="form-horizontal" method="post">

                    <div class="form-group">
                        <label class="control-label col-sm-3">Name<span class="error">*</span></label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id='adname' name='name' datatype="*1-20"
                                   nullmsg="Please input name!">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Password<span class="error">*</span></label>

                        <div class="col-sm-5">
                            <input type="password" class="form-control" id="adpassword" name="password" datatype="*6-16"
                                   nullmsg="Please input new password!">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Mobile<span class="error">*</span></label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id='admobile' name='mobile' datatype="*"
                                   nullmsg="Please input mobile!">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Email<span class="error">*</span></label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id='ademail' name='email' datatype="e"
                                   nullmsg="Please input Email!">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Linkman<span class="error">*</span></label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id='adlinkman'
                                   name='linkman' datatype="*" nullmsg="Please input linkman!">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Address</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="adaddress" name="address">
                        </div>
                    </div>

                </form>
            </div>

            <div class="modal-footer">
                <button class="btn btn-primary" type="submit">Save</button>
                <button class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>
<!-- Delete salesman -->
<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-delete-header">
                <i class="icon_error-circle_alt"></i>&nbsp;&nbsp;Pay Attention
            </div>
            <div class="modal-body f-size-24">
                Are you sure to delete this saleman ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Let me think about it</button>
                <a class="btn btn-danger btn-ok" onclick="deleteSalesman()">DELETE</a>
            </div>
        </div>
    </div>
</div>

<!-- javascripts -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- nicescroll -->
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
<!--custome script for all page-->
<script src="js/scripts.js"></script>

<script src="js/jquery.gritter.min.js"></script>
<script src="js/custom/hint.js"></script>
<script src="js/custom/Validform.js"></script>
<script src="js/custom/gsManageSalesman.js"></script>

</body>
</html>
