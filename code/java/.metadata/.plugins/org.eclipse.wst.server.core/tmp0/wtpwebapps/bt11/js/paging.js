var data = [];
var employees = [];
var length = asyncFunc().then(function (result) {
    return result;

})

async function asyncFunc() {
    // fetch data from a url endpoint
    var data1 = await axios.get("http://localhost:8080/bt11/rest/employees/get-all");
    data = data1.data.employeeList;
    console.log(data);

    return data1.data.employeeList.length
}
let perPage = 4;// số item trên 1 page , let là cách khai báo 1 biến trong javascript
let currentPage = 1; // số trang hiển thị trên hàng vd : 1,2,3
let start = 0;
let end = perPage;
let listPageStart = 1;
let listPageEnd = 5;
// let middle = 2; // mặc định trang ở giữa sẽ là 2

const btnNext = document.querySelector('.btn-next'); // chọn btnNext để lấy giá trị khi click
const btnNext1 = document.querySelector('.btn-next1');
const btnPrev = document.querySelector('.btn-prev');
const btnPrev1 = document.querySelector('.btn-prev1');
let totalPages;

console.log(length);

asyncFunc().then(function (result) {
    totalPages = Math.ceil(result / perPage);
    console.log("trong: " + totalPages);


})

function getCurrentPage(currentPage) {
    start = (currentPage - 1) * perPage;
    end = currentPage * perPage;
    console.log(start, end);

}

function renderProduct() {
    html = '';
    const content = data.map((item, index) => {
        if (index >= start && index < end) {
            html += '<div class="content_product__item">';
            html += '<table>';
            html += '<thead>';
            html += '<th>ID</th>';
            html += '<th>HoTen</th>';
            html += '<th>Tuoi</th>';
            html += '<th>GioiTinh</th>';
            html += '<th>CapBac</th>';
            html += '</thead>';
            html += '<tbody>';
            html += '<tr>';
            html += '<th scope="row">' + item.ID + '</th>';
            html += '<td>' + item.hoTen + '</td>';
            html += '<td>' + item.tuoi + '</td>';
            html += '<td>' + item.gioiTinh + '</td>';
            html += '<td>' + item.capBac + '</td>';
            html += '</tr>';
            html += '</tbody>';
            html += '</table>';
            html += '</div>';
            return html;
        }
    });
    document.getElementById('product').innerHTML = html;
}
renderProduct();
renderListPage(listPageStart, listPageEnd);
changePage();
function renderListPage(listPageStart, listPageEnd) {
    let html = '';
    for (let i = listPageStart; i <= listPageEnd; i++) {
        if (i === currentPage) {
            html += `<li class="active"><a>${i}</a></li>`;
        }
        else {
            html += `<li><a>${i}</a></li>`;
        }
    }
    document.getElementById('number-page').innerHTML = html;
}

