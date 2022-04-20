using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DALClassLibrary;





namespace SampleProject
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        DAL dal = new DAL();
 
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox2.TextMode = TextBoxMode.Password;
            
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            dal.CheckLogin(TextBox1.Text, TextBox2.Text);
            bool res = dal.CheckLogin(TextBox1.Text, TextBox2.Text);
            if (res == true)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Login');", true);
                Response.Redirect("Home.aspx");
               

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert(' Login Failed');", true);
            }


        }
    }
}

