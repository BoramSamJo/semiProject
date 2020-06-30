<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="calendar.model.vo.*, java.util.ArrayList"%>
<%
	ArrayList<CalendarViews> clist = (ArrayList)request.getAttribute("clist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<!-- <link href='../packages/core/main.css'  type="text/css" rel='stylesheet'>
<link href='../packages/daygrid/main.css' rel='stylesheet'> -->

<script src='<%=request.getContextPath()%>/packages/core/main.js'></script>
<script src='<%=request.getContextPath()%>/packages/interaction/main.js'></script>
<script src='<%=request.getContextPath()%>/packages/daygrid/main.js'></script>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    var srcCalendarEl = document.getElementById('source-calendar');

    var srcCalendar = new FullCalendar.Calendar(srcCalendarEl, {
      plugins: [ 'interaction', 'dayGrid' ],
      eventLimit: true,   // 더보기 옵션
      selectable: true,   // 선택가능 옵션
      editable: true,     // 변경가능 옵션
      droppable: true,    // 드롭가능 옵션
      defaultView: 'dayGridMonth',
	      events: [
	      <%for(int i=0; i<clist.size(); i++){ %>
	          {
	            title: '<%=clist.get(i).getProductName()%>장례 '+' <%=clist.get(i).getReservationTime()%>',
	            start: '<%=clist.get(i).getReservationDate()%>',
				id: '<%=clist.get(i).getReservationNo()%>'
	          },
		  <%} %>
          ],

      // 날짜 클릭시 이벤트 처리 
      dateClick: function(info) {
        var todayInfo = info.dateStr; // 클릭한 날짜
        //var funeral = prompt("장례식 입력");
        //var time = prompt("시간 입력");
       
        // console.log(todayInfo);
        // info.dayEl.style.backgroundColor = 'red';
        $("#today").val(todayInfo);
      },
      
  	 	// 3개 초과시 more 표시 -> 클릭시 해당 날짜 전체 표시
      views: {
          timeGrid: {
            eventLimit: 4
          }
        },
      
      // 일정 클릭시 창 띄우기
      eventClick: function(info){
        // alert('Event: ' + info.event.title);
        var rId = info.event.id;
        console.log(rId);
    	$(".infoModal").css("display","block");	
    	$("#")// 모달 띄우기
    	<%for(int i=0; i<clist.size(); i++){%>
    		if(rId==<%=clist.get(i).getReservationNo()%>){
    			$("#hiddenMName").text("<%=clist.get(i).getMemberName()%>");
	    		$("#hiddenAName").text("<%=clist.get(i).getaName()%>");
    		
    			$("#hiddenRName").text("<%=clist.get(i).getProductName()%>");
    			$("#hiddenRDate").text("<%=clist.get(i).getReservationDate().substring(0,10)%>");
    			$("#hiddenRPrice").text("<%=clist.get(i).getPrice()%>");
    			$("#hiddenRTime").text("<%=clist.get(i).getReservationTime()%>");
    			$("#hiddenAKind").text("<%=clist.get(i).getKind()%>");
    			$("#hiddenAWeight").text("<%=clist.get(i).getWeight()%>kg");
    			$("[name=deleteRNo]").val(<%=clist.get(i).getReservationNo()%>);
    		}
    	<%}%>

      },
      
      // 이벤트 드래그 시작 할때
		eventDragStart: function(info){
			var day = Number(info.event.start.toISOString().slice(8,10))+1;
			$("#inputDate").val(info.event.start.toISOString().slice(0,8)+day);	// 옮기기전 날짜 표시                                                                                                                                                                                           
		}, 	
      // 이벤트 옮기기(일정 변경)
      eventDrop: function(info) {
        // info.event.title : 현재 드롭한 이벤트의 속성(title)
        // info.event.start.toISOString().slice(0,10) : 현재 이벤트가 드롭된 날짜
        var rId = info.event.id;
        $(".infoChange").css("display","block");
    	<%for(int i=0; i<clist.size(); i++){%>
	  		if(rId==<%=clist.get(i).getReservationNo()%>){
	  			var day = Number(info.event.start.toISOString().slice(8,10))+1;
	  			
		       	$("[name=changeInputDate]").val(info.event.start.toISOString().slice(0,8)+day);	// 변경할 날짜
		       	$("#hiddenRNo").val(rId);
	  		}
	  	<%}%>
       	
        if (confirm("일정을 변경하시겠습니까?")) {
        	$(".infoChange").css("display","block");
        }else{
        	info.revert();
        	$(".infoChange").css("display","none");
        } 
      }

      
    });

    srcCalendar.render();
  });

</script>

<style>
.fc {
  direction: ltr;
  text-align: left;
}

.fc-rtl {
  text-align: right;
}

body .fc {
  /* extra precedence to overcome jqui */
  font-size: 1em;
}

/* Colors
--------------------------------------------------------------------------------------------------*/
.fc-highlight {
  /* when user is selecting cells */
  background: #bce8f1;
  opacity: 0.3;
}

.fc-bgevent {
  /* default look for background events */
  background: #8fdf82;
  opacity: 0.3;
}

.fc-nonbusiness {
  /* default look for non-business-hours areas */
  /* will inherit .fc-bgevent's styles */
  background: #d7d7d7;
}

/* Popover
--------------------------------------------------------------------------------------------------*/
.fc-popover {
  position: absolute;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
}

.fc-popover .fc-header {
  /* TODO: be more consistent with fc-head/fc-body */
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  padding: 2px 4px;
}

