getFour();
/**
 * 四个模块
 */
function getFour() {
    $.ajax({
        type: "POST",
        url: "todaySalesInfo",
        dataType: "json",
        async: true,
        cache: false,
        success: function (data) {
            if (data.status) {
                if (data.result == "[]") {
                } else {
                    //Locks
                    $('#LPrice').html(data.result.data[0].price);
                    $('#LNum').html(data.result.data[0].num);

                    //Stocks
                    $('#SPrice').html(data.result.data[1].price);
                    $('#SNum').html(data.result.data[1].num);

                    //Barrels
                    $('#BPrice').html(data.result.data[2].price);
                    $('#BNum').html(data.result.data[2].num);

                    //Today
                    $('#ToPrice').html(data.result.total.price);
                    $('#LSPrice').html("LastWeek::" + data.result.total.lastWeek);
                    $('#LMPrice').html("LastMoon:" + data.result.total.lastMonth);

                }
            }
            //loading(8);
        },
        error: function (data) {
            //loading(8);
            hint("D", "Access to today's sales data failed!");
        }
    });

}

var salesChart = echarts.init(document.getElementById('SalesTrend'));
var pieChart = echarts.init(document.getElementById('SalesProportion'));
var barChart = echarts.init(document.getElementById('SalesArea'));
getSalesTrendLastMonth();
getSalesAreaLastMonth();
salesCommission();


/**
 * 堆叠折线图 销售趋势(上月)
 */
function getSalesTrendLastMonth() {
    $.ajax({
        type: "POST",
        url: "lastMonthInfo",
        dataType: "json",
        async: true,
        cache: false,
        success: function (data) {
            if (data.status) {
                if (data.result == "[]") {
                } else {
                    //计算饼图每个L S B总和
                    var Ltotal, Stotal, Btotal;
                    for (var i = 0; i < 30; i++) {
                        Ltotal += data.result.y[0][i];
                        Stotal += data.result.y[1][i];
                        Btotal += data.result.y[2][i];
                    }
                    getSalesProportionLastMonth(Ltotal, Stotal, Btotal);

                    salesChart.setOption({
                        title: {
                            text: 'Sales Trend'
                        },
                        tooltip: {
                            trigger: 'axis'
                        },
                        legend: {
                            data: ['Locks', 'Stocks', 'Barrels']
                        },
                        grid: {
                            left: '3%',
                            right: '4%',
                            bottom: '3%',
                            containLabel: true
                        },
                        toolbox: {
                            feature: {
                                saveAsImage: {}
                            }
                        },
                        xAxis: {
                            type: 'category',
                            boundaryGap: false,
                            data: data.result.x
                        },
                        yAxis: {
                            type: 'value'
                        },
                        series: [
                            {
                                name: 'Locks',
                                type: 'line',
                                stack: '总量',
                                data: data.result.y[0]
                            },
                            {
                                name: 'Stocks',
                                type: 'line',
                                stack: '总量',
                                data: data.result.y[1]
                            },
                            {
                                name: 'Barrels',
                                type: 'line',
                                stack: '总量',
                                data: data.result.y[2]
                            }
                        ]
                    });
                }
            } else {
                hint("D", "data.result is empty");
            }
            //loading(8);
        },
        error: function (data) {
            //loading(8);
            hint("D", "Access to lastMonthInfo failed!");
        }
    });
}

/**
 * 饼图 销售占比(上月)
 */
function getSalesProportionLastMonth(Ltotal, Stotal, Btotal) {
    pieChart.setOption({
        title: {
            text: 'Sales Proportion',
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            x: 'center',
            y: 'bottom',
            data: ['Locks', 'Stocks', 'Barrels']
        },
        toolbox: {
            show: true,
            feature: {
                saveAsImage: {show: true}
            }
        },
        calculable: true,
        series: [
            {
                name: 'Last Month',
                type: 'pie',
                radius: [30, 110],
                roseType: 'area',
                data: [
                    {value: Ltotal, name: 'Locks'},
                    {value: Stotal, name: 'Stocks'},
                    {value: Btotal, name: 'Barrels'}
                ]
            }
        ]
    });
}

/** url调用的后台接口有误
 * 柱状图 地区销售情况(上月) TOP 10
 */
function getSalesAreaLastMonth() {
    $.ajax({
        type: "POST",
        url: "queryTopTownList",
        dataType: "json",
        async: true,
        cache: false,
        success: function (data) {
            if (data.status) {
                if (data.result == "[]") {
                } else {
                    barChart.setOption({
                        color: ['#1a2732'],
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                            }
                        },
                        grid: {
                            left: '3%',
                            right: '4%',
                            bottom: '3%',
                            containLabel: true
                        },
                        xAxis: [
                            {
                                type: 'category',
                                data: data.result.name,
                                axisTick: {
                                    alignWithLabel: true
                                }
                            }
                        ],
                        yAxis: [
                            {
                                type: 'value'
                            }
                        ],
                        series: [
                            {
                                name: 'Total Number',
                                type: 'bar',
                                data: data.result.data
                            }
                        ]
                    });
                }
            } else {
                hint("D", "data.result is empty!");
            }
            //loading(8);
        },
        error: function (data) {
            //loading(8);
            hint("D", "Access to queryTopTownList failed!");
        }
    });
}

/**
 * 前8销售人员
 */
var queryTopUser = $("#queryTopUser");
var node = queryTopUser.html();
function salesCommission() {
    $.ajax({
        type: "POST",
        url: "queryTopUser",
        dataType: "json",
        async: true,
        cache: false,
        success: function (data) {
            if (data.status) {
                if (data.result != "[]") {
                    queryTopUser.html("");
                    $.each(data.result.datas, function (index, item) {
                        var titemnode = node;
                        if (index % 2 != 0) {
                            titemnode = titemnode.replace("success", "");
                        }
                        titemnode = titemnode.replace("{num}", item.num);
                        titemnode = titemnode.replace("{Salesman}", item.Salesman);
                        titemnode = titemnode.replace("{LocksNum}", item.LocksNum);
                        titemnode = titemnode.replace("{StocksNum}", item.StocksNum);
                        titemnode = titemnode.replace("{BarrelsNum}", item.BarrelsNum);
                        titemnode = titemnode.replace("{TotalPrice}", item.TotalPrice);
                        titemnode = titemnode.replace("{Commission}", item.Commission);
                        queryTopUser.append(titemnode);
                    });
                    //让tr显示
                    queryTopUser.removeClass("hidden");
                }
            } else {
                hint("D", "The data.status return false!");
            }
        },
        error: function (data) {
            hint("D", "Request failed!");
        }
    });
}

window.onresize = function () {
    salesChart.resize();
    pieChart.resize();
    barChart.resize();
}
