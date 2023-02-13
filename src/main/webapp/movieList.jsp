<%@page import="reservation.ReservationDTO"%>
<%@page import="reservation.ReservationDAO"%>
<%@page import="java.util.function.Function"%>
<%@page import="java.sql.Date"%>
<%@page import="movie.MovieDTO"%>
<%@page import="movie.MovieDAO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="css/more_movie.css">
<link href="css/styles.css" rel="stylesheet" />
<link href="css/index.css" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100">
  <% 
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
  %>
 
<%
if(userID != null) {
ReservationDAO Mydao=new ReservationDAO();
List mylist=Mydao.myReservtion(userID);
for(int i=0; i<mylist.size(); i++) {
	  ReservationDTO dto=(ReservationDTO)mylist.get(i);
	  String movieName=dto.getMovieName();
	  String movieTheater=dto.getMovieTheater();
	  String day_re=dto.getDay_re();
	  String time_re=dto.getTime_re();
%>
<div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-xl modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"><%=dto.getMovieName() %></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	<p class="modal-title"><%=dto.getMovieTheater() %></p>
        	<p class="modal-title"><%=dto.getDay_re() %></p>
        	<p class="modal-title"><%=dto.getTime_re() %></p>
        </div>
      </div>
    </div>
</div>
<%
}
}else {
%>
<div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-xl modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">로그인/회원가입을 해주세요</h4>
          <a class="nav-link" href="userLogin.jsp">로그인</a>
          <a class="nav-link" href="userRegister.jsp">회원가입</a>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
      </div>
    </div>
</div>
<%
}
%>
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">
                    <a class="navbar-brand" href="index.jsp">Start Bootstrap</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
<%
	if(userID == null) {
%>
                            <li class="nav-item"><a class="nav-link" href="userLogin.jsp">로그인</a></li>
                            <li class="nav-item"><a class="nav-link" href="userRegister.jsp">회원가입</a></li>
                            <li class="nav-item"><a class="nav-link" data-toggle="modal" data-target="#myModal" href="">mypage</a></li>
<%
	} else {
%>
							<li class="nav-item"><a class="nav-link" href="userLogout.jsp">로그아웃</a></li>
                            <li class="nav-item"><a class="nav-link"data-toggle="modal" data-target="#myModal" href="">mypage</a></li>
<%
	}
%>
                        </ul>
                    </div>
                    
                </div>
            </nav>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="justify-content: space-around;">
                        <ul class="navbar-nav mb-2 mb-lg-0" >
                            <li class="nav-item"><a class="nav-link" href="movieList.jsp">영화차트</a></li>
                            <li class="nav-item"><a class="nav-link" href="reservation.jsp">영화예매</a></li>
                            <li class="nav-item"><a class="nav-link" href="faq.html">FAQ</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
    <!--more-movie-->
    <div  class="more_movie_container ">
        <div class="more_movie_contents location-fixed">
            <div class="more_movie_inner_wrap">
                <h2 class="more_tit">전체영화</h2>
                <div class="more_movie_tab-list">
                    <ul class="tabs">
                        <li onclick="tab-1()" class="tab-link current" data-tab="tab-1" ><a>박스오피스</a></li>
                        <li class="tab-link" data-tab="tab-2"><a>상영예정작</a></li>
                        <li class="tab-link" data-tab="tab-3"><a>특별상영</a></li>
                    </ul>

                    <div id="tab-1" class="tab-content current">
                        <div class="more_movie_info">
                            <ol>
                            <%
