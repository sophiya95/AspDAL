using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DALClassLibrary;
using System.Configuration;


namespace SampleProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DAL dal = new DAL();
        //string cn = "server=DESKTOP-BDS6074\\SQLEXPRESS; database=sampledata; integrated security=SSPI";
        string cs = ConfigurationManager.ConnectionStrings["DBC"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            btnSave.Attributes.Add("onClick", "javascript:return validate()");
            txtPassword.TextMode = TextBoxMode.Password;
            if (!IsPostBack)

            {
                showdata();
            }
        }

        void showdata()
        {
            GridView1.DataSource = dal.DataShow();

            GridView1.DataBind();
         

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            string str = "";
            for (int i = 0; i <= CheckBoxList1.Items.Count - 1; i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                {

                    if (str == "")
                    {

                        str = CheckBoxList1.Items[i].Text;

                    }

                    else
                    {

                        str += "," + CheckBoxList1.Items[i].Text;

                    }
                }
            }
            bool status = dal.InsertData(txtFname.Text, txtLname.Text, txtaddress.Value, RadioButtonList1.Text,
                DropDownList1.SelectedValue.ToString(), str.ToString(), txtPhone.Text, txtEmail.Text,
                txtUsername.Text, txtPassword.Text);


           

            if (status == true)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Record added successfully');", true);
                //Response.Redirect("Login.aspx");
               

            }

            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert(' usename and password are already exist');", true);
                //errorPassword.Text = "usename and password are already exist";
            }
           







        }


        protected void Reg_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }






    }
}