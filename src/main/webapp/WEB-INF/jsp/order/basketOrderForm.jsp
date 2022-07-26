<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>basketOrderForm</title>

<script>
function orderCheck() {
	var form = document.getElementById("basketOrderForm");
	var O_RECIEVER = document.getElementById("o_reciever");
	var O_ADDRESS1 = document.getElementById("o_address1");
	var O_ADDRESS2 = document.getElementById("o_address2");
	var O_POSTCODE = document.getElementById("o_postcode");
	
	if(confirm("�ֹ��Ͻðڽ��ϱ�?") == true) {
		if(O_RECIEVER.value.trim() == ""){
			alert("�̸��� �Է����ּ���.");
			O_RECIEVER.focus();
			return false;
		} else if(O_POSTCODE.value.trim() == ""){
			alert("�����ȣ�� �Է����ּ���.");
			O_POSTCODE.focus();
			return false;
		} else if(O_ADDRESS1.value.trim() == ""){
			alert("�ּҸ� �Է����ּ���.");
			O_ADDRESS1.focus();
			return false;
		} else {
			form.submit();
		}
	}
}


</script>

<!-- ���� ��ȣ API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var addr = ''; // �ּ� ����
                var extraAddr = ''; // �����׸� ����

                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    addr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    addr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
                    document.getElementById("o_address1").value = extraAddr;
                
                } else {
                    document.getElementById("o_address2").value = '';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('o_postcode').value = data.zonecode;
                document.getElementById("o_address1").value = addr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById("o_address2").focus();
            }
        }).open();
    }
</script>

</head>
<div style="text-align:center">
		<h1> �ֹ� ������ </h1>
	</div>
	
	<form method="post" id="basketOrderForm" action="basketOrder.do">
	
	<table border=1>
			<!-- �� ǰ �� �� -->
			<thead>
				<tr>
				
					<th>�� ǰ ��</th>
					<th>�� ǰ �� ��</th>
					<th>�� �� �� ��</th>
					<th>�� �� ��</th>
				</tr>
			</thead>	
			<tbody>
			<c:set var="sum" value="0" />
				<c:forEach var="bList" items="${basketList}">
				<tr>
				
					<td>${bList.B_NAME }</td> 
					<input type="hidden" id="o_name" name="o_name" value="${bList.B_NAME}">
					
					<td>${bList.B_PRICE }��</td>
					
					<td>${bList.B_COUNT}��</td>
					<input type="hidden" id="o_count" name="o_count" value="${bList.B_COUNT }">
					
					<td>${bList.B_COUNT * bList.B_PRICE }</td>
					<input type="hidden" id="o_price" name="o_price" value="${bList.B_PRICE}">
					<c:set var="sum" value="${sum + (bList.B_PRICE * bList.B_COUNT)}" />
				
					
					<input type="hidden" id="o_id" name="o_id" value="${bList.B_ID}"/>
					<input type="hidden" id="o_code" name="o_code" value="${bList.B_CODE}">	
					
				</tr>
				</c:forEach>
			</tbody>
		
		</table>
	
				
			

		
		
		
		
		<!-- �ֹ��� ���� -->
		<h2>�ֹ��� ����</h2>
		
		<!-- �̸� -->
		<h6>�� ��</h6>
			<input type="text" value="${myInfo.NAME}" readonly>	
		
		<!-- �ڵ��� ��ȣ -->
		<h6>�� �� �� �� ȣ</h6>
			<input type="text" value="${myInfo.PHONE}" readonly>
		
		<hr>
					<br><br>				
		<hr>

				<!-- �޴� ��� ���� -->
				<h6>�����ô� ��</h6>
				<input type="text" id="o_reciever" name="o_reciever" value="${myInfo.NAME}">
				
				<!-- �ּ� -->
				<h6>�����ȣ</h6>
				<input type="text" name="o_postcode" id="o_postcode"
					value="${myInfo.POSTCODE}">
								
				<input type="button" onclick="sample6_execDaumPostcode()" value="�����ȣ ã��">
								
				<h6>�ּ�</h6>		
				<input type="text" name="o_address1" id="o_address1"
					value="${myInfo.ADDRESS1}">
				&emsp;
				<input type="text" name="o_address2" id="o_address2"
					value="${myInfo.ADDRESS2}">
								
								
								
				<h2> �� �� �� �� </h2>	
				
				<span>�� �� �� ��</span>
				<fmt:formatNumber pattern="###,###,###" value="${sum}" />��
				
	    		<span>�� �� ��</span>
	    		<span>3000��</span>
	    		&emsp;
	    						 
	    		<span>�� �� ��</span>
	    		<fmt:formatNumber pattern="###,###,###" value="${sum+3000}" />��
	    		<input type="hidden" id="o_total" name="o_total" value="${sum+3000}">
				
						
				<h2> �� �� �� �� </h2>
				<h6>�� �� �� �� ��</h6>
				<input type="text" value="�츮���� 1234-56-7890" readonly>
				
				<!-- ��ư -->
				<button type="button" onclick="orderCheck()">�ֹ��ϱ�</button>
		

			

		
	</form>	
</body>
</html>