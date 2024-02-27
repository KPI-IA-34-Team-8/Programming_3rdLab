<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html><%! // Since we need to use scripting element declarations at least once, I decided to use it instead of cookies
    ArrayList<Double> aMemory = new ArrayList<Double>();
    ArrayList<Double> bMemory = new ArrayList<Double>();
    ArrayList<Double> cMemory = new ArrayList<Double>();
    ArrayList<Double> dMemory = new ArrayList<Double>();
    ArrayList<Double> rMemory = new ArrayList<Double>(); %>
    <head>
        <title>JSP - Lab 3</title>
        <style>
            table, thead, tbody, tr, th, td {
                border: solid 1px black;
                border-collapse: collapse;
            }
        </style>
    </head>
    <body>
        <h1>
            Third lab
        </h1><%
        double aInput, bInput, cInput, dInput;
        // Get all the
        String[] aInputStr = request.getParameterValues("aInput");
        String[] bInputStr = request.getParameterValues("bInput");
        String[] cInputStr = request.getParameterValues("cInput");
        String[] dInputStr = request.getParameterValues("dInput");
        // Kinda scuffed, but honestly I dunno how to do this otherwise..
        // if (...) return; // Does not work because it'll stop the whole main method and won't do the rest of jsp.
        // On a side note: do not ask me why I implemented this check. This wasn't even required.
        if (!(
                (aInputStr == null || aInputStr.length == 0) ||
                (cInputStr == null || cInputStr.length == 0) ||
                (bInputStr == null || bInputStr.length == 0) ||
                (dInputStr == null || dInputStr.length == 0)
        )) {
            // We do this because query parameters are also parsed into doPost, and we only want body parameters
            // Since the first parameters are queries in the link (and there can be duplicates of them :thumbs_up:)
            // We get the last parameter
            try {
                aInput = Double.parseDouble(aInputStr.length > 1 ? aInputStr[aInputStr.length - 1] : aInputStr[0]);
                bInput = Double.parseDouble(bInputStr.length > 1 ? bInputStr[bInputStr.length - 1] : bInputStr[0]);
                cInput = Double.parseDouble(cInputStr.length > 1 ? cInputStr[cInputStr.length - 1] : cInputStr[0]);
                dInput = Double.parseDouble(dInputStr.length > 1 ? dInputStr[dInputStr.length - 1] : dInputStr[0]);
                aMemory.add(aInput);
                bMemory.add(bInput);
                cMemory.add(cInput);
                dMemory.add(dInput);
                // Результат функції th(|b| * c) - tanh(|b| * c) - гіперболічний тангенс
                double thResult = Math.tanh(Math.abs(bInput) * cInput);

                // Результат функції log c (d) - логарфіму
                /*
                 У Java функція log бере за основу 10.
                 Але так як
                 log a (b) = log c (b) / log c (a)
                 То
                */
                double logResult = Math.log(dInput) / Math.log(cInput);

                // Результат кореню th / log
                double sqrtResult = Math.sqrt(thResult / logResult);

                // Рузльтат ділення 2 * с на а
                double divisionResult = (2 * cInput) / aInput;

                // Аюсолютне значення суми результату кореня та результату ділення
                double absoluteValue = Math.abs(divisionResult + sqrtResult);

                // Результат функції ln - логарифма з основою e
                double lnResult = Math.log(absoluteValue) / Math.log(Math.E);

                rMemory.add(lnResult);
            } catch (NumberFormatException e) {
                out.print("There was an error! " + e);
            }
        }
        %><br/><form action="index.jsp" method="post">
            <label for="aInput">Enter A:</label><br/>
            <input type="text" id="aInput" name="aInput" <%= (aMemory.isEmpty() ? "" : "value=\"" + aMemory.get(aMemory.size() - 1)) + "\""%> />
            <br/>
            <label for="bInput">Enter B:</label>
            <br/>
            <input type="text" id="bInput" name="bInput" <%= (bMemory.isEmpty() ? "" : "value=\"" + bMemory.get(bMemory.size() - 1)) + "\""%> />
            <br/>
            <label for="cInput">Enter C:</label>
            <br/>
            <input type="text" id="cInput" name="cInput" <%= (cMemory.isEmpty() ? "" : "value=\"" + cMemory.get(cMemory.size() - 1)) + "\""%> />
            <br/>
            <label for="dInput">Enter D:</label>
            <br/>
            <input type="text" id="dInput" name="dInput" <%= (dMemory.isEmpty() ? "" : "value=\"" + dMemory.get(dMemory.size() - 1)) + "\""%> />
            <br/><br/>
            <input type="submit" value="Submit data" />
        </form>
        <br/>
        <table>
            <thead>
                <tr>
                    <th>a</th>
                    <th>b</th>
                    <th>c</th>
                    <th>d</th>
                    <th>Result</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < aMemory.size(); i++) { %><tr>
                    <td><%=aMemory.get(i)%></td>
<%--                Doing this check to make sure we don't get an error "Out of bounds". --%>
                    <td><%=i < bMemory.size() ? bMemory.get(i) : "?"%></td>
                    <td><%=i < cMemory.size() ? cMemory.get(i) : "?"%></td>
                    <td><%=i < dMemory.size() ? dMemory.get(i) : "?"%></td>
                    <td><%=i < rMemory.size() ? rMemory.get(i) : "?"%></td>
                </tr><%}%>
            </tbody>
        </table>
    </body>
</html>
