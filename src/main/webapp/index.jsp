<%@ page import="org.apache.commons.httpclient.HttpClient" %>
<%@ page import="org.apache.commons.httpclient.methods.GetMethod" %>
<%@ page import="org.apache.commons.httpclient.Header" %>
<%@ page language="java" trimDirectiveWhitespaces="true" %>
<%
    String url = request.getParameter("url");
    if (url != null) {
        HttpClient client = new HttpClient();
        GetMethod get = new GetMethod(url);
        int status = client.executeMethod(get);
        Header contentType = get.getResponseHeader("Content-Type");
        if (contentType != null) {
            response.setContentType(contentType.getValue());
        }
        response.getOutputStream().write(get.getResponseBody());
        if (status / 100 != 2) {
            response.sendError(status, get.getStatusText());
        }
        return;
    }

    response.setContentType("text/html");
%>
<form>
    <input name="url"/>
</form>