<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%!
   int temp1,min=0,max=10;
   String op="C->F";
   double temp2;
   double convertCF(int c)
   {  return (double)c*9/5+32;
   }
   double convertFC(int f)
   {  return (double)(f-32)*5/9;
   }   
%>

<%
   String temp;
   temp=request.getParameter("min");
   if(temp!=null && !temp.isEmpty())
      min=Integer.parseInt(temp);
   temp=request.getParameter("max");
   if(temp!=null && !temp.isEmpty())
      max=Integer.parseInt(temp);
   temp = request.getParameter("op");
   if(temp!=null && !temp.isEmpty())
      op=temp;
%>


<div class="container mt-3">
  <h2>Tabela de Conversão de temperaturas</h2>
  <p>Celsius para Fahrenheit</p>  
  <form style='height: 100px;' action="">
      <div class="row">
          <div class="col">
              <input type="text" class="form-control" placeholder="Informe o valor mínimo" name="min" value="<%=min%>">
          </div>
          <div class="col">
              <input type="text" class="form-control" placeholder="Informe o valor máximo" name="max"value="<%=max%>">
          </div>
          <div class="col">
              <select class="form-select" name='op'>
                  <option>C->F</option>
                  <option>F->C</option>
              </select>
          </div>
          <div class="col"><button type="submit" class="btn btn-primary">Gerar tabela</button></div>
      </div>
  </form>
  
  
  
  <table class="table table-dark table-hover">
    <thead>
      <tr>
        <th>°<%= op.split("->")[0] %></th>
        <th>°<%= op.split("->")[1] %></th>
      </tr>
    </thead>
    <tbody>
     
     <%for (int i=min; i<= max; i++)
         if (op.equals("C->F"))
            out.print("<tr><td>"+i+"</td><td>"+convertCF(i)+"</td></tr>");
         else
            out.print("<tr><td>"+i+"</td><td>"+convertFC(i)+"</td></tr>");

     %>
   
<%--   
    <%for (int i=min; i<= max; i++){%>
       <tr><td><%=i%></td><td><%=convertCF(i)%></td></tr>
    <%}%>
 --%>
    </tbody>
  </table>
</div>

</body>
</html>