.fc-rtl .fc-popover .fc-header {
  flex-direction: row-reverse;
}

.fc-popover .fc-header .fc-title {
  margin: 0 2px;
}

.fc-popover .fc-header .fc-close {
  cursor: pointer;
  opacity: 0.65;
  font-size: 1.1em;
}

/* Misc Reusable Components
--------------------------------------------------------------------------------------------------*/
.fc-divider {
  border-style: solid;
  border-width: 1px;
}

hr.fc-divider {
  height: 0;
  margin: 0;
  padding: 0 0 2px;
  /* height is unreliable across browsers, so use padding */
  border-width: 1px 0;
}

.fc-bg,
.fc-bgevent-skeleton,
.fc-highlight-skeleton,
.fc-mirror-skeleton {
  /* these element should always cling to top-left/right corners */
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
}

.fc-bg {
  bottom: 0;
  /* strech bg to bottom edge */
}

.fc-bg table {
  height: 100%;
  /* strech bg to bottom edge */
}

/* Tables
--------------------------------------------------------------------------------------------------*/
.fc table {
  width: 100%;
  box-sizing: border-box;
  /* fix scrollbar issue in firefox */
  table-layout: fixed;
  border-collapse: collapse;
  border-spacing: 0;
  font-size: 1em;
  /* normalize cross-browser */
}

.fc th {
  text-align: center;
}

.fc th,
.fc td {
  border-style: solid;
  border-width: 1px;
  padding: 0;
  vertical-align: top;
}

.fc td.fc-today {
  border-style: double;
  /* overcome neighboring borders */
}

/* Internal Nav Links
--------------------------------------------------------------------------------------------------*/
a[data-goto] {
  cursor: pointer;
}

a[data-goto]:hover {
  text-decoration: underline;
}

/* Fake Table Rows
--------------------------------------------------------------------------------------------------*/
.fc .fc-row {
  /* extra precedence to overcome themes forcing a 1px border */
  /* no visible border by default. but make available if need be (scrollbar width compensation) */
  border-style: solid;
  border-width: 0;
}

.fc-row table {
  /* don't put left/right border on anything within a fake row.
     the outer tbody will worry about this */
  border-left: 0 hidden transparent;
  border-right: 0 hidden transparent;
  /* no bottom borders on rows */
  border-bottom: 0 hidden transparent;
}

.fc-row:first-child table {
  border-top: 0 hidden transparent;
  /* no top border on first row */
}

/* Day Row (used within the header and the DayGrid)
--------------------------------------------------------------------------------------------------*/
.fc-row {
  position: relative;
}

.fc-row .fc-bg {
  z-index: 1;
}

/* highlighting cells & background event skeleton */
.fc-row .fc-bgevent-skeleton,
.fc-row .fc-highlight-skeleton {
  bottom: 0;
  /* stretch skeleton to bottom of row */
}

.fc-row .fc-bgevent-skeleton table,
.fc-row .fc-highlight-skeleton table {
  height: 100%;
  /* stretch skeleton to bottom of row */
}

.fc-row .fc-highlight-skeleton td,
.fc-row .fc-bgevent-skeleton td {
  border-color: transparent;
}

.fc-row .fc-bgevent-skeleton {
  z-index: 2;
}

.fc-row .fc-highlight-skeleton {
  z-index: 3;
}

/*
row content (which contains day/week numbers and events) as well as "mirror" (which contains
temporary rendered events).
*/
.fc-row .fc-content-skeleton {
  position: relative;
  z-index: 4;
  padding-bottom: 2px;
  /* matches the space above the events */
}

.fc-row .fc-mirror-skeleton {
  z-index: 5;
}

.fc .fc-row .fc-content-skeleton table,
.fc .fc-row .fc-content-skeleton td,
.fc .fc-row .fc-mirror-skeleton td {
  /* see-through to the background below */
  /* extra precedence to prevent theme-provided backgrounds */
  background: none;
  /* in case <td>s are globally styled */
  border-color: transparent;
}

.fc-row .fc-content-skeleton td,
.fc-row .fc-mirror-skeleton td {
  /* don't put a border between events and/or the day number */
  border-bottom: 0;
}

.fc-row .fc-content-skeleton tbody td,
.fc-row .fc-mirror-skeleton tbody td {
  /* don't put a border between event cells */
  border-top: 0;
}

/* Scrolling Container
--------------------------------------------------------------------------------------------------*/
.fc-scroller {
  -webkit-overflow-scrolling: touch;
}

/* TODO: move to timegrid/daygrid */
.fc-scroller > .fc-day-grid,
.fc-scroller > .fc-time-grid {
  position: relative;
  /* re-scope all positions */
  width: 100%;
  /* hack to force re-sizing this inner element when scrollbars appear/disappear */
}

/* Global Event Styles
--------------------------------------------------------------------------------------------------*/
.fc-event {
  position: relative;
  /* for resize handle and other inner positioning */
  display: block;
  /* make the <a> tag block */
  font-size: 0.85em;
  line-height: 1.4;
  border-radius: 3px;
  border: 1px solid #3788d8;
}

.fc-event,
.fc-event-dot {
  background-color: #3788d8;
  /* default BACKGROUND color */
}

.fc-event,
.fc-event:hover {
  color: #fff;
  /* default TEXT color */
  text-decoration: none;
  /* if <a> has an href */
}

.fc-event[href],
.fc-event.fc-draggable {
  cursor: pointer;
  /* give events with links and draggable events a hand mouse pointer */
}