//function thay đổi trang 
function changePage() {
    let currentPage1 = document.querySelectorAll('.number-page li');
    console.log(currentPage1);// ở đây in ra 5 ô mục li
    for (let i = 0; i < currentPage1.length; i++) {
        currentPage1[i].addEventListener('click', () => {

            let value;
            // if (listPageStart <= 3) {
            //     value = i + 1;
            //     listPageStart=1;
            //     listPageEnd=5;
            //     // renderListPage(listPageStart, listPageEnd);
            // }
            // if (currentPage === 4) {
            //     value = i + 2;
            //     listPageStart=2;
            //     listPageEnd=6;
            //     // renderListPage(listPageStart, listPageEnd);
            // }
            // if (currentPage === 5) {
            //     value = i + 3;
            //     listPageStart=3;
            //     listPageEnd=7;
            //     // renderListPage(listPageStart, listPageEnd);
            // }
            // if (currentPage > 5) {
            //     value = i + 4;
            //     listPageStart=4;
            //     listPageEnd=totalPages;
            //     // renderListPage(listPageStart, listPageEnd);
            // }
            if(listPageStart===1){
                value = i + 1;
            }
            if(listPageStart===2){
                value = i + 2;
            }
            if(listPageStart===3){
                value = i + 3;
            }
            if(listPageStart===4){
                value = i + 4;
            }
            console.log(value); // in ra trang hiện tại
            currentPage = value;
            listPageStart=currentPage-2;
            if(listPageStart<1){
                listPageStart=1;
            }
            if(listPageStart>4){
                listPageStart=4;
            }
            listPageEnd=currentPage+2;
            if(listPageEnd<5){
                listPageEnd=5;
            }
            if(listPageEnd>totalPages){
            	
                listPageEnd=totalPages;
                
            }
            if(totalPages===5){
            	listPageStart=1;
            	listPageEnd=totalPages;
            }
            if(totalPages===3){
            	listPageStart=1;
            	listPageEnd=totalPages;
            }

            $('.number-page li').removeClass('active');// nếu nhấn vào bất kì 1 trang nào thuộc listpage này thì sẽ bỏ hove trang 1 đi
            currentPage1[i].classList.add('active');// lấy trang đucợ click vào sẽ hove lên
            if (currentPage > 1 && currentPage < totalPages) {// nếu trang hiện tại lớn hơn 1 và nhỏ hơn totalPage thì ta sẽ làm mờ đi prev và next
                $('.btn-prev').removeClass("btn-active");
                $('.btn-next').removeClass("btn-active");
                $('.btn-next1').removeClass("btn-active");
                $('.btn-prev1').removeClass("btn-active");
            }
            if (currentPage === 1) {
                $('.btn-prev').addClass('btn-active');// nếu là trang 1 thì sẽ mờ đi nút prev
                $('.btn-prev1').addClass('btn-active');
                $('.btn-next').removeClass('btn-active');
                $('.btn-next1').removeClass('btn-active');
            }

            if (currentPage === totalPages) {
                $('.btn-next').addClass('btn-active');
                $('.btn-next1').addClass('btn-active');
                $('.btn-prev').removeClass('btn-active');
                $('.btn-prev1').removeClass('btn-active');
            }
            renderListPage(listPageStart,listPageEnd);
            changePage();
            getCurrentPage(currentPage); // in ra start và end
            renderProduct();// lấy thông tin đưa ra html lấy từ các file mảng của mình
        })
    }

}
// renderListPage(listPageStart,listPageEnd);


btnNext.addEventListener('click', () => {
    currentPage++; // mỗi khi click vào biểu tượng btnNext này thì trang hiện tại sẽ +1
    console.log(currentPage);

    if (currentPage > totalPages) {
        currentPage = totalPages;
    }
    if (currentPage === totalPages) {
        $('.btn-next').addClass('btn-active');
        $('.btn-next1').addClass('btn-active');
    }
    if (currentPage <= 3) {
        listPageStart = 1;
        if(totalPages===3){
        	listPageEnd=3;
        }
        else{
        	listPageEnd = 5;
        }
        
        renderListPage(listPageStart, listPageEnd);
        changePage();

    }
    if (currentPage === 4) {
        listPageStart = 2;
        if(totalPages===5){
        	listPageStart=1;
        	listPageEnd=5;
        }
        else{
        	listPageEnd = 6;
        }
//        listPageEnd = 6;
        renderListPage(listPageStart, listPageEnd);
        changePage();
    }
    if (currentPage === 5) {
        listPageStart = 3;
        if(totalPages===5){
        	listPageStart=1;
        	listPageEnd=5;
        }
        else{
        	listPageEnd=7;
        }
        
        renderListPage(listPageStart, listPageEnd);
        changePage();
    }
    if (currentPage > 5) {
        listPageStart = 4;
        if(totalPages===5){
        	listPageStart=1;
        }
        listPageEnd = totalPages;
        renderListPage(listPageStart, listPageEnd);
        changePage();
    }
    $('.btn-prev').removeClass("btn-active");
    $('.btn-prev1').removeClass("btn-active");
    $('.number-page li').removeClass('active');
    if (currentPage <= 3) {
        $(`.number-page li:eq(${currentPage - 1})`).addClass('active');
    }
    if (currentPage === 4) {
    	if(totalPages===5){
    		$(`.number-page li:eq(${currentPage - 1})`).addClass('active');
    	}
    	else{
    		$(`.number-page li:eq(${currentPage - 2})`).addClass('active');
    	}
//        $(`.number-page li:eq(${currentPage - 2})`).addClass('active');
    }
    if (currentPage === 5) {
    	if(totalPages===5){
    		$(`.number-page li:eq(${currentPage - 1})`).addClass('active');
    	}
    	else{
    		$(`.number-page li:eq(${currentPage - 3})`).addClass('active');
    	}
//        $(`.number-page li:eq(${currentPage - 3})`).addClass('active');
    }
    if (currentPage > 5) {
        $(`.number-page li:eq(${currentPage - 4})`).addClass('active');
    }
    getCurrentPage(currentPage);
    renderProduct();
})

