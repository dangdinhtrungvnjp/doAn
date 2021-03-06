package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Khoa;
import model.bean.SinhVien;
import model.bo.KhoaBO;
import model.bo.SinhVienBO;

/**
 * Servlet implementation class DanhSachSinhVienServlet
 */
public class DanhSachSinhVienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DanhSachSinhVienServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//kiem tra da dang nhap chua
		HttpSession session = request.getSession();
		if(session.getAttribute("tenDangNhap")==null){
			response.sendRedirect("DangNhapServlet");
			return;
		}
		
		//lay danh sach cac khoa
		KhoaBO khoaBO = new KhoaBO();
		ArrayList<Khoa> listKhoa = khoaBO.getListKhoa();
		request.setAttribute("listKhoa", listKhoa);
		
		//lay danh sach sinh vien
		ArrayList<SinhVien> listSinhVien;
		SinhVienBO sinhVienBO = new SinhVienBO();
		String maKhoa=request.getParameter("maKhoa");
		if(maKhoa==null || maKhoa.length()==0){
			listSinhVien = sinhVienBO.getListSinhVien();
		} else {
			listSinhVien = sinhVienBO.getListSinhVien(maKhoa);
		}
		request.setAttribute("listSinhVien", listSinhVien);
		
		RequestDispatcher rd = request.getRequestDispatcher("danhSachSinhVien.jsp");
		rd.forward(request, response);
	}

}