.fc-not-allowed,
.fc-not-allowed .fc-event {
  /* to override an event's custom cursor */
  cursor: not-allowed;
}

.fc-event .fc-content {
  position: relative;
  z-index: 2;
}

/* resizer (cursor AND touch devices) */
.fc-event .fc-resizer {
  position: absolute;
  z-index: 4;
}

/* resizer (touch devices) */
.fc-event .fc-resizer {
  display: none;
}

.fc-event.fc-allow-mouse-resize .fc-resizer,
.fc-event.fc-selected .fc-resizer {
  /* only show when hovering or selected (with touch) */
  display: block;
}

/* hit area */
.fc-event.fc-selected .fc-resizer:before {
  /* 40x40 touch area */
  content: "";
  position: absolute;
  z-index: 9999;
  /* user of this util can scope within a lower z-index */
  top: 50%;
  left: 50%;
  width: 40px;
  height: 40px;
  margin-left: -20px;
  margin-top: -20px;
}

/* Event Selection (only for touch devices)
--------------------------------------------------------------------------------------------------*/
.fc-event.fc-selected {
  z-index: 9999 !important;
  /* overcomes inline z-index */
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.fc-event.fc-selected:after {
  content: "";
  position: absolute;
  z-index: 1;
  /* same z-index as fc-bg, behind text */
  /* overcome the borders */
  top: -1px;
  right: -1px;
  bottom: -1px;
  left: -1px;
  /* darkening effect */
  background: #000;
  opacity: 0.25;
}

/* Event Dragging
--------------------------------------------------------------------------------------------------*/
.fc-event.fc-dragging.fc-selected {
  box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
}

.fc-event.fc-dragging:not(.fc-selected) {
  opacity: 0.75;
}

/* Horizontal Events
--------------------------------------------------------------------------------------------------*/
/* bigger touch area when selected */
.fc-h-event.fc-selected:before {
  content: "";
  position: absolute;
  z-index: 3;
  /* below resizers */
  top: -10px;
  bottom: -10px;
  left: 0;
  right: 0;
}

/* events that are continuing to/from another week. kill rounded corners and butt up against edge */
.fc-ltr .fc-h-event.fc-not-start,
.fc-rtl .fc-h-event.fc-not-end {
  margin-left: 0;
  border-left-width: 0;
  padding-left: 1px;
  /* replace the border with padding */
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
}

.fc-ltr .fc-h-event.fc-not-end,
.fc-rtl .fc-h-event.fc-not-start {
  margin-right: 0;
  border-right-width: 0;
  padding-right: 1px;
  /* replace the border with padding */
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}

/* resizer (cursor AND touch devices) */
/* left resizer  */
.fc-ltr .fc-h-event .fc-start-resizer,
.fc-rtl .fc-h-event .fc-end-resizer {
  cursor: w-resize;
  left: -1px;
  /* overcome border */
}

/* right resizer */
.fc-ltr .fc-h-event .fc-end-resizer,
.fc-rtl .fc-h-event .fc-start-resizer {
  cursor: e-resize;
  right: -1px;
  /* overcome border */
}

/* resizer (mouse devices) */
.fc-h-event.fc-allow-mouse-resize .fc-resizer {
  width: 7px;
  top: -1px;
  /* overcome top border */
  bottom: -1px;
  /* overcome bottom border */
}

/* resizer (touch devices) */
.fc-h-event.fc-selected .fc-resizer {
  /* 8x8 little dot */
  border-radius: 4px;
  border-width: 1px;
  width: 6px;
  height: 6px;
  border-style: solid;
  border-color: inherit;
  background: #fff;
  /* vertically center */
  top: 50%;
  margin-top: -4px;
}

/* left resizer  */
.fc-ltr .fc-h-event.fc-selected .fc-start-resizer,
.fc-rtl .fc-h-event.fc-selected .fc-end-resizer {
  margin-left: -4px;
  /* centers the 8x8 dot on the left edge */
}

/* right resizer */
.fc-ltr .fc-h-event.fc-selected .fc-end-resizer,
.fc-rtl .fc-h-event.fc-selected .fc-start-resizer {
  margin-right: -4px;
  /* centers the 8x8 dot on the right edge */
}

/* DayGrid events
----------------------------------------------------------------------------------------------------
We use the full "fc-day-grid-event" class instead of using descendants because the event won't
be a descendant of the grid when it is being dragged.
*/
.fc-day-grid-event {
  margin: 1px 2px 0;
  /* spacing between events and edges */
  padding: 0 1px;
}

tr:first-child > td > .fc-day-grid-event {
  margin-top: 2px;
  /* a little bit more space before the first event */
}

.fc-mirror-skeleton tr:first-child > td > .fc-day-grid-event {
  margin-top: 0;
  /* except for mirror skeleton */
}

.fc-day-grid-event .fc-content {
  /* force events to be one-line tall */
  white-space: nowrap;
  overflow: hidden;
}

.fc-day-grid-event .fc-time {
  font-weight: bold;
}

/* resizer (cursor devices) */
/* left resizer  */
.fc-ltr .fc-day-grid-event.fc-allow-mouse-resize .fc-start-resizer,
.fc-rtl .fc-day-grid-event.fc-allow-mouse-resize .fc-end-resizer {
  margin-left: -2px;
  /* to the day cell's edge */
}

/* right resizer */
.fc-ltr .fc-day-grid-event.fc-allow-mouse-resize .fc-end-resizer,
.fc-rtl .fc-day-grid-event.fc-allow-mouse-resize .fc-start-resizer {
  margin-right: -2px;
  /* to the day cell's edge */
}

/* Event Limiting
--------------------------------------------------------------------------------------------------*/
/* "more" link that represents hidden events */
a.fc-more {
  margin: 1px 3px;
  font-size: 0.85em;
  cursor: pointer;
  text-decoration: none;
}

a.fc-more:hover {
  text-decoration: underline;
}

.fc-limited {
  /* rows and cells that are hidden because of a "more" link */
  display: none;
}

/* popover that appears when "more" link is clicked */
.fc-day-grid .fc-row {
  z-index: 1;
  /* make the "more" popover one higher than this */
}

.fc-more-popover {
  z-index: 2;
  width: 220px;
}

.fc-more-popover .fc-event-container {
  padding: 10px;
}

/* Now Indicator
--------------------------------------------------------------------------------------------------*/
.fc-now-indicator {
  position: absolute;
  border: 0 solid red;
}

/* Utilities
--------------------------------------------------------------------------------------------------*/
.fc-unselectable {
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  -webkit-touch-callout: none;
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

/*
TODO: more distinction between this file and common.css
*/
/* Colors
--------------------------------------------------------------------------------------------------*/
.fc-unthemed th,
.fc-unthemed td,
.fc-unthemed thead,
.fc-unthemed tbody,
.fc-unthemed .fc-divider,
.fc-unthemed .fc-row,
.fc-unthemed .fc-content,
.fc-unthemed .fc-popover,
.fc-unthemed .fc-list-view,
.fc-unthemed .fc-list-heading td {
  border-color: #ddd;
}

.fc-unthemed .fc-popover {
  background-color: #fff;
}

.fc-unthemed .fc-divider,
.fc-unthemed .fc-popover .fc-header,
.fc-unthemed .fc-list-heading td {
  background: #eee;
}

.fc-unthemed td.fc-today {
  background: #fcf8e3;
}

.fc-unthemed .fc-disabled-day {
  background: #d7d7d7;
  opacity: 0.3;
}

/* Icons
--------------------------------------------------------------------------------------------------
from https://feathericons.com/ and built with IcoMoon
*/
@font-face {
  font-family: "fcicons";
  src: url("data:application/x-font-ttf;charset=utf-8;base64,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") format("truetype");
  font-weight: normal;
  font-style: normal;
}
.fc-icon {
  /* use !important to prevent issues with browser extensions that change fonts */
  font-family: "fcicons" !important;
  speak: none;
  font-style: normal;
  font-weight: normal;
  font-variant: normal;
  text-transform: none;
  line-height: 1;
  /* Better Font Rendering =========== */
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.fc-icon-chevron-left:before {
  content: "";
}

.fc-icon-chevron-right:before {
  content: "";
}

.fc-icon-chevrons-left:before {
  content: "";
}

.fc-icon-chevrons-right:before {
  content: "";
}

.fc-icon-minus-square:before {
  content: "";
}

.fc-icon-plus-square:before {
  content: "";
}

.fc-icon-x:before {
  content: "";
}

.fc-icon {
  display: inline-block;
  width: 1em;
  height: 1em;
  text-align: center;
}

/* Buttons
--------------------------------------------------------------------------------------------------
Lots taken from Flatly (MIT): https://bootswatch.com/4/flatly/bootstrap.css
*/
/* reset */
.fc-button {
  border-radius: 0;
  overflow: visible;
  text-transform: none;
  margin: 0;
  font-family: inherit;
  font-size: inherit;
  line-height: inherit;
}

.fc-button:focus {
  outline: 1px dotted;
  outline: 5px auto -webkit-focus-ring-color;
}

.fc-button {
  -webkit-appearance: button;
}

.fc-button:not(:disabled) {
  cursor: pointer;
}

.fc-button::-moz-focus-inner {
  padding: 0;
  border-style: none;
}

/* theme */
.fc-button {
  display: inline-block;
  font-weight: 400;
  color: #212529;
  text-align: center;
  vertical-align: middle;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  background-color: transparent;
  border: 1px solid transparent;
  padding: 0.4em 0.65em;
  font-size: 1em;
  line-height: 1.5;
  border-radius: 0.25em;
}

.fc-button:hover {
  color: #212529;
  text-decoration: none;
}

.fc-button:focus {
  outline: 0;
  -webkit-box-shadow: 0 0 0 0.2rem rgba(44, 62, 80, 0.25);
  box-shadow: 0 0 0 0.2rem rgba(44, 62, 80, 0.25);
}

.fc-button:disabled {
  opacity: 0.65;
}

/* "primary" coloring */
.fc-button-primary {
  color: #fff;
  background-color: #2C3E50;
  border-color: #2C3E50;
}

.fc-button-primary:hover {
  color: #fff;
  background-color: #1e2b37;
  border-color: #1a252f;
}

.fc-button-primary:focus {
  -webkit-box-shadow: 0 0 0 0.2rem rgba(76, 91, 106, 0.5);
  box-shadow: 0 0 0 0.2rem rgba(76, 91, 106, 0.5);
}

.fc-button-primary:disabled {
  color: #fff;
  background-color: #2C3E50;
  border-color: #2C3E50;
}

.fc-button-primary:not(:disabled):active,
.fc-button-primary:not(:disabled).fc-button-active {
  color: #fff;
  background-color: #1a252f;
  border-color: #151e27;
}

.fc-button-primary:not(:disabled):active:focus,
.fc-button-primary:not(:disabled).fc-button-active:focus {
  -webkit-box-shadow: 0 0 0 0.2rem rgba(76, 91, 106, 0.5);
  box-shadow: 0 0 0 0.2rem rgba(76, 91, 106, 0.5);
}

/* icons within buttons */
.fc-button .fc-icon {
  vertical-align: middle;
  font-size: 1.5em;
}

/* Buttons Groups
--------------------------------------------------------------------------------------------------*/
.fc-button-group {
  position: relative;
  display: -webkit-inline-box;
  display: -ms-inline-flexbox;
  display: inline-flex;
  vertical-align: middle;
}

.fc-button-group > .fc-button {
  position: relative;
  -webkit-box-flex: 1;
  -ms-flex: 1 1 auto;
  flex: 1 1 auto;
}

.fc-button-group > .fc-button:hover {
  z-index: 1;
}

.fc-button-group > .fc-button:focus,
.fc-button-group > .fc-button:active,
.fc-button-group > .fc-button.fc-button-active {
  z-index: 1;
}

.fc-button-group > .fc-button:not(:first-child) {
  margin-left: -1px;
}

.fc-button-group > .fc-button:not(:last-child) {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}

.fc-button-group > .fc-button:not(:first-child) {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
}

/* Popover
--------------------------------------------------------------------------------------------------*/
.fc-unthemed .fc-popover {
  border-width: 1px;
  border-style: solid;
}

/* List View
--------------------------------------------------------------------------------------------------*/
.fc-unthemed .fc-list-item:hover td {
  background-color: #f5f5f5;
}

/* Toolbar
--------------------------------------------------------------------------------------------------*/
.fc-toolbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.fc-toolbar.fc-header-toolbar {
  margin-bottom: 1.5em;
}

.fc-toolbar.fc-footer-toolbar {
  margin-top: 1.5em;
}

/* inner content */
.fc-toolbar > * > :not(:first-child) {
  margin-left: 0.75em;
}

.fc-toolbar h2 {
  font-size: 1.75em;
  margin: 0;
}

/* View Structure
--------------------------------------------------------------------------------------------------*/
.fc-view-container {
  position: relative;
}

/* undo twitter bootstrap's box-sizing rules. normalizes positioning techniques */
/* don't do this for the toolbar because we'll want bootstrap to style those buttons as some pt */
.fc-view-container *,
.fc-view-container *:before,
.fc-view-container *:after {
  -webkit-box-sizing: content-box;
  -moz-box-sizing: content-box;
  box-sizing: content-box;
}

.fc-view,
.fc-view > table {
  /* so dragged elements can be above the view's main element */
  position: relative;
  z-index: 1;
}

@media print {
  .fc {
    max-width: 100% !important;
  }

  /* Global Event Restyling
  --------------------------------------------------------------------------------------------------*/
  .fc-event {
    background: #fff !important;
    color: #000 !important;
    page-break-inside: avoid;
  }

  .fc-event .fc-resizer {
    display: none;
  }

  /* Table & Day-Row Restyling
  --------------------------------------------------------------------------------------------------*/
  .fc th,
.fc td,
.fc hr,
.fc thead,
.fc tbody,
.fc-row {
    border-color: #ccc !important;
    background: #fff !important;
  }

  /* kill the overlaid, absolutely-positioned components */
  /* common... */
  .fc-bg,
.fc-bgevent-skeleton,
.fc-highlight-skeleton,
.fc-mirror-skeleton,
.fc-bgevent-container,
.fc-business-container,
.fc-highlight-container,
.fc-mirror-container {
    display: none;
  }

  /* don't force a min-height on rows (for DayGrid) */
  .fc tbody .fc-row {
    height: auto !important;
    /* undo height that JS set in distributeHeight */
    min-height: 0 !important;
    /* undo the min-height from each view's specific stylesheet */
  }

  .fc tbody .fc-row .fc-content-skeleton {
    position: static;
    /* undo .fc-rigid */
    padding-bottom: 0 !important;
    /* use a more border-friendly method for this... */
  }

  .fc tbody .fc-row .fc-content-skeleton tbody tr:last-child td {
    /* only works in newer browsers */
    padding-bottom: 1em;
    /* ...gives space within the skeleton. also ensures min height in a way */
  }

  .fc tbody .fc-row .fc-content-skeleton table {
    /* provides a min-height for the row, but only effective for IE, which exaggerates this value,
       making it look more like 3em. for other browers, it will already be this tall */
    height: 1em;
  }

  /* Undo month-view event limiting. Display all events and hide the "more" links
  --------------------------------------------------------------------------------------------------*/
  .fc-more-cell,
.fc-more {
    display: none !important;
  }

  .fc tr.fc-limited {
    display: table-row !important;
  }

  .fc td.fc-limited {
    display: table-cell !important;
  }

  .fc-popover {
    display: none;
    /* never display the "more.." popover in print mode */
  }

  /* TimeGrid Restyling
  --------------------------------------------------------------------------------------------------*/
  /* undo the min-height 100% trick used to fill the container's height */
  .fc-time-grid {
    min-height: 0 !important;
  }

  /* don't display the side axis at all ("all-day" and time cells) */
  .fc-timeGrid-view .fc-axis {
    display: none;
  }

  /* don't display the horizontal lines */
  .fc-slats,
.fc-time-grid hr {
    /* this hr is used when height is underused and needs to be filled */
    display: none !important;
    /* important overrides inline declaration */
  }

  /* let the container that holds the events be naturally positioned and create real height */
  .fc-time-grid .fc-content-skeleton {
    position: static;
  }

  /* in case there are no events, we still want some height */
  .fc-time-grid .fc-content-skeleton table {
    height: 4em;
  }

  /* kill the horizontal spacing made by the event container. event margins will be done below */
  .fc-time-grid .fc-event-container {
    margin: 0 !important;
  }

  /* TimeGrid *Event* Restyling
  --------------------------------------------------------------------------------------------------*/
  /* naturally position events, vertically stacking them */
  .fc-time-grid .fc-event {
    position: static !important;
    margin: 3px 2px !important;
  }

  /* for events that continue to a future day, give the bottom border back */
  .fc-time-grid .fc-event.fc-not-end {
    border-bottom-width: 1px !important;
  }

  /* indicate the event continues via "..." text */
  .fc-time-grid .fc-event.fc-not-end:after {
    content: "...";
  }

  /* for events that are continuations from previous days, give the top border back */
  .fc-time-grid .fc-event.fc-not-start {
    border-top-width: 1px !important;
  }

  /* indicate the event is a continuation via "..." text */
  .fc-time-grid .fc-event.fc-not-start:before {
    content: "...";
  }

  /* time */
  /* undo a previous declaration and let the time text span to a second line */
  .fc-time-grid .fc-event .fc-time {
    white-space: normal !important;
  }

  /* hide the the time that is normally displayed... */
  .fc-time-grid .fc-event .fc-time span {
    display: none;
  }

  /* ...replace it with a more verbose version (includes AM/PM) stored in an html attribute */
  .fc-time-grid .fc-event .fc-time:after {
    content: attr(data-full);
  }

  /* Vertical Scroller & Containers
  --------------------------------------------------------------------------------------------------*/
  /* kill the scrollbars and allow natural height */
  .fc-scroller,
.fc-day-grid-container,
.fc-time-grid-container {
    /* */
    overflow: visible !important;
    height: auto !important;
  }

  /* kill the horizontal border/padding used to compensate for scrollbars */
  .fc-row {
    border: 0 !important;
    margin: 0 !important;
  }

  /* Button Controls
  --------------------------------------------------------------------------------------------------*/
  .fc-button-group,
.fc button {
    display: none;
    /* don't display any button-related controls */
  }
}
	//---------------------------------------------------------------------------------------------
	/* DayGridView
--------------------------------------------------------------------------------------------------*/
/* day row structure */
.fc-dayGridWeek-view .fc-content-skeleton,
.fc-dayGridDay-view .fc-content-skeleton {
  /* there may be week numbers in these views, so no padding-top */
  padding-bottom: 1em;
  /* ensure a space at bottom of cell for user selecting/clicking */
}

.fc-dayGrid-view .fc-body .fc-row {
  min-height: 4em;
  /* ensure that all rows are at least this tall */
}

/* a "rigid" row will take up a constant amount of height because content-skeleton is absolute */
.fc-row.fc-rigid {
  overflow: hidden;
}

.fc-row.fc-rigid .fc-content-skeleton {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
}

/* week and day number styling */
.fc-day-top.fc-other-month {
  opacity: 0.3;
}

.fc-dayGrid-view .fc-week-number,
.fc-dayGrid-view .fc-day-number {
  padding: 2px;
}

.fc-dayGrid-view th.fc-week-number,
.fc-dayGrid-view th.fc-day-number {
  padding: 0 2px;
  /* column headers can't have as much v space */
}

.fc-ltr .fc-dayGrid-view .fc-day-top .fc-day-number {
  float: right;
}

.fc-rtl .fc-dayGrid-view .fc-day-top .fc-day-number {
  float: left;
}

.fc-ltr .fc-dayGrid-view .fc-day-top .fc-week-number {
  float: left;
  border-radius: 0 0 3px 0;
}

.fc-rtl .fc-dayGrid-view .fc-day-top .fc-week-number {
  float: right;
  border-radius: 0 0 0 3px;
}

.fc-dayGrid-view .fc-day-top .fc-week-number {
  min-width: 1.5em;
  text-align: center;
  background-color: #f2f2f2;
  color: #808080;
}

/* when week/day number have own column */
.fc-dayGrid-view td.fc-week-number {
  text-align: center;
}

.fc-dayGrid-view td.fc-week-number > * {
  /* work around the way we do column resizing and ensure a minimum width */
  display: inline-block;
  min-width: 1.25em;
}
	
	//-----------------------------------------------------------------
  body {
    margin: 20px 0 0 20px;
    font-size: 14px;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  }

  #source-calendar,
  #destination-calendar {
    float: left;
    width: 600px;
    margin: 0 20px 20px 0;
  }

  #external-events {
    float: left;
    width: 150px;
    padding: 0 10px;
    border: 1px solid #ccc;
    background: #eee;
    text-align: left;
  }
  #external-events .fc-event {
    margin: 10px 0;
    cursor: pointer;
  }
  .insertform form{
  	width: 200px;
  	height: 200px;
  	float: left;
  }
  #information{
  	width: 200px;
  	heigth: auto;
  	background: black;
  	position: absolute;
  	top: 0;
  	left: 30%;
  	z-index: 999;
  	display: none;
  }
  #changeInfo{
  	width: 200px;
  	heigth: auto;
  	background: black;
  	position: absolute;
  	top: 0;
  	left: 30%;
  	z-index: 999;
  	display: none;
  	}
  	/* 모달창 */
  	/* The Modal (background) */
 .infoModal {
     position: fixed; /* Stay in place */
     display: none; /* Hidden by default */
     z-index: 1; /* Sit on top */
     left: 0;
     top: 0;
     width: 100%; /* Full width */
     height: 100%; /* Full height */
     overflow: auto; /* Enable scroll if needed */
     background-color: rgb(0,0,0); /* Fallback color */
     background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
 }

 /* Modal Content/Box */
 .infoModal-content {
     background-color: #fefefe;
     margin: 15% auto; /* 15% from the top and centered */
     padding: 20px;
     border: 1px solid #888;
     width: 50%; /* Could be more or less, depending on screen size */                          
 }
 .infoChange {
     position: fixed; /* Stay in place */
     display: none; /* Hidden by default */
     z-index: 1; /* Sit on top */
     left: 0;
     top: 0;
     width: 100%; /* Full width */
     height: 100%; /* Full height */
     overflow: auto; /* Enable scroll if needed */
     background-color: rgb(0,0,0); /* Fallback color */
     background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
 }

 /* Modal Content/Box */
 .infoChange-content {
/*      background-color: #fefefe; */
     margin: 15% auto; /* 15% from the top and centered */
     padding: 20px;
/*      border: 1px solid #888; */
/*      width: 50%; /* Could be more or less, depending on screen size */                           */
 }