MovieDAO dao=new MovieDAO();
List list=dao.movieList();
for(int i=0; i<9; i++) {
	  MovieDTO dto=(MovieDTO)list.get(i);
	  String movieName=dto.getMovieName();
	  String movieImage=dto.getMovieImage();
	  String movieState=dto.getMovieState();
	  String ageImage=dto.getAgeImage();
	  Date movieDate=dto.getMovieDate();
	  Integer movieNum=dto.getMovieNum();
%>
                                <li>
                                    <div class="more_list_info">
                                        <p class="rank"><%=dto.getMovieNum() %><span class="ir">위</span></p>
                                        <img src="<%=dto.getMovieImage() %>" alt="<%=dto.getMovieName() %>">
                                        <div class="tit-area">
                                            <img class="movie-grade" src=<%=dto.getAgeImage() %> style="width: 23px; height: 24px;">    
                                            <p title=<%=dto.getMovieName() %> class="tit"><%=dto.getMovieName() %></p>
                                        </div>
                                        <div class="rate-date">   
                                            <span class="date"><%=dto.getMovieState() %> <%=dto.getMovieDate() %></span>
                                        </div>
                                        <div class="btn-util">    
                                            <button type="button" class="button btn-like" data-no="22046700">
                                                <i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i>
                                                <span>1.4k</span>
                                            </button>      
                                            <div class="case movieStat4">        
                                                <a href="./reservation.jsp?movieName=<%=dto.getMovieName() %>" class="button purple bokdBtn" title="영화 예매하기">예매</a>        
                                            </div>   
                                        </div>
                                    </div>
                                </li>
<%
}
%>
</ol>
							<button onclick="btnAddMovie1()" type="button" class="btnAddMovie btn1" id="btnAddMovie">더보기 
                                <i class="iconset ico-btn-more-arr"></i>
                            </button>
 <script>
    function btnAddMovie1() {
    	$(".movie_more").css({
    	      "display":"inline-block"
   	    })
   	    $(".btn1").css({
   	      "display":"none"
   	    })
    }  
  </script>
  <ol class="movie_more" style="display: none;">
<%
MovieDAO dao2=new MovieDAO();
List list2=dao2.movieList();
for(int i=9; i<15; i++) {
	  MovieDTO dto=(MovieDTO)list.get(i);
	  String movieName=dto.getMovieName();
	  String movieImage=dto.getMovieImage();
	  String movieState=dto.getMovieState();
	  String ageImage=dto.getAgeImage();
	  Date movieDate=dto.getMovieDate();
	  Integer movieNum=dto.getMovieNum();
%>
                                <li>
                                    <div class="more_list_info">
                                        <p class="rank"><%=dto.getMovieNum() %><span class="ir">위</span></p>
                                        <img src="<%=dto.getMovieImage() %>" alt="<%=dto.getMovieName() %>">
                                        <div class="tit-area">
                                            <img class="movie-grade" src=<%=dto.getAgeImage() %> style="width: 23px; height: 24px;">    
                                            <p title=<%=dto.getMovieName() %> class="tit"><%=dto.getMovieName() %></p>
                                        </div>
                                        <div class="rate-date">   
                                            <span class="date"><%=dto.getMovieState() %> <%=dto.getMovieDate() %></span>
                                        </div>
                                        <div class="btn-util">    
                                            <button type="button" class="button btn-like" data-no="22046700">
                                                <i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i>
                                                <span>1.4k</span>
                                            </button>      
                                            <div class="case movieStat4">        
                                                <a href="./reservation.jsp?movieName=<%=dto.getMovieName() %>" class="button purple bokdBtn" title="영화 예매하기">예매</a>    
                                            </div>    
                                        </div>
                                    </div>
                                </li>
<%
	}
%>
                             </ol>
                          </div>
                     </div>
                     <div id="tab-2" class="tab-content">
                        <div class="more_movie_info">
                            <ol>
                            <%
