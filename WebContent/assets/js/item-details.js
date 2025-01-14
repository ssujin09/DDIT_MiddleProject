$(function () {
  // "지도보기"를 선택할 경우 해당 위치로 이동
  $(".map_view").on("click", function () {
    // 특정 위치로 이동할 요소의 ID나 클래스를 지정
    var targetElement = ".meeting_detile";

    // 특정 위치로 스크롤을 내림 (속도를 'fast'로 설정)
    var targetPosition = $(targetElement).offset().top;

    $("html, body").animate({ scrollTop: targetPosition }, 100);
  });

  /////////////////////////////////////////////////////////////////////////////////////////////////

  // 전역 스코프에서 isLiked, isBookmarked 변수를 선언
  let isLiked = false;
  let isBookmarked = false;

  // 모든 likeBtn, bookBtn 클래스를 가진 요소를 선택
  let likeBtns = document.querySelectorAll(".likeBtn");
  let bookBtns = document.querySelectorAll(".bookBtn");

  // 각 likeBtn 요소에 대해 이벤트를 추가
  likeBtns.forEach(function (likeBtn) {
    likeBtn.addEventListener("click", function () {
      // 상태 변경
      isLiked = !isLiked;

      // 아이콘 및 배경색 변경
      updateLikeStatus(likeBtn);

      // 좋아요 상태에 따라 다른 동작 수행
      // if (isLiked) {
      //   console.log("좋아요를 눌렀습니다.");
      // } else {
      //   console.log("좋아요를 취소했습니다.");
      // }

      // 현재 좋아요 수
      let currentCount = parseInt(document.getElementById('count_like').textContent, 10);

      // 좋아요 수 업데이트
      document.getElementById('count_like').textContent = isLiked ? (currentCount + 1).toString() : (currentCount - 1).toString();

    });
  });

  // 각 bookBtn 요소에 대해 이벤트를 추가
  bookBtns.forEach(function (bookBtn) {
    bookBtn.addEventListener("click", function () {
      // 상태 변경
      isBookmarked = !isBookmarked;

      // 아이콘 및 배경색 변경
      updateBookmarkStatus(bookBtn);

      // 북마크 상태에 따라 다른 동작 수행
      // if (isBookmarked) {
      //   console.log("북마크를 눌렀습니다.");
      // } else {
      //   console.log("북마크를 취소했습니다.");
      // }
    });
  });

  // 아이콘 및 배경색 변경 함수
  function updateLikeStatus(likeBtn) {
    // isLiked 값에 따라 클래스 추가 또는 제거
    likeBtn.classList.toggle("active", isLiked);
  }

  function updateBookmarkStatus(bookBtn) {
    // isBookmarked 값에 따라 클래스 추가 또는 제거
    bookBtn.classList.toggle("active", isBookmarked);
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////

//  let isStar = false;
//  let starBtns = document.querySelectorAll(".starBtn");
//
//  starBtns.forEach(function (starBtn) {
//    starBtn.addEventListener("click", function () {
//      // 상태 변경
//      isStar = !isStar;
//
//      // 아이콘 및 색상 변경
//      updateStarStatus(starBtn);
//
//      // 별점 상태에 따라 다른 동작 수행
//      // if (isStar) {
//      //   console.log("별점을 눌렀습니다.");
//      // } else {
//      //   console.log("별점을 취소했습니다.");
//      // }
//    });
//  });

//  function updateStarStatus(starBtn) {
//    // star-filled 클래스를 토글하여 별 아이콘의 색상을 변경
//    let starIcon = starBtn.querySelector("i");
//    starIcon.classList.toggle("fa-star", isStar);
//    starIcon.classList.toggle("fa-star-o", !isStar);
//
//    // 별의 색상을 변경
//    starIcon.style.color = isStar ? "#5830E0" : "";
//
//    // span의 색상을 변경
//    let spanElement = starBtn.nextElementSibling;
//    spanElement.style.color = isStar ? "#5830E0" : "";
//  }

  //24-01-11///////////////////////////////////////////////////////////////////////////////////////////////

  // 더보기 버튼을 클릭할 때 toggleMore 함수 호출
//  $(".more-btn").on("click", function () {
//    // 연관된 more-details 엘리먼트를 찾아옴
//    var moreDetails = $(this).siblings(".more-details");
//
//    // 콘솔에 로그 출력
//    console.log('Button Clicked!');
//
//    // more-details 엘리먼트의 표시 여부를 전환
//    moreDetails.toggle();
//
//    // 버튼 텍스트 변경
//    var buttonText = moreDetails.is(":visible") ? "닫기" : "더보기";
//    $(this).text(buttonText);
//  });

  //24-01-14///////////////////////////////////////////////////////////////////////////////////////////////

  // // 더보기 버튼을 클릭할 때 toggleMore 함수 호출
  // $(".menu_more_btn").on("click", function () {
  //   // 연관된 more-details 엘리먼트를 찾아옴
  //   var listMoreDetails = $(this).siblings(".menu_list_detail");

  //   // 콘솔에 로그 출력
  //   console.log('Button Clicked!');

  //   // more-details 엘리먼트의 표시 여부를 전환
  //   listMoreDetails.toggleClass("show");

  //   // 버튼 텍스트 변경
  //   var buttonText = listMoreDetails.hasClass("show") ? "닫기" : "더보기";
  //   $(this).text(buttonText);
  // });


  /////////////////////////////////////////////////////////////////////////////////////////////////

//  document.addEventListener('DOMContentLoaded', function () {
//     let modal = document.getElementById('modal');
//     let openBtn = document.querySelector('.open_btn');
//     let closeBtn = document.querySelector('.close_btn');
//     let bg = document.createElement('div');
//
//     // 모달창 열기
//     openBtn.addEventListener('click', function () {
//       // 배경 보이기
//       bg.style.position = 'fixed';
//       bg.style.top = '0px';
//       bg.style.left = '0px';
//       bg.style.width = '100%';
//       bg.style.height = '100%';
//       bg.style.background = 'rgba(0,0,0,0.3)';
//       bg.style.zIndex = '1'; // 모달보다 낮은 z-index
//       document.body.append(bg);
//
//       // 모달창 보이기
//       modal.style.display = 'block';
//       modal.style.zIndex = '2'; // 배경보다 높은 z-index
//
//       // 모달창이 보일 때 모달창 버튼 없애기
//       openBtn.style.display = 'none';
//
//     });
//
//     // 모달창 닫기
//     closeBtn.addEventListener('click', function () {
//       // 배경 숨기기
//       bg.remove();
//       modal.style.display = 'none';
//
//       // 모달창을 닫았을 때 모달창 버튼 보이기
//       openBtn.style.display = 'block';
//     });
//
//     let meeting_modal = document.getElementById('meeting_modal_detail');
//     let meeting_openBtn = document.querySelector('.meeting_modal');
//     let meeting_closeBtn = document.querySelector('.close_btn');
//     let meeting_bg = document.createElement('div');
//
//     // 모달창 열기
//     meeting_openBtn.addEventListener('click', function () {
//         // 배경 보이기
//         meeting_bg.style.position = 'fixed';
//         meeting_bg.style.top = '0px';
//         meeting_bg.style.left = '0px';
//         meeting_bg.style.width = '100%';
//         meeting_bg.style.height = '100%';
//         meeting_bg.style.background = 'rgba(0,0,0,0.3)';
//         meeting_bg.style.zIndex = '1'; // 모달보다 낮은 z-index
//         document.body.append(bg);
//
//         // 모달창 보이기
//         meeting_modal.style.display = 'block';
//         meeting_modal.style.zIndex = '2'; // 배경보다 높은 z-index
//
//         // 모달창이 보일 때 모달창 버튼 없애기
//         meeting_openBtn.style.display = 'none';
//
//     });
//
//     // 모달창 닫기
//     meeting_closeBtn.addEventListener('click', function () {
//         // 배경 숨기기
//         meeting_bg.remove();
//         meeting_modal.style.display = 'none';
//
//         // 모달창을 닫았을 때 모달창 버튼 보이기
//         meeting_openBtn.style.display = 'block';
//     });
//
//  });

  /////////////////////////////////////////////////////////////////////////////////////////////////

  // 버튼 클릭 시 슬라이드 바
  var currentIndex = 0;
  var totalMeetings = $(".meeting_info").length;

  $("#nextMeeting").on("click", function () {
    currentIndex = (currentIndex + 1) % totalMeetings;
    updateMeetingSlide();
  });

  $("#prevMeeting").on("click", function () {
    currentIndex = (currentIndex - 1 + totalMeetings) % totalMeetings;
    updateMeetingSlide();
  });

  function updateMeetingSlide() {
    var newPosition = -currentIndex * 100 + "%";
    $(".meeting_info-list").css("transform", "translateX(" + newPosition + ")");
    console.log("Current Index:", currentIndex);
  }

  // 초기에 첫 번째 리스트 보여주기
  updateMeetingSlide();
  
  /////////////////////////////////////////////////////////////////////////////////////////////////

  let meeting_modal = $('#meeting_modal_detail');
  let meeting_openBtn = $('.meeting_modal');
  let meeting_closeBtn = $('.close_btn');
  let meeting_bg = $('<div></div>');

  // 모달창 열기
  meeting_openBtn.on('click', function () {
    // 배경 보이기
    meeting_bg.css({
      'position': 'fixed',
      'top': '0px',
      'left': '0px',
      'width': '100%',
      'height': '100%',
      'background': 'rgba(0,0,0,0.3)',
      'z-index': '1' // 모달보다 낮은 z-index
    });
    $('body').append(meeting_bg);

    // 모달창 보이기
    meeting_modal.css({
      'display': 'block',
      'z-index': '2' // 배경보다 높은 z-index
    });

    // 모달창이 보일 때 모달창 버튼 없애기
    // meeting_openBtn.css('display', 'none');
  });

  // 모달창 닫기
  meeting_closeBtn.on('click', function () {
    // 모달이 닫혔을 때 모달 열기 버튼 보이기
    meeting_openBtn.css('display', 'block');

    // 배경 숨기기
    meeting_bg.remove();
    meeting_modal.css('display', 'none');
  });

});
