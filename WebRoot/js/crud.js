$(function(){
	//页面加载完就请求json数组填充（默认全部）
	updateAllMember({
		flags: 'all'
	});

	//条件筛选
	$('p[class="lead"]').click(function(event){
		//console.log($(this).text());
		$('#myDropdown').html($(this).text() + '<span class="caret"></span>');
		if($(this).text() == '全部'){
			//请求全部数据
			$('#second-select').html('');
			$('#orderLabel').text('');
			updateAllMember({
				flags: 'all'
			});
		}else if($(this).text() == '按性别筛选'){
			//生成第二select
			$('#second-select').html('');
			$('#orderLabel').text('');
			$('#second-select').html('\
				<button id="sex" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">\
				    男<span class="caret"></span>\
				</button>\
				  <ul class="dropdown-menu">\
				    <li><p class="lead" name="sec">男</p></li>\
				    <li><p class="lead" name="sec">女</p></li>\
				  </ul>');
			//请求数据，填充数据
			updateMemberBySex({
				sex: '男',
				flags: 'sex'
			});

			//捕捉用户点击选项
			$('p[name="sec"]').click(function(event){
				$('#sex').html($(this).text() + '<span class="caret"></span>');
				$('#orderLabel').text('');
				updateMemberBySex({
					sex: $(this).text(),
					flags: 'sex'
				});
			});
		}else if($(this).text() == '按学院筛选'){
			//生成第二select
			$('#second-select').html('');
			$('#orderLabel').text('');
			$('#second-select').html('\
				<button id="academy" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">\
				    信息科学与工程<span class="caret"></span>\
				</button>\
				  <ul class="dropdown-menu">\
				    <li><p class="lead" name="sec">信息科学与工程</p></li>\
				    <li><p class="lead" name="sec">新闻与传播</p></li>\
				    <li><p class="lead" name="sec">经济与贸易</p></li>\
				    <li><p class="lead" name="sec">设计艺术</p></li>\
				    <li><p class="lead" name="sec">化学化工</p></li>\
				  </ul>');
			//请求数据，填充数据。请求默认值（信息科学与工程）
			updateMemberByAcademyName({
				academyName: '信息科学与工程',
				flags: 'academyName'
			});

			//更新学院列表 todo
			/*
			$.getJSON('action',function(res){
				// return academyName[]
			});
			*/

			//捕捉用户点击选项
			$('p[name="sec"]').click(function(event){
				$('#academy').html($(this).text() + '<span class="caret"></span>');
				$('#orderLabel').text('');
				updateMemberByAcademyName({
					academyName: $(this).text(),
					flags: 'academyName'
				});
			});
		}else{
			alert("未知错误，请联系开发人员，13290967808");
		}
	});

	//新增学生信息
	$('#addNewMemberBtn').click(function(event) {
		/* Act on the event */
		var data = {
			name: $('#name').val(),
			sex: $('input[type="radio"][name="sex"]:checked').val(),
			tel: $('#tel').val(),
			academyName: $('input[type="radio"][name="academyName"]:checked').val(),
			joinTime: $('#joinTime').val()
		};
		submitFormForAddOrUpdate(data, 1);
	});

	//更改成员信息
	//1.后台获取数据填充form(事件委托)
	$(document).on('click', 'button[name="changeMemberInfo"]', function(event) {
		event.preventDefault();
		/* Act on the event */
		//console.log($(this).val());
		$('#name1').val($(this).val());
		var data = {
			name: $(this).val(),
			flags: 'name'
		};
		var strdata = JSON.stringify(data);
		$.post('findMember', {myjson: strdata}, function(data, textStatus, xhr) {
			/*optional stuff to do after success */
			console.log(data);
			for(var i in data){
				$('#joinTime1').val(data[i].joinTime);
				$('#tel1').val(data[i].tel);
				//性别
				if((data[i].sex) == '男'){
					$('input[name="sex1"][value="男"]').attr({
						checked: true
					});
				}else if((data[i].sex) == '女'){
					$('input[name="sex1"][value="女"]').attr({
						checked: true
					});
				}
				//学院
				//重构：定义变量academy，for循环
				if((data[i].academyName) == '信息科学与工程'){
					$('input[name="academyName1"][value="信息科学与工程"]').attr({
						checked: true
					});
				}else if((data[i].academyName) == '经济与贸易'){
					$('input[name="academyName1"][value="经济与贸易"]').attr({
						checked: true
					});
				}else if((data[i].academyName) == '新闻与传播'){
					$('input[name="academyName1"][value="新闻与传播"]').attr({
						checked: true
					});
				}else if((data[i].academyName) == '设计艺术'){
					$('input[name="academyName1"][value="设计艺术"]').attr({
						checked: true
					});
				}else if((data[i].academyName) == '化学化工'){
					$('input[name="academyName1"][value="化学化工"]').attr({
						checked: true
					});
				}
			}
		});
		//2.提交按钮完成更新
		$('#identUpdateInfo').click(function(event) {
			/* Act on the event */
			var data = {
				name: $('#name1').val(),
				sex: $('input[type="radio"][name="sex1"]:checked').val(),
				tel: $('#tel1').val(),
				academyName: $('input[type="radio"][name="academyName1"]:checked').val(),
				joinTime: $('#joinTime1').val()
			};
			submitFormForAddOrUpdate(data, 2);
		});
	});
	//删除成员信息
	$(document).on('click', 'button[name="deleteMemberInfo"]', function(){
		var ident = confirm("确定删除吗？");
		if(ident){
			var data = {
				name: $(this).val()
			};
			var strdata = JSON.stringify(data);
			$.post('delMember', {myjson: strdata}, function(data, textStatus, xhr) {
				/*optional stuff to do after success */
				window.location.href = 'crud.jsp';
			});
		}
	});

	//查找成员信息
	$('#findByName').click(function(event) {
		/* Act on the event */
		$('#myDropdown').html('全部<span class="caret"></span>');
		$('#second-select').html('');
		$('#orderLabel').text('');
		//$('#nameForFind').val('');
		updateMemberByName({
			name: $('#nameForFind').val(),
			flags: 'name'
		});
		$('#nameForFind').val('');
	});

	//排序
	var orderCalculator = 2;
	$('#order').click(function(event) {
		/* Act on the event */
		$('#myDropdown').html('全部<span class="caret"></span>');
		$('#second-select').html('');
		if(orderCalculator%2 == 0){
			//正序
			$('#orderLabel').text('正序');
			updateMemberOrderByJoinTime({
				flags: 'correctOrder'
			});
		}else if(orderCalculator%2 == 1){
			//倒序
			$('#orderLabel').text('倒序');
			updateMemberOrderByJoinTime({
				flags: 'reverseOrder'
			});
		}else{
			alert("正序倒序计数错误，联系开发人员排查");
		}
		orderCalculator++;
	});
}); // $(function(){});	结束符