#wrapCalendar{
	margin-left:450px;
/* 	margin:auto; */
	margin-top: 80px;
}
/* ----------관리자 공통 상단 -----------*/
#Backarea {
	width: 100%;
	height: 220px;
	background: #d2c4b9;
	text-align: center;
	top: 0px;
	margin: 0px;
	margin-bottom: 30px;
}
/* 상단 명(ENG.VER) */
#myTilte1 {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0px;
	margin: auto;
	margin-top: 0px;
	font-size: 50px;
	padding-top: 40px;
	position: relative;
	width: 600px;
	/* background-color: violet; */
}
/* 상단 명(KO.VER) */
#myTilte2 {
	font-family: 'Noto Sans KR', sans-serif;
	margin-top: 0px;
	color: black;
	opacity: 0.5;
	font-size: 22px;
	padding-top: 40px;
}
/* 버튼류 공통 설정 */
.infoModal button {
	border: 1px solid #242424;
	background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
	color: #242424;
	border:none;
	padding:5px 15px;
	border-radius:3px;
	font-weight:550;
}

.infoModal button:hover {
	background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
	color: #b3a193;
}
/* 모달창 설정 */
.infoModal-content{
	width:550px;
	border-radius:3px;
	border: 5px solid #b3a193;
	height:400px;
}

