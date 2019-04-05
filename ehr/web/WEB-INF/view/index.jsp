<%@ page import="com.neusoft.ehr.app.entity.Employee" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/30 0030
  Time: 上午 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="include/head.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>超市后台管理首页</title>
    <script>
        $(document).ready(function () {
            $("#sidebar-nav a").click(function () {
                var href = $(this).prop("href");
                $("#mainframe").attr('src',href);
                return false;
            });
        })
    </script>
</head>
<body>


<!-- WRAPPER -->
<div id="wrapper">
    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="brand">
            <a href="index.html"><img src="${ctxStatic}/img/index.png" alt="Klorofil Logo"
                                      class="img-responsive logo"></a>
        </div>
        <div class="container-fluid">
            <div class="navbar-btn">
                <button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
            </div>
            <div class="navbar-btn navbar-btn-right">
                <a class="btn btn-success update-pro" href="${ctx}logout" title="退出系統"><i
                        class="fa fa-rocket"></i> <span>退出系統</span></a>
            </div>
            <div id="navbar-menu">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="/static/img/employee.png" class="img-circle" alt="Avatar"> <span style="color: hotpink"><%= ((Employee)session.getAttribute("principal")).getName()%></span></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- END NAVBAR -->
    <!--左侧菜单 -->
    <div id="sidebar-nav" class="sidebar">
        <div class="sidebar-scroll">
            <nav>
                <ul class="nav">
                    <li><a href="http://www.baidu.com" class="active"><i class="lnr lnr-home"></i> <span>Dashboard</span></a></li>
                    <li><a href="${ctx}/employee" class=""><i class="lnr lnr-code"></i> <span>用户管理</span></a></li>
                    <li><a href="http://www.taobao.com" class=""><i class="lnr lnr-chart-bars"></i> <span>会员管理</span></a></li>
                    <li><a href="#" class=""><i class="lnr lnr-cog"></i> <span>商品管理</span></a></li>
                    <li><a href="notifications.html" class=""><i class="lnr lnr-alarm"></i> <span>供应商管理</span></a></li>
                    <li><a href="tables.html" class=""><i class="lnr lnr-dice"></i> <span>仓库管理</span></a></li>
                    <li><a href="typography.html" class=""><i class="lnr lnr-text-format"></i> <span>数据统计</span></a>
                    </li>
                    <li><a href="icons.html" class=""><i class="lnr lnr-linearicons"></i> <span>活动促销</span></a></li>
                </ul>
            </nav>
        </div>
    </div>
    <!-- END LEFT SIDEBAR -->
    <!-- MAIN -->
    <div class="main">
        <div class="main-content">
            <div class="container-fluid">
                <iframe id="mainframe" src="" style="border: 0px;overflow: hidden;width: 100%;height: 490px">

                </iframe>
            </div>
        </div>
    </div>
    <!-- END MAIN -->
    <div class="clearfix"></div>
    <footer>
        <div class="container-fluid">
            <p class="copyright">Copyright &copy; 2019.Author name All rights reserved.Whisper</p>

        </div>
    </footer>
</div>

<script>
    $(function () {
        var data, options;

        // headline charts
        data = {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            series: [
                [23, 29, 24, 40, 25, 24, 35],
                [14, 25, 18, 34, 29, 38, 44],
            ]
        };

        options = {
            height: 300,
            showArea: true,
            showLine: false,
            showPoint: false,
            fullWidth: true,
            axisX: {
                showGrid: false
            },
            lineSmooth: false,
        };

        new Chartist.Line('#headline-chart', data, options);


        // visits trend charts
        data = {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            series: [{
                name: 'series-real',
                data: [200, 380, 350, 320, 410, 450, 570, 400, 555, 620, 750, 900],
            }, {
                name: 'series-projection',
                data: [240, 350, 360, 380, 400, 450, 480, 523, 555, 600, 700, 800],
            }]
        };

        options = {
            fullWidth: true,
            lineSmooth: false,
            height: "270px",
            low: 0,
            high: 'auto',
            series: {
                'series-projection': {
                    showArea: true,
                    showPoint: false,
                    showLine: false
                },
            },
            axisX: {
                showGrid: false,

            },
            axisY: {
                showGrid: false,
                onlyInteger: true,
                offset: 0,
            },
            chartPadding: {
                left: 20,
                right: 20
            }
        };

        new Chartist.Line('#visits-trends-chart', data, options);


        // visits chart
        data = {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            series: [
                [6384, 6342, 5437, 2764, 3958, 5068, 7654]
            ]
        };

        options = {
            height: 300,
            axisX: {
                showGrid: false
            },
        };

        new Chartist.Bar('#visits-chart', data, options);


        // real-time pie chart
        var sysLoad = $('#system-load').easyPieChart({
            size: 130,
            barColor: function (percent) {
                return "rgb(" + Math.round(200 * percent / 100) + ", " + Math.round(200 * (1.1 - percent / 100)) + ", 0)";
            },
            trackColor: 'rgba(245, 245, 245, 0.8)',
            scaleColor: false,
            lineWidth: 5,
            lineCap: "square",
            animate: 800
        });

        var updateInterval = 3000; // in milliseconds

        setInterval(function () {
            var randomVal;
            randomVal = getRandomInt(0, 100);

            sysLoad.data('easyPieChart').update(randomVal);
            sysLoad.find('.percent').text(randomVal);
        }, updateInterval);

        function getRandomInt(min, max) {
            return Math.floor(Math.random() * (max - min + 1)) + min;
        }

    });
</script>

</body>
</html>