//返回全部成员名单
function updateAllMember(data){
	var strdata = JSON.stringify(data);
	$.post('getMembersBySelected', {myjson: strdata}, function(data, textStatus, xhr) {
			/*return member[] */
			//console.log(data);
			//console.log(arr.length);
			updateMember(data);
	});
}

//根据提交的学院名称查找返回成员名单
function updateMemberByAcademyName(data){
		var strdata = JSON.stringify(data);
		$.getJSON('getMembersBySelected', {myjson: strdata}, function(data) {
			/*return member[] */
			updateMember(data);
		});
}

//根据提交的性别查找返回成员名单
function updateMemberBySex(data){
		var strdata = JSON.stringify(data);
		$.post('getMembersBySelected', {myjson: strdata}, function(data, textStatus, xhr) {
			/*return member[] */
			updateMember(data);
		});
}

//根据提交的姓名查找返回成员名单
function updateMemberByName(data){
		var strdata = JSON.stringify(data);
		$.post('getMembersBySelected', {myjson: strdata}, function(data, textStatus, xhr) {
			/*return member[] */
			updateMember(data);
		});
}

//正序或倒序查找返回成员名单
function updateMemberOrderByJoinTime(data){
		var strdata = JSON.stringify(data);
		$.post('getMembersBySelected', {myjson: strdata}, function(data, textStatus, xhr) {
			/*return member[] */
			updateMember(data);
		});
}

//页面渲染updateMember
function updateMember(data){
	$('tr[name="activeTr"]').remove();
	//计算json变量长度length
	var arr = [];
	for(var i in data){
		arr.push(i);
	}
	for(var i = 0; i < arr.length; i++){
		var str = ''+ i +'';
		//console.log(data[str].name);
		var tr = $('<tr></tr>').html("\
			<td style='font-size: large' class='bg-success'>" + data[str].name + " </td>\
			<td style='font-size: large' class='bg-info'>" + data[str].sex + " </td>\
			<td style='font-size: large' class='bg-warning'>" + data[str].tel + " </td>\
			<td style='font-size: large' class='bg-danger'>" + data[str].academyName + " </td>\
			<td style='font-size: large' class='bg-success'>" + data[str].joinTime + " </td>\
			<td style='font-size: large'><button class='btn btn-warning btn-block' data-toggle='modal' data-target='#myModal1' name='changeMemberInfo' value='" + data[i].name + "'>更改</button></td>\
			<td style='font-size: large'><button class='btn btn-danger btn-block' name='deleteMemberInfo' value='" + data[i].name + "'>删除</button></td>\
		");
		tr.attr({
			name: 'activeTr'
		});
		$('table').append(tr);
	}
}

//增加或更新成员信息（提交表格）
function submitFormForAddOrUpdate(data, operation){
	//判断是否有空值
	var isNullCalculator = 0;
	for(var i in data){
		if(data[i] == "" || data[i] == undefined){
			isNullCalculator++;
		}
	}
	if(isNullCalculator != 0){
		//存在值未填写
		$('small').text('信息未填写完整，请补充完整再提交');
	}else{
		//提交数据
		var strdata = JSON.stringify(data);
		//增加
		if(operation == 1){
			$.post('addMember', {myjson: strdata}, function(data, textStatus, xhr) {
				/*optional stuff to do after success */
				window.location.href = 'crud.jsp';
			});
		}
		if(operation == 2){
			$.post('updateMember', {myjson: strdata}, function(data, textStatus, xhr) {
				/*optional stuff to do after success */
				window.location.href = 'crud.jsp';
			});
		}
	}
}