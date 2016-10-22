function changeDateTime(start, end) {
    salesCommission(start, end, 0);
}

var pagingNumber;
/** url请求失败
 * 佣金记录
 * @param start  开始时间 ("YYYY-MM")
 * @param end    结束时间 ("YYYY-MM")
 * @param pageNo   当前页（从0开始）
 */
var salesCommmission = $("#salesCommmission");
var node = salesCommmission.html();
function salesCommission(start, end, pageNo) {
    $.ajax({
        type: "POST",
        url: "selectCommissionByPage",
        dataType: "json",
        data: {
            startTime: start,
            endTime: end,
            pageNum: pageNo
        },
        async: true,
        cache: false,
        success: function (data) {
            if (data.status) {
                if (data.result != "[]") {
                    salesCommmission.html("");

                    //计算饼图需要数据
                    var Lnum = 0, Snum = 0, Bnum = 0;
                    //计算柱状图需要数据
                    var comData = new Array();
                    var bCom = new Array();
                    var mCom = new Array();
                    var hCom = new Array();

                    $.each(data.result.datas, function (index, item) {
                        var titemnode = node;
                        titemnode = titemnode.replace("{Date}", item.Date);
                        titemnode = titemnode.replace("{Locks}", item.Locks);
                        titemnode = titemnode.replace("{Stocks}", item.Stocks);
                        titemnode = titemnode.replace("{Barrels}", item.Barrels);
                        titemnode = titemnode.replace("{Sale}", item.Sale);
                        titemnode = titemnode.replace("{basicCommission}", item.basicCommission);
                        titemnode = titemnode.replace("{midCommission}", item.midCommission);
                        titemnode = titemnode.replace("{highCommission}", item.highCommission);
                        titemnode = titemnode.replace("{totalCommission}", item.totalCommission);
                        Lnum += item.Locks;
                        Snum += item.Stocks;
                        Bnum += item.Barrels;
                        comData[index] = item.Date;
                        bCom[index] = item.basicCommission;
                        mCom[index] = item.midCommission;
                        hCom[index] = item.highCommission;
                        salesCommmission.append(titemnode);
                    });
                    getSalesProportion(Lnum, Snum, Bnum);
                    getSalesCommission(comData, bCom, mCom, hCom);
                    //让tbody显示
                    salesCommmission.removeClass("hidden");

                    pagingNumber = pageNo;

                    $("#paging").table({
                        pageNum: data.result.totalPage,
                        currentPage: pageNo,
                        jumpTo: function (current) {
                            pagenum = current;
                            //updateVisitRank(start, end, rank, current);
                        }
                    });

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


var salesChart = echarts.init(document.getElementById('SalesTrend'));
var pieChart = echarts.init(document.getElementById('SalesProportion'));

/** 上一个ajax请求后 循环将L S B 数量分别加和填充
 * 饼图 销售占比(上月)
 */
function getSalesProportion(Lnum, Snum, Bnum) {
    pieChart.setOption({
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
                    {value: Lnum, name: 'Locks'},
                    {value: Snum, name: 'Stocks'},
                    {value: Bnum, name: 'Barrels'}
                ]
            }
        ]
    });
}

/** 上一个ajax请求后 处理数据填充
 * 堆叠折线图 销售趋势(上月)
 */
function getSalesCommission(comData, BCom, MCom, HCom) {
    salesChart.setOption({
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            data: ['basicCommission', 'midCommission', 'highCommission']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'value'
        },
        yAxis: {
            type: 'category',
            data: comData
        },
        series: [
            {
                name: 'basicCommission',
                type: 'bar',
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                        position: 'insideRight'
                    }
                },
                data: BCom
            },
            {
                name: 'midCommission',
                type: 'bar',
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                        position: 'insideRight'
                    }
                },
                data: MCom
            },
            {
                name: 'highCommission',
                type: 'bar',
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                        position: 'insideRight'
                    }
                },
                data: HCom
            }
        ]
    });
}

window.onresize = function () {
    salesChart.resize();
    pieChart.resize();
}
