<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="SampleProject.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script language="javascript" type="text/javascript">
        function validate() {
            var Validatectrl = "";
            Validatectrl += validateName();
            Validatectrl += validateSecondName();
            Validatectrl += validateAddress();
            Validatectrl += validateGenders();
            Validatectrl += validateDropList();
            Validatectrl += validatePhone();
            Validatectrl += validateEmail();
            Validatectrl += validateUserName();
            Validatectrl += validatePassWord();
         
            if (Validatectrl != "") {
                
                alert(Validatectrl);

                return false;

            }
            else {
                return true;
            }
        }
        function validateName() {
            var id;
            var temp = document.getElementById("<%=txtFname.ClientID %>");
            id = temp.value;
            if (id == "") {
                document.getElementById("name1").innerHTML = "Please enter first name";
                return ("Please enter first name" + "\n");
            }
            else {
                return "";
            };
         
        };

        function validateSecondName() {
            var id;
            var temp = document.getElementById("<%=txtLname.ClientID %>");
            id = temp.value;
            if (id == "") {
                document.getElementById("lname").innerHTML = "Please enter last name";
                return ("Please enter last name" + "\n");
            }
            else {
                return "";
            };

        };
        function validateAddress() {
            var id;
            var temp = document.getElementById("<%=txtaddress.ClientID %>");
            id = temp.value;
            if (id == "") {
                document.getElementById("add").innerHTML = "Please enter Address";
                return ("Please enter Address" + "\n");
            }
            else {
                return "";
            };

        };

        function validateGenders() {
            var id;
            var temp = document.getElementById("<%=RadioButtonList1.ClientID %>");
            id = temp.value;
            if (id == "") {
                document.getElementById("gen").innerHTML = "Please select gender";
                return ("Please select gender" + "\n");
            }
            else {
                return "";
            };

        };
       
        function validateDropList() {
            var id;
            var temp = document.getElementById("<%=DropDownList1.ClientID %>");
            id = temp.value;
            if (id == 0) {
                return ("Please Select Course" + "\n");
            }
            else {
                return "";
            }

           

               
        };

        function validatePhone() {
            var id;
            var temp = document.getElementById("<%=txtPhone.ClientID %>");
            id = temp.value;
            var re;
            re = /^[0-9]+$/;
            var digits = /\d(10)/;
            if (id == "") {
                document.getElementById("phn").innerHTML = "Please enter phone no";
                return ("Please enter phone no" + "\n");
            }
            else if (id.length < 10) {
                document.getElementById("phn").innerHTML = "Please enter10 digits";
                return ("Please enter 10 digits" + "\n");
            }
            else if (re.test(id)) {
                return "";
            }
            

            else {
                document.getElementById("phn").innerHTML = "Phone no should be digits only";
               /* return ("Phone no should be digits only" + "\n");*/
            }
        };
        function validateEmail() {
            var id;
            var temp = document.getElementById("<%=txtEmail.ClientID %>");
             id = temp.value;
             var re = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
            if (id == "") {
                document.getElementById("emails").innerHTML = "Please Enter Email";
                 return ("Please Enter Email" + "\n");
             }
             else if (re.test(id)) {
                 return "";
             }

            else {
                document.getElementById("emails").innerHTML = "Email should be in the form ex:abc@xyz.com";
                /* return ("Email should be in the form ex:abc@xyz.com" + "\n");*/
             }
        };
        function validateUserName() {
            var id;
            var temp = document.getElementById("<%=txtUsername.ClientID %>");
            id = temp.value;
            if (id == "") {
                document.getElementById("uname").innerHTML = "Please enter Username";
                return ("Please enter Username" + "\n");
            }
            else {
                return "";
            };

        };
        function validatePassWord()
        {
            var password = document.getElementById('<%=txtPassword.ClientID %>').value;
            var score = 0;

            if (password.length == 0) {
                document.getElementById("pass").innerHTML = "Please Enter Password";
                return ("Please Enter Password" + "\n");
            }
            else if (password.length < 8) {
                document.getElementById("pass").innerHTML = "Password should be 8 chr";
               /* return ("Password should be 8 chr" + "\n");*/
            }
            else {
                //for small letters  
                for (var s = 0; s < password.length; ++s) {
                    if (password.charCodeAt(s) >= 'a'.charCodeAt(0) && password.charCodeAt(s) <= 'z'.charCodeAt(0)) {
                        score += 1;
                        break;
                    }
                }

                //for capital letters  
                for (var s = 0; s < password.length; ++s) {
                    if (password.charCodeAt(s) >= 'A'.charCodeAt(0) && password.charCodeAt(s) <= 'Z'.charCodeAt(0)) {
                        score += 1;
                        break;
                    }
                }
                //for numbers  
                for (var s = 0; s < password.length; ++s) {
                    if (password.charCodeAt(s) >= '0'.charCodeAt(0) && password.charCodeAt(s) <= '9'.charCodeAt(0)) {
                        score += 1;
                        break;
                    }
                }
            }
                if (score == 3)
                {
                return "";

                }
                else
                {
                    document.getElementById("pass").innerHTML = "Password should be Small Latter,Capital Latter and Digit";
                //return ("Password should be Small Latter,Capital Latter and Digit" + "\n");
                }
        
        };


            function ClearMessage() {
                document.getElementById("name1").innerHTML = "";
                document.getElementById('lname').innerHTML = " ";
                document.getElementById('add').innerHTML = "";
                document.getElementById('phn').innerHTML = "";
                document.getElementById('emails').innerHTML = "";
                document.getElementById("uname").innerHTML = "";
                document.getElementById("pass").innerHTML = "";

            };
        
    </script>
     <style type="text/css">
        .auto-style1 {
            width: 100%;
            align-items: center;
        }

        .auto-style2 {
            height: 102px;
            text-align: center;
            font-size: x-large;
            color:brown;
        }
         .tdclass-1{
            padding-left: 35%;
            display: inline-block;
         }
         .tdclass-2{
            width: 75%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
         }
         .btnrow{
          background-color: #4CAF50;
          color: white;
          padding: 16px 32px;
          border: none;
          border-radius: 4px;
          cursor: pointer;
          align-items: center;
          width: 100%;
         /* margin-top: 8%;
          margin-left: 37%;*/
         }
         .btnrow1{
          background-color: #4CAF50;
          color: white;
          padding: 16px 32px;
          border: none;
          border-radius: 4px;
          cursor: pointer;
          align-items: center;
          margin-top: 20.5%;
          margin-left: -107%;
         }
         .btnrow2{
          background-color: #4CAF50;
          color: white;
          padding: 16px 32px;
          border: none;
          border-radius: 4px;
          cursor: pointer;
          align-items: center;
          margin-top: 20.9%;
          margin-left: -162%;
         }
         #errorPassword{
             color:red;
              align-items: center;
         }
          #loginBtn{
                float: left;
                background-color: #4CAF50;
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
         }





     
    </style>

