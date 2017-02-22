$(document).ready(function() {
    
    $(function() {

        var statistics = $('.statistics').data('statistics');

        var finallyStats = [];
        var donutStats = [];
        $.each(statistics, function(index, stats) {
            finallyStats.push({ year: stats[0].toString(),
                                partakers: stats[1],
                                delegations: stats[2],
                                delegates: stats[3],
                                authorities: stats[4]});
            
            donutStats.push({ label: stats[0].toString(),
                                value: stats[2]});
        });

        Morris.Area({
            element: 'morris-area-chart',
            data: finallyStats,

            // [{
            //     period: '2010 Q1',
            //     iphone: 2666,
            //     ipad: null,
            //     itouch: 2647
            // }, {
            //     period: '2012 Q2',
            //     iphone: 8432,
            //     ipad: 5713,
            //     itouch: 1791
            // }],
            xkey: 'year',
            ykeys: ['delegates', 'authorities'],
            labels: ['Delegados', 'Autoridades'],
            pointSize: 2,
            hideHover: 'auto',
            resize: true
        });

        Morris.Donut({
            element: 'morris-donut-chart',
            data: donutStats,

            // [{
            //     label: "Download Sales",
            //     value: 12
            // }, {
            //     label: "In-Store Sales",
            //     value: 30
            // }, {
            //     label: "Mail-Order Sales",
            //     value: 20
            // }],
            resize: true
        });

        // var posts = $("#morris-bar-chart").data("posts");
        // var finally_posts = [];
        // finally_posts.push({ date: "12/10",
        //                     premier: 12,
        //                     champions: 15,
        //                     fa_cup: 21});
        // $.each(posts, function( index, post ) {
        //     finally_posts.push({ date: post[0],
        //                         premier: post[1],
        //                         champions: post[2],
        //                         fa_cup: post[3]});
        // });
        Morris.Bar({
            element: 'morris-bar-chart',
            data: finallyStats,
            xkey: 'year',
            ykeys: ['partakers', 'delegations', 'delegates', 'authorities'],
            labels: ['Participantes', 'Delegaciones', 'Delegados', 'Autoridades'],
            hideHover: 'auto',
            resize: true
        });
        
    });
}) 
