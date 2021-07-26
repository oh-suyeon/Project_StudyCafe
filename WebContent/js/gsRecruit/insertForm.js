/**
 * 
 */
 $(function(){
  $("[name='gsOpenYn']").on('click', function() {
	
	    var valueCheck = $("[name='gsOpenYn']:checked").val(); // 체크된 Radio 버튼의 값을 가져dha

	    if ( valueCheck == 'N' ) {
	        $('#pw').prop('readonly', false); // 비밀번호 활성화
	        $('#pw').focus();
	    }else {
	        $('#pw').val(''); 
	        $('#pw').attr('readonly', true); // 비밀번호 비활성화
	    }
	    
	});
  });