MovieDAO dao3=new MovieDAO();
List list3=dao3.movieList();
for(int i=0; i<9; i++) {
	  MovieDTO dto=(MovieDTO)list.get(i);
	  String movieName=dto.getMovieName();
	  String movieImage=dto.getMovieImage();
	  String movieState=dto.getMovieState();
	  String ageImage=dto.getAgeImage();
	  Date movieDate=dto.getMovieDate();
	  Integer movieNum=dto.getMovieNum();
%>
                                <li>
                                    <div class="more_list_info">
                                        <p class="rank"><%=dto.getMovieNum() %><span class="ir">위</span></p>
                                        <img src="<%=dto.getMovieImage() %>" alt="<%=dto.getMovieName() %>">
                                        <div class="tit-area">
                                            <img class="movie-grade" src=<%=dto.getAgeImage() %> style="width: 23px; height: 24px;">    
                                            <p title=<%=dto.getMovieName() %> class="tit"><%=dto.getMovieName() %></p>
                                        </div>
                                        <div class="rate-date">   
                                            <span class="date"><%=dto.getMovieState() %> <%=dto.getMovieDate() %></span>
                                        </div>
                                        <div class="btn-util">    
                                            <button type="button" class="button btn-like" data-no="22046700">
                                                <i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i>
                                                <span>1.4k</span>
                                            </button>      
                                            <div class="case movieStat4">        
                                                <a href="./reservation.jsp?movieName=<%=dto.getMovieName() %>" class="button purple bokdBtn" title="영화 예매하기">예매</a>       
                                            </div>   
                                        </div>
                                    </div>
                                </li>
<%
}
%>
</ol>
							<button onclick="btnAddMovie2()" type="button" class="btnAddMovie btn2" id="btnAddMovie">더보기 
                                <i class="iconset ico-btn-more-arr"></i>
                            </button>
 <script>
    function btnAddMovie2() {
    	$(".movie_more2").css({
    	      "display":"inline-block"
   	    })
   	    $(".btn2").css({
   	      "display":"none"
   	    })
    }  
  </script>
  <ol class="movie_more2" style="display: none;">
<%
MovieDAO dao4=new MovieDAO();
List list4=dao4.movieList();
for(int i=9; i<15; i++) {
	  MovieDTO dto=(MovieDTO)list.get(i);
	  String movieName=dto.getMovieName();
	  String movieImage=dto.getMovieImage();
	  String movieState=dto.getMovieState();
	  String ageImage=dto.getAgeImage();
	  Date movieDate=dto.getMovieDate();
	  Integer movieNum=dto.getMovieNum();
%>
                                <li>
                                    <div class="more_list_info">
                                        <p class="rank"><%=dto.getMovieNum() %><span class="ir">위</span></p>
                                        <img src="<%=dto.getMovieImage() %>" alt="<%=dto.getMovieName() %>">
                                        <div class="tit-area">
                                            <img class="movie-grade" src=<%=dto.getAgeImage() %> style="width: 23px; height: 24px;">    
                                            <p title=<%=dto.getMovieName() %> class="tit"><%=dto.getMovieName() %></p>
                                        </div>
                                        <div class="rate-date">   
                                            <span class="date"><%=dto.getMovieState() %> <%=dto.getMovieDate() %></span>
                                        </div>
                                        <div class="btn-util">    
                                            <button type="button" class="button btn-like" data-no="22046700">
                                                <i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i>
                                                <span>1.4k</span>
                                            </button>      
                                            <div class="case movieStat4">        
                                                <a href="./reservation.jsp?movieName=<%=dto.getMovieName() %>" class="button purple bokdBtn" title="영화 예매하기">예매</a>      
                                            </div>   
                                        </div>
                                    </div>
                                </li>
<%
	}
%>
                             </ol>
                          </div>
                     </div>
                       <div id="tab-3" class="tab-content">
                        <div class="more_movie_info">
                            <ol>
                            <%