.mTitle{
	margin-bottom:30px;
}
.tableM{
	width:500px;
	border-collapse: collapse;
	text-indent:10px;
}
.tableM tr:nth-of-type(1)
,.tableM tr:nth-of-type(3)
,.tableM tr:nth-of-type(5)
{
	background-color:#b3a193;
	text-indent:10px;
	font-size:16px;
	font-weight:550;
}
.tableM tr:nth-of-type(1) td
,.tableM tr:nth-of-type(3) td
,.tableM tr:nth-of-type(5) td
{
	padding:5px;
}
.tableM tr:nth-of-type(2) td
,.tableM tr:nth-of-type(4) td
,.tableM tr:nth-of-type(6) td
{
/* 	border:1px solid #b3a193; */
	padding: 15px 10px;
}


/* 버튼류 공통 설정 */
.infoChange-content button {
	border: 1px solid #242424;
	background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
	color: #242424;
	border:none;
	padding:5px 15px;
	border-radius:3px;
	font-weight:550;
}
.infoChange-content button:hover {
	background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
	color: #b3a193;
}
.infoChange-content{
	background-color:white;
	width:550px;
	border-radius:3px;
	border: 5px solid #b3a193;
	height:420px;
}
.tableM2{
	width:400px;
	border-collapse: collapse;
}
.tableM2 tr:nth-of-type(1) td:nth-of-type(1)
,.tableM2 tr:nth-of-type(2) td:nth-of-type(1)
,.tableM2 tr:nth-of-type(3) td:nth-of-type(1)
,.tableM2 tr:nth-of-type(4) td:nth-of-type(1)
{
	background-color:#b3a193;
	color: #242424;
	font-weight:550;
	text-align:center;
}

