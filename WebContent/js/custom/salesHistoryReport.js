function changeDateTime(start, end) {
    salesHistoryReport(start, end, 0);
}

var pagingNumber;
/** url?selectSalesRecordByPage return对应属性?
 * 销售历史记录
 * @param siteId 网站id
 * @param start  开始时间 (YYYY-MM-DD")
 * @param end    结束时间 ("YYYY-MM-DD")
 * @param pageNo   当前页（从0开始）
 */
var salesHistory = $("#salesHistory");
var node = salesHistory.html();
function salesHistoryReport(start, end, pageNo) {
    $.ajax({
        type: "POST",
        url: "",
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
                    salesHistory.html("");

                    var num = 0;//序号
                    $.each(data.result.datas, function (index, item) {
                        var titemnode = node;
                        if (index % 2 != 0) {
                            titemnode = titemnode.replace("success", "");
                        }
                        titemnode = titemnode.replace("{Num}", item.id);
                        titemnode = titemnode.replace("{Date}", num);
                        titemnode = titemnode.replace("{Area}", item.name);
                        titemnode = titemnode.replace("{locksNum}", item.pv);
                        titemnode = titemnode.replace("{stocksNum}", item.uv);
                        titemnode = titemnode.replace("{barrelsNum}", item.vt);
                        salesHistory.append(titemnode);
                    });
                    //让tbody显示
                    salesHistory.removeClass("hidden");

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
        error: function () {
            hint("D", "Request failed!");
        }
    });
}