<%-- 
    Document   : toevoegen
    Created on : 09-mei-2013, 15:00
    Author     : robin
--%>

<!--
 This file is part of javaProject2TI.

    javaProject2TI is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    javaProject2TI is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with javaProject2TI.  If not, see <http://www.gnu.org/licenses/>.
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>




<!--start holder-->

<div class="holder_content">

    <section class="group1">
        <h3>Examen toevoegen</h3>


    </section>
</div>
<!--end holder-->

<!--start holder-->
<tr>

<section class="group1">
    <form action="LokaalServlet" id="myform">
        <table>
            <tr>
                <th>Nummer: </th>
                <td> <input type="text" name="nummer" id="nummer" value="${lokaal.nummer}" /></td>

            </tr>
            <tr>
                <th>Aantal plaatsen: </th>
                <td><input type="text" name="aantalPlaatsen" id="aantalPlaatsen" value="${lokaal.aantalPlaatsen}" /></td>
            </tr>

            <tr>
                <th>Type: </th>

                <td>

                    <c:forEach var="lokaalType" items="${lokaalTypes}" >
                        <c:choose>
                            <c:when test="${lokaalType eq lokaal.class.simpleName}">
                                <input type="radio" name="soortLokaal"  class="soortLokaal" value="${lokaalType}" checked="checked">
                                ${lokaalType}
                            </c:when>
                            <c:otherwise>
                                <input type="radio" name="soortLokaal"  class="soortLokaal" value="${lokaalType}" />
                                ${lokaalType}
                            </c:otherwise>

                        </c:choose>
                    </c:forEach>
                </td>
            </tr>
            <tr class="printenGewoonLokaal">

                <th>Whiteboard aanwezig</th>
                <td>
                    <select name="whiteboard" id="whiteboard">
                        <c:choose>
                            <c:when test ="${lokaal.class.simpleName eq 'GewoonLokaal'}">
                                <c:choose>
                                    <c:when test="${lokaal.isWhiteBoard()}">
                                        <option value="false">Nee</option>
                                        <option value="true" selected="selected">Ja</option>

                                    </c:when>

                                    <c:otherwise>
                                        <option value="false" selected="selected">Nee</option>
                                        <option value="true">Ja</option>
                                    </c:otherwise>
                                </c:choose>

                            </c:when>
                            <c:otherwise>
                                <option value="false">Nee</option>
                                <option value="true" >Ja</option>

                            </c:otherwise>
                        </c:choose>
                    </select>
                </td>


            </tr>
            <tr class="printenComputerLokaal">

                <th>Laptop aanwezig</th>
                <td>
                    <select name="laptop" id="laptop">
                        <c:choose>
                            <c:when test ="${lokaal.class.simpleName eq 'ComputerLokaal'}">
                                <c:choose>
                                    <c:when test="${lokaal.isLaptop()}">
                                        <option value="false">Niet aanwezig</option>
                                        <option value="true" selected="selected">Aanwezig</option>

                                    </c:when>
                                    <c:otherwise>
                                        <option value="false" selected="selected">Niet aanwezig</option>
                                        <option value="true">Aanwezig</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <option value="false">Niet aanwezig</option>
                                <option value="true">Aanwezig</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
            </tr>
            <tr class="printenComputerLokaal">
                <th>Info</th>
                <td>
                    <c:choose>
                        <c:when test ="${lokaal.class.simpleName eq 'ComputerLokaal'}">
                            <input type="text" name="info" value="${lokaal.info}" id="info"/>
                        </c:when>
                        <c:otherwise>
                            <input type="text" name="info" id="info"/>

                        </c:otherwise>
                    </c:choose>
                </td>

            </tr>




        </table>

</section>
</tr>
<tr>
    <td></td>
    <td><input type="submit" value="Lokaal toevoegen" name="toevoegenLokaalBevestigen" id="toevoegenLokaalBevestigen"/></td>
</tr>
</table>
<input type="hidden" value="${lokaal.id}" name="lokaalId" id="lokaalId"/>
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
</body>
<script language="javascript">
       
    $(document).ready(
    function(){
        $("#pikame").PikaChoose();
        $("#datum").datepicker({dateFormat:"dd/mm/yy"});
        $(".printenGewoonLokaal").hide();
        $(".printenComputerLokaal").hide();
        $("#toevoegenLokaalBevestigen").hide();
        if( $("input[name='soortLokaal']:radio").is(":checked")){
                
                
            if($('.soortLokaal:checked').val()=='GewoonLokaal'){
                $(".printenComputerLokaal").hide();

                $(".printenGewoonLokaal").show();
                $("#toevoegenLokaalBevestigen").show();


            }
            else{
                $(".printenComputerLokaal").show();

                $(".printenGewoonLokaal").hide();
                $("#toevoegenLokaalBevestigen").show();

            }
            if($("#lokaalId")){
                $(':radio:not(:checked)').attr('disabled', true);
                    
            }
        }
        $("input[name='soortLokaal']:radio").click(
        function()
        {
            if($('.soortLokaal:checked').val()=='GewoonLokaal'){
                $(".printenComputerLokaal").hide();

                $(".printenGewoonLokaal").show();
                $("#toevoegenLokaalBevestigen").show();


            }
            else{
                $(".printenComputerLokaal").show();

                $(".printenGewoonLokaal").hide();
                $("#toevoegenLokaalBevestigen").show();

            }
                    
        });
                
    }
            
);
    function validatieOK(){
        ok = true;
        if($("#nummer").val()==""){
            $("#nummer").addClass("ui-state-error");
            ok = false;
        }
        else{
            $("#nummer").removeClass("ui-state-error");
        }
        if(!$.isNumeric($("#aantalPlaatsen").val())||$("#aantalPlaatsen").val()<=0){
            $("#aantalPlaatsen").addClass("ui-state-error");
            ok = false;
        }
        else{
            $("#aantalPlaatsen").removeClass("ui-state-error");
        }
        return ok;
    }
    $("#myform").submit(function (e){
        
        if(validatieOK()){
            return true;
        }
        else{
            e.preventDefault();
 
        }
    });
             
          
        
            
</script>
</html>