.tableM2 tr:nth-of-type(1) td
,.tableM2 tr:nth-of-type(2) td
,.tableM2 tr:nth-of-type(3) td
,.tableM2 tr:nth-of-type(4) td
{
	padding: 15px 10px;
}
.tableM2 input, select{
	height:30px;
	border-radius:3px;
}
.tableM2 tr:nth-of-type(5) td
{
	border:none;
}
.fc-time{
   display : none;
}
</style>
</head>
<body>
		<%@include file="../common/managebar.jsp"%>
		
		<!-- 관리자페이지 공통 상단 -->
		<div id='Backarea'>
			<h1 id="myTilte1">Reservation Manage</h1>
			<h3 id="myTilte2">예약관리</h3>
		</div>
		
		
		<div id="wrapCalendar">
			<div id='source-calendar'></div>
		</div>
  		<br clear="both">
  		<br>
  		
  		<div id="ModalPop" class="infoModal">
	      <!-- Modal content -->
	      <div class="infoModal-content">
	                <p class="mTitle" style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24px;">예약상세정보</span></b></span></p>
	                <table align="center" class="tableM">
	                	<tr>
	                		<td colspan="6" style="text-align: center; padding:13px;background:#242424;color:#b3a193">예약 정보</td>
	                	</tr>
	                	<tr>
	                		<td colspan="2">성함 : <span id="hiddenMName"></span></td>
	                		<td colspan="2">일자 : <span id="hiddenRDate"></span></td>
	                		<td colspan="2">시간 : <span id="hiddenRTime"></span></td>
	                	</tr>
	                	<tr>
	                		<td colspan="6">장례상품</td>
	                	</tr>
	                	<tr>
	                		<td colspan="2">구분 : <span id="hiddenRName"></span></td>
	                		<td colspan="2">가격 : <span id="hiddenRPrice"></span></td>
	                	</tr>
	                	<tr>
	                		<td colspan="6">반려동물 정보</td>
	                	</tr>
						<tr>
	                		<td colspan="2">이름 : <span id="hiddenAName"></span></td>
	                		<td colspan="2">품종 : <span id="hiddenAKind"></span></td>
	                		<td colspan="2">체중 : <span id="hiddenAWeight"></span></td>
	                	</tr>
	                </table>
	            <div style="width:500px; cursor:pointer;background-color:white;text-align: center;padding-bottom: 10px;padding-top: 10px;margin:auto">
	                <form method="post" id="deleteRNo" action="<%=request.getContextPath()%>/delete.ca" onsubmit="return deleteRno();">
	                	<input type="hidden" name="deleteRNo">
	                	<button type="submit" style="font-size: 14px;">삭제</button>
		                <button type="button" class="pop_bt" onClick="close_pop();" style="font-size: 14px;">닫기</button>
	                </form>
	            </div>
	      </div>
	     </div>

		<!-- 일정변경 모달창 -->
		<div id="changePop" class="infoChange">
	      <!-- Modal content -->
	      <div class="infoChange-content">
	                <p class="mTitle" style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24px;">예약상세정보</span></b></span></p>
	                <form>
	                	<table align="center" class="tableM2" border="1px">
	                		<tr>
		                		<td>현재 날짜</td>
			                	<td><input type="text" id="inputDate" readonly></td>
			                </tr>
			                <tr>
			                	<td>변경 날짜</td>
			                	<td><input type="text" name="changeInputDate" readonly></td>
			                </tr>
			                <tr>
			                	<td>장례 상품</td>
			                	<td>
			                		<select name="changeRProduct">
			                			<option value="1">기본형</option>
			                			<option value="2">일반형</option>
			                			<option value="3">고급형</option>
			                			<option value="4">VIP형</option>
			                		</select>
			                	</td>
			                </tr>
			                <tr>
			                	<td>예약 시간</td>
			                	<td>
				                	<select name="changeRTime">
	                                  <option value="오전 9시 30분">오전 9시 30분</option>
	                                  <option value="오전 10시 30분">오전 10시 30분</option>
	                                  <option value="오전 11시 30분">오전 11시 30분</option>
	                                  <option value="오후  1시">오후 1시</option>
	                                  <option value="오후  1시 30분">오후 1시 30분</option>
	                                  <option value="오후  2시">오후 2시</option>
	                                  <option value="오후  2시 30분">오후 2시 30분</option>
	                                  <option value="오후  3시">오후 3시</option>
	                                  <option value="오후  3시 30분">오후 3시 30분</option>
	                                  <option value="오후  4시">오후 4시</option>
	                                  <option value="오후  4시 30분">오후 4시 30분</option>
	                                  <option value="오후  5시">오후 5시</option>
	                                  <option value="오후  5시 30분">오후 5시 30분</option>
	                                  <option value="오후  6시">오후 6시</option>
	                               </select>
				                </td>
			                </tr>
			                <input type="hidden" id="hiddenRNo">
	                	</table>
			            <div style="width:396px;cursor:pointer;background-color:white;border:none;border-bottom-right-radius:3px;border-bottom-left-radius:3px;text-align: center;padding-bottom: 10px;padding-top: 10px;margin-left:75px;margin-top:20px;">
			                	<button type="button" onclick="changeRinfo();" style="font-size: 14px;">변경</button>
			                <button type="button" class="pop_bt" onClick="window.location.reload();" style="font-size: 14px;">닫기</button>
			            </div>
	                </form>
	      </div>
	     </div>

  		
