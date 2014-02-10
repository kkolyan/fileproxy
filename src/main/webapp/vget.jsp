<%@ page import="com.github.axet.vget.VGet" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.UUID" %>
<%@ page language="java" trimDirectiveWhitespaces="true" %>
<%
    String url = request.getParameter("url");
    String htmlBase = "/var/www/html";
    if (url != null) {
        String name = request.getParameter("name");
        if (name == null || name.trim().isEmpty()) {
            name = UUID.randomUUID().toString().replace("-","");
        }
        File file = new File(htmlBase+"/video/", name);
        file.getParentFile().mkdirs();
        VGet vGet = new VGet(new URL(url), file);
        vGet.download();
//            response.setContentType(vGet.getVideo().getInfo().getContentType());
        response.sendRedirect("http://"+request.getServerName()+"/video/"+name);
        return;
    }

    response.setContentType("text/html");
%>
<form>
    <label>
        URL
        <input name="url"/>
    </label>
    <label>
        Name
        <input name="name"/>
    </label>
    <input type="submit" value="Download"/>
</form>