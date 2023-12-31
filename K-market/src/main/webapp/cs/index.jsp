<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<script>
	
	function showAlert() {
	    alert("해당 글 작성자만 접근 가능합니다.");
	}	
	
</script>
<section id="cs">
    <div class="main">
        <h1 class="title">
            <strong>케이마켓</strong>이 도와드릴게요!
        </h1>
        <section class="notice">
            <h1>공지사항<a href="/K-market/cs/notice/noticeList.do">전체보기</a></h1>
            <ul>
           		<c:forEach var="latest1" items="${latests1}">
	                <li>
	                    <a href="/K-market/cs/notice/noticeView.do?cate=${latest1.cate}&noticeNo=${latest1.noticeNo}" class="title">[${latest1.catename}] ${latest1.title}</a>
	                    <span class="date">${latest1.formatDate()}</span>
	                </li>
                </c:forEach>
            </ul>
        </section>
        <section class="faq">
            <h1>자주 묻는 질문<a href="/K-market/cs/faq/faqList.do?cate1=10">전체보기</a></h1>
            <ol>
                <li>
                    <a href="/K-market/cs/faq/faqList.do?cate1=10">
                        <span>회원</span>
                    </a>
                </li>
                <li>
                    <a href="/K-market/cs/faq/faqList.do?cate1=20">
                        <span>쿠폰/이벤트</span>
                    </a>
                </li>
                <li>
                    <a href="/K-market/cs/faq/faqList.do?cate1=30">
                        <span>주문/결제</span>
                    </a>
                </li>
                <li>
                    <a href="/K-market/cs/faq/faqList.do?cate1=40">
                        <span>배송</span>
                    </a>
                </li>
                <li>
                    <a href="/K-market/cs/faq/faqList.do?cate1=50">
                        <span>취소/반품/교환</span>
                    </a>
                </li>
                <li>
                    <a href="/K-market/cs/faq/faqList.do?cate1=60">
                        <span>여행/숙박/항공</span>
                    </a>
                </li>
                <li>
                    <a href="/K-market/cs/faq/faqList.do?cate1=70">
                        <span>안전거래</span>
                    </a>
                </li>
            </ol>
        </section>
        <c:set var="loggedInUser" value="${sessionScope.user.uid}" />
		<c:set var="userType" value="${sessionScope.user.type}" />
		  <section class="qna">
		    <h1>문의하기<a href="/K-market/cs/qna/qnaList.do?cate1=10">전체 보기</a></h1>
		    <ul>
		        <c:forEach var="latest2" items="${latests2}">
		            <li>
		                <c:choose>
		                  <c:when test="${userType eq 100}">
		                        <a href="/K-market/cs/qna/qnaView.do?cate1=${latest2.cate1}&cate2=${latest2.cate2}&qnaNo=${latest2.qnaNo}" class="title view">
		                            [${latest2.cate2}] ${latest2.title}
		                        </a>
		                    </c:when>
		                    <c:when test="${loggedInUser eq latest2.writer}">
		                        <a href="/K-market/cs/qna/qnaView.do?cate1=${latest2.cate1}&cate2=${latest2.cate2}&qnaNo=${latest2.qnaNo}" class="title view">
		                            [${latest2.cate2}] ${latest2.title}
		                        </a>
		                    </c:when>
		                    <c:otherwise>
		                        <a href="#" onclick="showAlert(); return false;" class="title view">
		                            [${latest2.cate2}] ${latest2.title}
		                        </a>
		                    </c:otherwise>
		                </c:choose>
		                <p>
		                    <span><c:out value="${fn:substring(latest2.writer, 0, fn:length(latest2.writer) - 3)}"/>***</span>
		                    <span class="date">${latest2.formatDate()}</span>
		                </p>
		            </li>
		        </c:forEach>
		    </ul>
		    <a href="/K-market/cs/qna/qnaWrite.do" class="ask">문의글 작성 ></a>
		</section>
        <section class="tel">
            <h1>1:1 상담이 필요하신가요? </h1>
            <article>
                <div>
                    <h3>고객센터 이용안내</h3>
                    <p>
                        <span>일반회원/비회원</span>
                        <br>
                        <strong>1566-0001</strong>
                        <span>(평일 09:00 ~ 18:00)</span>
                    </p>
                    <p>
                        <span>스마일클럽 전용</span>
                        <br>
                        <strong>1566-0002</strong>
                        <span>(365일 09:00 ~ 18:00)</span>
                    </p>
                </div>
            </article>
            <article>
                <div>
                    <h3>판매상담 이용안내</h3>
                    <p>
                        <span>판매고객</span>
                        <br>
                        <strong>1566-5700</strong>
                        <span>(평일 09:00 ~ 18:00)</span>
                    </p>
                    <p>
                        <a href="#">판매자 가입 및 서류 접수 안내 〉</a>
                    </p>
                </div>
            </article>
        </section>
    </div>
</section>
<%@ include file="../_footer.jsp"%>