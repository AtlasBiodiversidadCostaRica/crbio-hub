<%--
    Document   : pageNotFound
    Created on : Apr 7, 2010, 12:26:36 PM
    Author     : "Nick dos Remedios <Nick.dosRemedios@csiro.au>"
--%>
<% response.setStatus( 500 ); %>
<%@ include file="/common/taglibs.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="decorator" content="${skin}"/>
        <title>Internal Error</title>
        <script type="text/javascript">
            $(document).ready(function() {
                $(".showHideLink").toggle(function() {
                        $("#stackTrace").slideDown();
                    }, function() {
                        $("#stackTrace").slideUp();
                    }
                 );
            });
        </script>
    </head>
    <body>
        <div id="column-one" class="full-width">
            <div class="section">
                <h1>Internal Error</h1>
                <p>An unexpected error has occurred. If this error persists, you might like to let us
                    know <a href="mailto:webmaster@ala.org.au?subject=${pageContext.request.serverName} Error">via email</a>.</p>
                <p></p>
                <p><a href="#" class="showHideLink">Show/Hide Stacktrace</a></p>
                <div id="stackTrace" style="display: none; font-family: monospace;">
                    <%
                        try {
                            // The Servlet spec guarantees this attribute will be available
                            Throwable theException = (Throwable) request.getAttribute("javax.servlet.error.exception");

                            if (theException != null) {
                                if (theException instanceof ServletException) {
                                    // It's a ServletException: we should extract the root cause
                                    ServletException sex = (ServletException) theException;
                                    Throwable rootCause = sex.getRootCause();
                                    if (rootCause == null) {
                                        rootCause = sex;
                                    }
                                    System.out.println("** GENERAL - Root cause is: " + rootCause.getMessage());
                                    rootCause.printStackTrace();
                                } else {
                                    // It's not a ServletException, so we'll just show it
                                    System.out.println("\n** GENERAL - Other exception: " + theException.getMessage());
                                    theException.printStackTrace();
                                }
                            } else {
                                System.out.println("No error information available");
                            }

                            // Display cookies
                            System.out.println("\nCookies:\n");
                            Cookie[] cookies = request.getCookies();
                            if (cookies != null) {
                                for (int i = 0; i < cookies.length; i++) {
                                    //System.out.println(cookies[i].getName() + "=[" + cookies[i].getValue() + "]");
                                }
                            }

                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    %>
                </div>
                <p/>
                <br/>
            </div>
        </div>
    </body>
</html>
