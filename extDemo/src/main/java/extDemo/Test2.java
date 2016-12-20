package extDemo;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 根据城市获取地区
 */
public class Test2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test2() {
        super();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.Write("{data:[{id:1,name:'北京'},{id:2,name:'上海'}]}");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		String str = "";
		if(request.getParameter("id").equals("1")){
			str = "{data:[{id:1,name:'东城区'},{id:2,name:'西城区'},{id:2,name:'海淀区'}]}";
		}else{
			str = "{data:[{id:1,name:'杨浦区'},{id:2,name:'虹口区'},{id:2,name:'闸北区'}]}";
		}
		Writer out = null;
		try {
		    out = response.getWriter();
		    out.write(str);
		} catch (IOException e) {
		    e.printStackTrace();
		} finally {
		    if (out != null) {
		        out.close();
		    }
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