</head>
<body>
    <form id="form1" runat="server" >
        <div>
            <asp:HiddenField ID="Hdn1" runat="server" />
            
              <table class="auto-style1">
                 <tr>
                    <td class="auto-style2" colspan="4"><strong>STUDENT REGISTRATION FORM</strong></td>
                </tr>
                   <tr>
                      <td>
                          <asp:LinkButton ID="loginBtn" runat="server" OnClick="Reg_Click">Login</asp:LinkButton>
                      </td>
                  </tr>
                  
                <tr>

                    <td class="tdclass-1">
                        First Name:
                    </td>
                    <td >
                        <asp:TextBox ID="txtFname" runat="server" class="tdclass-2" onkeyup="ClearMessage()"></asp:TextBox>
                         <span id="name1" style="color: red;"></span>
                    </td>
                   
                </tr>
                 <tr>
                    <td class="tdclass-1">
                        Last Name:
                    </td>
                    <td>
                        <asp:TextBox ID="txtLname" runat="server" class="tdclass-2"  onkeyup="ClearMessage()"></asp:TextBox>
                         <span id="lname" style="color: red;"></span>
                    </td>
                </tr>
                <tr>
                    <td class="tdclass-1">
                        Address:
                    </td>
                    <td>
                        <textarea id="txtaddress" cols="20" rows="2" runat="server" class="tdclass-2"  onkeyup="ClearMessage()"></textarea>
                        <span id="add" style="color: red;"></span>
                    </td>
                </tr>
                 <tr>
                    <td class="tdclass-1">
                        Gender:
                    </td>
                    <td onkeyup="ClearMessage()">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                             <asp:ListItem>Male</asp:ListItem>  
                              <asp:ListItem>Female</asp:ListItem>  
                              <asp:ListItem>Others</asp:ListItem>  
                            

                        </asp:RadioButtonList>
                           <span id="gen" style="color: red;"></span>     

                    </td>
                      <td class="auto-style34">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="Provide Gender" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="tdclass-1">
                        Course:
                    </td>
                    <td>
                         <asp:DropDownList ID="DropDownList1" runat="server" class="tdclass-2" onkeyup="ClearMessage()">

                            <asp:ListItem Text="Select Cource" Value="select" Selected="True"></asp:ListItem>  
                            <asp:ListItem Text="MCA" Value="MCA"></asp:ListItem>  
                            <asp:ListItem Text="MBA" Value="MBA"></asp:ListItem>  
                            <asp:ListItem Text="MSC" Value="MSC"></asp:ListItem>


                        </asp:DropDownList>        
                         <span id="courses" style="color: red;"></span> 
                    </td>
                </tr>
                <tr>
                    <td class="tdclass-1">
                        Sports:
                    </td>
                    
                    <td onkeyup="ClearMessage()">
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True">
                             <asp:ListItem>Cricket</asp:ListItem>  
                              <asp:ListItem>Football</asp:ListItem>  
                              <asp:ListItem>Basketball</asp:ListItem>  
                               
                        </asp:CheckBoxList>
                          
                        <span id="sport" style="color: red;"></span>
                    </td>
                </tr>
                 <tr>
                    <td class="tdclass-1">
                        Phone:
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone" runat="server" class="tdclass-2" onkeyup="ClearMessage()"></asp:TextBox>
                        <span id="phn" style="color: red;"></span>
                    </td>
                </tr>
                 <tr>
                    <td class="tdclass-1">
                        Email:
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" class="tdclass-2" onkeyup="ClearMessage()"></asp:TextBox>
                        <span id="emails" style="color:red;"></span>

                    </td>
                </tr>
                 <tr>
                    <td class="tdclass-1">
                        Username:
                    </td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server" class="tdclass-2" onkeyup="ClearMessage()"></asp:TextBox>
                         <span id="uname" style="color: red;"></span>
                    </td>
                </tr>
                <tr>
                    <td class="tdclass-1">
                        Password:
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="tdclass-2" onkeyup="ClearMessage()"></asp:TextBox>
                         <span id="pass" style="color: red;"></span>
                    </td>
                </tr>
                  <tr>
                      <td>
                          <asp:Label ID="errorPassword" runat="server"></asp:Label>
                      </td>
                  </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSave" runat="server" Text="Submit" OnClick="btnSave_Click" class="btnrow"/>
                    </td>
                    
                   

                    
                </tr>
                  <span id="message"></span>
                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                   <Columns>
                       <asp:BoundField DataField="firstname" HeaderText="First Name" />
                       <asp:BoundField DataField="lastname" HeaderText="Last Name" />
                       <asp:BoundField DataField="studaddress" HeaderText="Address" />
                       <asp:BoundField DataField="gender" HeaderText="Gender" />
                       <asp:BoundField DataField="course" HeaderText="Course" />
                       <asp:BoundField DataField="sports" HeaderText="Sports" />
                       <asp:BoundField DataField="phone" HeaderText="Phone" />
                       <asp:BoundField DataField="emailaddress" HeaderText="Email" />
                       <asp:BoundField DataField="username" HeaderText="Username" />
                       <asp:BoundField DataField="password" HeaderText="Password" />
                       
                          
                     <%--   <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="linkview" runat="server" OnClick="linkonclick" Text="ViewDetais" CommandName="ViewDetails" 
                        CommandArgument='<%#Bind("studid") %>'>VIEW</asp:LinkButton>
                   
                </ItemTemplate>
            </asp:TemplateField>
                       --%>
                   
                       
                       
                   </Columns>
               </asp:GridView>
               
            </table>
        </div>
    </form>
 
</body>
</html>
