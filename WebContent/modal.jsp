<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* 모달 초기에는 숨기기 */
        #myModal {
            display: none;
        }

         body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa; /* 밝은 회색 배경으로 변경 */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .modal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            z-index: 1;
            width: 300px;
            max-width: 80%;
        }

        .modal label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        .modal input,
        .modal textarea,
        .modal button {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .modal button {
            background-color: #8e44ad; /* 보라색 버튼으로 변경 */
            color: #fff;
            border: none;
            cursor: pointer;
        }

        .modal button:hover {
            background-color: #6c3483; /* 버튼에 호버 효과를 주기 위한 보라색 변경 */
        }

        .modal-close {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 20px;
            color: #555;
            cursor: pointer;
        }

        .open-modal-btn {
            background-color: #8e44ad; /* 보라색 버튼으로 변경 */
            color: #fff;
            padding: 15px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .open-modal-btn:hover {
            background-color: #6c3483; /* 버튼에 호버 효과를 주기 위한 보라색 변경 */
        }

        .success-message {
            color: #8e44ad; /* 성공 메시지 텍스트 색상을 보라색으로 변경 */
            font-weight: bold;
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
<button class="open-modal-btn" onclick="openModal()">모임 정보 입력</button>

<div id="myModal" class="modal">
    <span class="modal-close" onclick="closeModal()">&times;</span>
    <label for="locationInput">지역:</label>
    <input type="text" id="locationInput" placeholder="대전">

    <label for="dateInput">날짜:</label>
    <input type="date" id="dateInput">

    <label for="timeInput">시간:</label>
    <input type="time" id="timeInput">

    <label for="maxPeopleInput">최대 인원:</label>
    <input type="number" id="maxPeopleInput" min="1">

    <label for="descriptionInput">한줄 내용:</label>
    <textarea id="descriptionInput" rows="4" placeholder="모임에 대한 간단한 설명"></textarea>

    <button onclick="submitForm()">등록</button>
      <div id="successMessage" class="success-message"></div>
</div>
    <script>
    function openModal() {
        document.getElementById('myModal').style.display = 'block';
    }

    function closeModal() {
        document.getElementById('myModal').style.display = 'none';
    }

    function submitForm() {
    	var locationValue = document.getElementById('locationInput').value;
    	var dateValue = document.getElementById('dateInput').value;
    	var timeValue = document.getElementById('timeInput').value;
    	var maxPeopleValue = document.getElementById('maxPeopleInput').value;
    	var descriptionValue = document.getElementById('descriptionInput').value;
//     	var hidden = document.getElementById('hiddenInput').value; // 수정된 부분
		var hidden = "<%=(int)request.getAttribute("str")%>";
		console.log(hidden);

        // Ajax 요청
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    // 응답 처리
                    document.getElementById('successMessage').innerText = '모임이 성공적으로 등록되었습니다!';
                    setTimeout(function() {
                        successMessageElement.innerText = '';
                        closeModal();
                        // 페이지 새로고침
                        location.reload();
                    }, 2000);
                    // 성공 메시지를 몇 초 후에 숨기거나 적절한 방식으로 처리 가능
                    setTimeout(function() {
                        document.getElementById('successMessage').innerText = '';
                        closeModal();
                    }, 2000);
                } else {
                    // 에러 처리
                    document.getElementById('successMessage').innerText = '등록 실패. 다시 시도해주세요.';
                }
            }
        };

        // 동적으로 서블릿 URL 생성
        var servletUrl = "restaurant/meeting.do"; // 실제 서블릿 경로
        var urlWithParams = servletUrl + "?location=" + encodeURIComponent(locationValue) +
                            "&date=" + encodeURIComponent(dateValue) +
                            "&time=" + encodeURIComponent(timeValue) +
                            "&maxPeople=" + encodeURIComponent(maxPeopleValue) +
                            "&description=" + encodeURIComponent(descriptionValue)+
                            "&hidden="+ encodeURIComponent(hidden);

        xhr.open("POST", urlWithParams, true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');

        xhr.send();
    }

    </script>
</body>
</html>
