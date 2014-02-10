<%@ page import="com.github.axet.vget.VGet" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.io.FileUtils" %>
<%@ page language="java" trimDirectiveWhitespaces="true" %>
<%
    String url = request.getParameter("url");
    if (url != null) {
        File file = File.createTempFile("vget", "vget");
        try {
            VGet vGet = new VGet(new URL(url), file);
            vGet.download();
            response.setContentType(vGet.getVideo().getInfo().getContentType());
            FileUtils.copyFile(file, response.getOutputStream());
            response.flushBuffer();
        } finally {
            file.delete();
        }
        return;
    }

    response.setContentType("text/html");
%>
<form>
    <input name="url"/>
</form>