MovieDAO dao5=new MovieDAO();
List list5=dao5.movieList();
for(int i=0; i<9; i++) {
	  MovieDTO dto=(MovieDTO)list.get(i);
	  String movieName=dto.getMovieName();
	  String movieImage=dto.getMovieImage();
	  String movieState=dto.getMovieState();
	  String ageImage=dto.getAgeImage();
	  Date movieDate=dto.getMovieDate();
	  Integer movieNum=dto.getMovieNum();
%>
                                <li>
                                    <div class="more_list_info">
                                        <p class="rank"><%=dto.getMovieNum() %><span class="ir">위</span></p>
                                        <img src="<%=dto.getMovieImage() %>" alt="<%=dto.getMovieName() %>">
                                        <div class="tit-area">
                                            <img class="movie-grade" src=<%=dto.getAgeImage() %> style="width: 23px; height: 24px;">    
                                            <p title=<%=dto.getMovieName() %> class="tit"><%=dto.getMovieName() %></p>
                                        </div>
                                        <div class="rate-date">   
                                            <span class="date"><%=dto.getMovieState() %> <%=dto.getMovieDate() %></span>
                                        </div>
                                        <div class="btn-util">    
                                            <button type="button" class="button btn-like" data-no="22046700">
                                                <i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i>
                                                <span>1.4k</span>
                                            </button>      
                                            <div class="case movieStat4">        
                                                <a href="./reservation.jsp?movieName=<%=dto.getMovieName() %>" class="button purple bokdBtn" title="영화 예매하기">예매</a>     
                                            </div>   
                                        </div>
                                    </div>
                                </li>
<%
}
%>
</ol>
							<button onclick="btnAddMovie3()" type="button" class="btnAddMovie btn3" id="btnAddMovie">더보기 
                                <i class="iconset ico-btn-more-arr"></i>
                            </button>
 <script>
    function btnAddMovie3() {
    	$(".movie_more3").css({
    	      "display":"inline-block"
   	    })
   	    $(".btn3").css({
   	      "display":"none"
   	    })
    }  
  </script>
  <ol class="movie_more3" style="display: none;">
<%
MovieDAO dao6=new MovieDAO();
List list6=dao6.movieList();
for(int i=9; i<15; i++) {
	  MovieDTO dto=(MovieDTO)list.get(i);
	  String movieName=dto.getMovieName();
	  String movieImage=dto.getMovieImage();
	  String movieState=dto.getMovieState();
	  String ageImage=dto.getAgeImage();
	  Date movieDate=dto.getMovieDate();
	  Integer movieNum=dto.getMovieNum();
%>
                                <li>
                                    <div class="more_list_info">
                                        <p class="rank"><%=dto.getMovieNum() %><span class="ir">위</span></p>
                                        <img src="<%=dto.getMovieImage() %>" alt="<%=dto.getMovieName() %>">
                                        <div class="tit-area">
                                            <img class="movie-grade" src=<%=dto.getAgeImage() %> style="width: 23px; height: 24px;">    
                                            <p title=<%=dto.getMovieName() %> class="tit"><%=dto.getMovieName() %></p>
                                        </div>
                                        <div class="rate-date">   
                                            <span class="date"><%=dto.getMovieState() %> <%=dto.getMovieDate() %></span>
                                        </div>
                                        <div class="btn-util">    
                                            <button type="button" class="button btn-like" data-no="22046700">
                                                <i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i>
                                                <span>1.4k</span>
                                            </button>      
                                            <div class="case movieStat4">        
                                                <a href="./reservation.jsp?movieName=<%=dto.getMovieName() %>" class="button purple bokdBtn" title="영화 예매하기">예매</a>       
                                            </div>   
                                        </div>
                                    </div>
                                </li>
<%
	}
%>
                             </ol>
                          </div>
                     </div>
                  </div>
               </div>
             </div>
          </div>
          <!-- Footer-->
        <footer class="bg-dark py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; Your Website 2022</div></div>
                    <div class="col-auto">
                        <a class="link-light small" href="#!">Privacy</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Terms</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Contact</a>
                    </div>
                </div>
            </div>
        </footer>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<script src="js/movie_tab.js"></script>

</body>
</html>