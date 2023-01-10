package com.kh.approval.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.approval.model.service.ApprovalService;
import com.kh.employee.model.vo.Employee;

/**
 * Servlet implementation class ApprovalExpenseFormController
 */
@WebServlet("/form.spt")
public class ApprovalExpenseFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApprovalExpenseFormController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("loginEmp");

		if (emp == null) {
			session.setAttribute("alertMsg1", "로그인 후 이용 가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
		} else {
		

			// 조직도 데이터 불러오기
			ArrayList<String> deptList = new ApprovalService().selectDeptList();
			ArrayList<Employee> eList = new ApprovalService().selectEmployeeList();
	
			request.setAttribute("deptList", deptList);
			request.setAttribute("eList", eList);
			
			// 지출결의서 작성폼 포워딩
			request.getRequestDispatcher("views/approval/expenseReportForm.jsp").forward(request, response);
		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
