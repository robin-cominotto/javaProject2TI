<%-- 
    Document   : toevoegen
    Created on : 09-mei-2013, 15:00
    Author     : robin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
           <!--start holder-->

            <div class="holder_content">

                <section class="group1">
                    <h3>Docent toevoegen</h3>


                </section>
            </div>
            <!--end holder-->

            <!--start holder-->
            <div class="holder_content">

                <section class="group1">
                    <form action="DocentServlet">
                        <table>
                            <tr>
                                <th>Voornaam: </th>
                                <td><input type="text" name="voornaamDocent" id="voornaam" value="${docent.voornaam}"/>
                                    
                            </tr>
                            <tr>
                                <th>Familienaam: </th>
                                <td> <input type="text" name="familienaamDocent" id="familienaam" value="${docent.familienaam}"/>
                                    </td>
                            </tr>
                            <tr>
                                <th>Email: </th>
                                <td><input type="text" name="emailDocent" id="email" value="${docent.email}"/></td>
                            </tr>
                            <tr>
                                <th>Nummer: </th>
                                <td>
                                    <input type="text" name="nummerDocent" id="nummer" value="${docent.nummer}"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Docent toevoegen" name="docentToevoegenBevestigen"/></td>
                            </tr>
                        </table>
                                 <input type="hidden" value="${docent.id}" name="docentId"/>
                    </form>
                </section>
            </div>

            <!--end holder-->



        </div>
        <!--end container-->

        <!--start footer-->
         <%@ include file="footer.jsp" %>
        <!--end footer-->
        <!-- Free template distributed by http://freehtml5templates.com -->   
    </body> <script language="javascript">
            $(document).ready(
            function (){
                $("#pikame").PikaChoose();
                $("#datum").datepicker({dateFormat:"dd/mm/yy"});
            });
        </script>
</html>
