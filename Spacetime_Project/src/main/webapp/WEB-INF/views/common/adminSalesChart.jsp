<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 통계</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>

    #header_container {height: 80px;}

    /* content 영역 */
    #content {
        margin-left: 25%;
        padding-bottom: 80px;
        width: 60%;
        min-width: 1000px;
        box-sizing: border-box;
    }

    /* 매출통계 제목 */
    #title {
        margin: auto;
        margin-top: 80px;
        margin-bottom: 30px;
        width: 100%;
    }

    .salesData {
        height: 60%;
        padding: 20px;
        font-size: 25px;
    }

    .salesText {
        color: rgb(53, 52, 52);
        font-size: 15px;
        height: 40%;
        padding: 10px;
    }

    .chart div {
        margin: auto;
        width: 100%;
    }
    .sales_board {
        height: 100px;
        border: 2px solid lightgray;
        border-radius: 5px;
    }
    
    #today, #week, #month {
        border-right: 2px solid lightgray;
        width: 25%;
        height: 100%;
        float: left;
    }
    #year {
        width: 25%;
        height: 100%;
        float: left;
    }
    #todaySalesText div, #weekSalesText div, #monthSalesText div, #yearSalesText div {
        float:left;
        width: 50%;
    }
    
    /* Chart js */
    #chartjs {
        height: 380px;
        box-sizing: border-box;
    }
    #chartjs .line {
        height: 100%;
        width: 60%;
        /* border: 1px solid red; */
        float: left;
    }

    #chartjs .doughnut {
        height: 100%;
        width: 40%;
        /* border: 1px solid blue; */
        float: left;
    }
</style>
</head>

<body>
    
    <div class="wrap">
        <div id="header_container"><jsp:include page="header.jsp" /></div>
        <jsp:include page="adminNavi.jsp" />
        <div id="content">
    
            <!-- 매출통계 제목 -->
            <div align="left" id="title"><h3>매출 통계</h3></div>
    
            <!-- 매출통계 -->
            <div class="chart" align="center">
    
                <!-- 일, 월, 연 매출 보드 -->
                <div class="sales_board">
                    <div id="today">
                        <div id="todaySalesData" class="salesData" style="color:rgb(41, 162, 184)">${r.todaySales} 원</div>
                        <div id="todaySalesText" class="salesText">
                            <div align="left">오늘</div>
                            <div id="todaySalesCount" align="right" style="color:rgb(41, 162, 184)">${r.todaySalesCount} 건</div>
                        </div>
                    </div>
    
                    <div id="week">
                        <div id="weekSalesData" class="salesData" style="color:rgba(228, 118, 118, 0.884)">${r.weekSales} 원</div>
                        <div id="weekSalesText" class="salesText">
                            <div align="left">이번주</div>
                            <div id="weekSalesCount" align="right" style="color:rgba(228, 118, 118, 0.884)">${r.weekSalesCount} 건</div>
                        </div>
                    </div>
    
                    <div id="month">
                        <div id="monthSalesData" class="salesData" style="color:rgb(67, 211, 127)">${r.monthSales} 원</div>
                        <div id="monthSalesText" class="salesText">
                            <div align="left">이번달</div>
                            <div id="monthSalesCount" align="right" style="color:rgb(67, 211, 127)">${r.monthSalesCount} 건</div>
                        </div>
                    </div>
    
                    <div id="year">
                        <div id="yearSalesData" class="salesData" style="color:rgb(155, 41, 184)">${r.yearSales} 원</div>
                        <div id="yearSalesText" class="salesText">
                            <div align="left">올해</div>
                            <div id="yearSalesCount" align="right" style="color:rgb(155, 41, 184)">${r.yearSalesCount} 건</div>
                        </div>
                    </div>
                </div>
                <br><br><br>
                
                <div id="chartjs">
                    <div class="line">
                        <!-- 매출 그래프 -->
                        <canvas id="bar_graph" style="margin-top: 50px; margin-right: 50px;"></canvas>
                    </div>
        
                    <div class="doughnut">
                        <!-- 원형 그래프 -->
                        <canvas id="doughnut_graph" style="padding-bottom: 30px;"></canvas>
                    </div>
                </div>
            </div>
    
        </div>
    </div>
    
    <script>
    
        // 한 달 매출 bar 차트  
        const ctx = document.getElementById('bar_graph');
        
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['${bList[0].chartMonth}', '${bList[1].chartMonth}', '${bList[2].chartMonth}', '${bList[3].chartMonth}', '${bList[4].chartMonth}', '${bList[5].chartMonth}'], 
                datasets: [{
                    label: '한 달 매출',
                    data: [${bList[0].chartPrice}, ${bList[1].chartPrice}, ${bList[2].chartPrice}, ${bList[3].chartPrice}, ${bList[4].chartPrice}, ${bList[5].chartPrice}], 
                    borderWidth: 0.5
                }]
            },
            options: {
                scales: {
                    y: {
                    beginAtZero: true
                    }
                }
            }
        });
        
        // 공간타입별 도넛 차트 
        new Chart(document.getElementById("doughnut_graph"), {
            type: 'doughnut',
            data: {
                labels: ['파티룸', '카페', '공연장', '연습실', '공유주방', '갤러리', '운동시설', '스터디룸', '회의실', '촬영스튜디오'],
                datasets: [{
                    backgroundColor: ["#9e0142", "#d53e4f", "#f46d43","#fdae61", "#fee08b", "#ffffbf", "#e6f598", "#abdda4", "#66c2a5", "#3288bd", "#5e4fa2"],
                    data: [${dList[0].count}, ${dList[1].count}, ${dList[2].count}, ${dList[3].count}, ${dList[4].count}, 
                        ${dList[5].count}, ${dList[6].count}, ${dList[7].count}, ${dList[8].count}, ${dList[9].count}]
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    title: {
                        display: true,
                        text: '이번 달 공간 타입 별 이용 건수',
                        font: { size: 15}
                    }
                }
            }
        });
        
    </script>
</body>

</html>