<!--   		<button type="button" onclick="goHome();" style="">홈으로</button> -->
  		
  		
  		<script>
  			function closeInfo(){
  				$("#information").css("display","none");
  				$("#changeInfo").css("display","none");
  				window.location.reload();
  			}
  			
  			function deleteRno(){
  				var realD = confirm("정말 삭제하시겠습니까?");
  				if(realD){
  				}else{
  					return false;
  				}
  				return true;
  			}
//   			function goHome(){
<%--   				location.href="<%=request.getContextPath()%>/index.jsp"; --%>
//   			}
  		</script>
		<script>
	
		 function close_pop(flag) {
		      $('#ModalPop').hide();
		 };
		</script>
		<!-- 일정변경시 ajax -->
		<script>
		function changeRinfo(){
			var rId = $("#hiddenRNo").val();
			var date = $("[name=changeInputDate]").val();
			var rProduct = $("[name=changeRProduct]").val();
			var rTime = $("[name=changeRTime]").val();
			$.ajax({
				url:"<%=request.getContextPath()%>/change.ca",
				type:"post",
				data:{rId:rId, date:date, rProduct:rProduct, rTime:rTime},
				success:function(data){
					if(data=="1"){
						alert("이미 예약된 시간입니다.");
					}else{
						alert("예약이 변경되었습니다.");
						window.location.reload();
					}
				},
					error:function(request,status,error){
	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
			});
		}

		</script>
</body>
</html>
