
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="Css/contact.css">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

</head>

<body>
  <div class="wrapper">
    <form class="form" action="/contact" method="post">
      <div class="pageTitle title">Sign Up </div>
      <div class="secondaryTitle title">Please fill this form to sign up.</div>
      <input type="text" class="name formEntry" name="Name" placeholder="Name" />
      <input type="text" class="email formEntry" name="Email" placeholder="Email"/>
      <textarea class="message formEntry" name="Message" placeholder="Message"></textarea>
      <button type="submit" class="submit formEntry" onclick="thanks()">Submit</button>
      <div class="sms-message">${sms}</div>
    
    </form>
  </div>
  <script src="app.js"></script>
</body>

</html>