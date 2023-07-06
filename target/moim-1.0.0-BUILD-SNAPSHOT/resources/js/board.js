$(document).ready(function() {





    $('.category_more a').click(function(event){
        $('.category_more').hide();
        event.preventDefault();
        var listItems = [
            "운동", "야구관람", "게임/오락", "아웃도어", "반려동물", "문화/공연", "카페/맛집", "공예",
            "도서", "사진/영상", "사교/인맥", "음악/악기", "업종/직무", "해외/언어", "요리", "배이커리",
            "자유주제","자유주제"
        ];
        $.each(listItems, function(index, item) {
            var li = $('<li/>');
            var input = $('<input/>', {type: 'button', value: item});
            li.append(input);
            $('.board_grid').append(li);
        });
    });//End

    $(document).on('click', '.board_grid li input[type="button"]', function() {
        $(this).toggleClass('category_active'); // 현재 클릭한 버튼에 category_active 클래스를 토글(toggle)
        $('.board_grid li input[type="button"]').not(this).removeClass('category_active'); // 다른 버튼에서 category_active 클래스 제거
    });

    $('#som_insert-btn').click(function() {
        window.location.href = '/som_insert.do';
    });// End

    // $(document).on('click', '.join_gnb li a', function() {
    //     $(this).toggleClass('category_active'); // 현재 클릭한 버튼에 category_active 클래스를 토글(toggle)
    //     $('.join_gnb li a').not(this).removeClass('category_active'); // 다른 버튼에서 category_active 클래스 제거
    // });





});//End Document.ready();



// 비동기 처리

function som_insertOK() {
    console.log("som_insertOK....");

    var findCategory = $('.category_active').val();

    $.ajax({
        url: "som_insertOK.do",
        data: {
            som_title: $('#som_title').val(),
            category: findCategory,
            max_member: $('#moim_max').val()
        },
        method: 'POST',
        dataType: 'json',
        success: function(response) {
            console.log('ajax....success', response);
            alert("성공");
        },
        error:function(xhr,status,error){
            console.log('xhr.status:', xhr.status);
        }
    });
}//end som_insertOK

function join_insertOK() {
    console.log("join_insert....");

    console.log($('#insert_id').val());
    console.log($('#insert_num').val());
    console.log($('#insert_title').val());
    console.log($('#insert_content').val());

    $.ajax({
        url: "join_insertOK.do",
        data: {
            user_id: $('#insert_id').val(),
            somoim_num: $('#insert_num').val(),
            title: $('#insert_title').val(),
            content: $('#insert_content').val(),

        },
        method: 'POST',
        dataType: 'text',
        success: function(response) {
            console.log('ajax....success', response);
            location.href="join_selectAll.do?somoim_num="+$('#insert_num').val();

        },
        error:function(xhr,status,error){
            console.log('xhr.status:', xhr.status);
        }
    });
}//end function()

function join_updateOK() {
    console.log("join_updateOK....");

    $.ajax({
        url: "join_updateOK.do",
        data: {
            num: $('#update_num').val(),
            title: $('#update_title').val(),
            content: $('#insert_content').val(),

        },
        method: 'POST',
        dataType: 'text',
        success: function(response) {
            console.log('ajax....success', response);
            location.href="join_selectAll.do?somoim_num="+$('#somoim_num').val();

        },
        error:function(xhr,status,error){
            console.log('xhr.status:', xhr.status);
        }
    });
}//end function()

function join_schedule_insertOK() {
console.log("join_schedule_insert....");


$.ajax({
    url: "join_schedule_insertOK.do",
    data: {
        schedule_title: $('#sch_insert_title').val(),
        schedule_date: $('#shc_insert_date').val(),
        schedule_time: $('#shc_insert_time').val(),
        place: $('#sch_insert_place').val(),
        max_participant: $('#sch_insert_max_member').val(),
        user_id: $('#user_id').val(),
        money: $('#sch_insert_money').val(),


    },
    method: 'POST',
    dataType: 'text',
    success: function(response) {
        console.log('ajax....success', response);
        location.href="join_schedule.do";

    },
    error:function(xhr,status,error){
        console.log('xhr.status:', xhr.status);
    }
});
}//end function

function join_schedule_updateOK() {
    console.log("join_schedule_updateOK....");


    $.ajax({
        url: "join_schedule_updateOK.do",
        data: {
            num: $('#update_num').val(),
            schedule_title: $('#sch_insert_title').val(),
            schedule_date: $('#shc_insert_date').val(),
            schedule_time: $('#shc_insert_time').val(),
            place: $('#sch_insert_place').val(),
            max_participant: $('#sch_insert_max_member').val(),
            money: $('#sch_insert_money').val(),


        },
        method: 'POST',
        dataType: 'text',
        success: function(response) {
            console.log('ajax....success', response);
            location.href="join_schedule.do";

        },
        error:function(xhr,status,error){
            console.log('xhr.status:', xhr.status);
        }
    });
}//end function()