btnPrev.addEventListener('click', () => {
    currentPage--;
    console.log("btnPrev: " + currentPage);
    // console.log(start, end);

    if (currentPage <= 1) {
        currentPage = 1;
    }
    if (currentPage === 1) {
        $('.btn-prev').addClass('btn-active');// tới dầu trang thì dấu prev này sẽ bị mờ đi
        $('.btn-prev1').addClass('btn-active');
    }

    if (currentPage <= 3) {
        listPageStart = 1;
        if(totalPages===3){
        	listPageEnd=3;
        }
        else{
        	listPageEnd = 5;
        }
        
        renderListPage(listPageStart, listPageEnd);
        changePage();

    }
    if (currentPage === 4) {
        listPageStart = 2;
        if(totalPages===5){
        	listPageStart=1;
        	listPageEnd=5;
        }
        else{
        	listPageEnd = 6;
        }
//        listPageEnd = 6;
        renderListPage(listPageStart, listPageEnd);
        changePage();
    }
    if (currentPage === 5) {
        listPageStart = 3;
        if(totalPages===5){
        	listPageStart=1;
        	listPageEnd=5;
        }
        else{
        	listPageEnd=7;
        }
        
        renderListPage(listPageStart, listPageEnd);
        changePage();
    }
    
    if (currentPage > 5) {
        listPageStart = 4;
        if(totalPages===5){
        	listPageStart=1;
        }
        listPageEnd = totalPages;
        renderListPage(listPageStart, listPageEnd);
        changePage();
    }

    $('.btn-next').removeClass("btn-active");// nếu chưa là đầu trang thì sẽ xóa active mờ đi
    $('.btn-next1').removeClass("btn-active");
    $('.number-page li').removeClass('active');// xóa các hove trước đi, chỉ hove thằng hiện tại, tức là xóa mặc định hove thằng trang 1
    if (currentPage <= 3) {
        $(`.number-page li:eq(${currentPage - 1})`).addClass('active');
    }
    if (currentPage === 4) {
    	if(totalPages===5){
    		$(`.number-page li:eq(${currentPage - 1})`).addClass('active');
    	}
    	else{
    		$(`.number-page li:eq(${currentPage - 2})`).addClass('active');
    	}
//        $(`.number-page li:eq(${currentPage - 2})`).addClass('active');
    }
    if (currentPage === 5) {
    	if(totalPages===5){
    		$(`.number-page li:eq(${currentPage - 1})`).addClass('active');
    	}
    	else{
    		$(`.number-page li:eq(${currentPage - 3})`).addClass('active');
    	}
//        $(`.number-page li:eq(${currentPage - 3})`).addClass('active');
    }
    if (currentPage > 5) {
        $(`.number-page li:eq(${currentPage - 4})`).addClass('active');
    }

    getCurrentPage(currentPage);
    renderProduct();// sau khi cập nhật nhật start và end thì gọi lại thằng renderProduct(); để lưu lại, để biết được sẽ hiển thì từ item nào đến item nào
})

btnNext1.addEventListener('click', () => {
    currentPage = totalPages;
    $('.btn-next').addClass('btn-active');// làm mờ biểu tượng next
    $('.btn-next1').addClass('btn-active');// làm mờ biểu tượng next1
    $('.number-page li').removeClass('active');
    $('.btn-prev').removeClass("btn-active");
    $('.btn-prev1').removeClass("btn-active");
    console.log(currentPage);
    listPageStart = 4;
    if(totalPages===5){
    	listPageStart=1;
    	listPageEnd=totalPages;
    }
    if(totalPages===3){
    	listPageStart=1;
    	listPageEnd=totalPages;
    }
    listPageEnd = totalPages;
    renderListPage(listPageStart, listPageEnd);
    changePage();
    getCurrentPage(currentPage);
    renderProduct();
})

btnPrev1.addEventListener('click', () => {
    currentPage = 1;
    $('.btn-prev').addClass('btn-active');// làm mờ biểu tượng next
    $('.btn-prev1').addClass('btn-active');// làm mờ biểu tượng next
    $('.number-page li').removeClass('active');
    $('.btn-next').removeClass("btn-active");
    $('.btn-next1').removeClass("btn-active");
    console.log(currentPage);

    listPageStart = 1;
    if(totalPages===3){
    	listPageEnd=3;
    }
    else{
    	listPageEnd = 5;
    }
    
    
    renderListPage(listPageStart, listPageEnd);
    changePage();
    getCurrentPage(currentPage);
    renderProduct();
})





