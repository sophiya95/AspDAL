using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DALClassLibrary
{
    public class DAL
    {
        //string cs = "server=DESKTOP-BDS6074\\SQLEXPRESS; database=sampledata; integrated security=SSPI";
        string cs = ConfigurationManager.ConnectionStrings["DBC"].ConnectionString;

        public bool CheckLogin(string username, string password)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                bool res;

                SqlParameter par = new SqlParameter("@username", username);
                SqlParameter par1 = new SqlParameter("@password", password);

                SqlCommand cmd = new SqlCommand("select username,password from tblstudents where username=@username and password=@password", con);
                cmd.Parameters.Add(par);
                cmd.Parameters.Add(par1);

                con.Open();
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                return res = dr.Read();
                con.Close();


            }
        }
    
        public  bool  InsertData(string firstname,string lastname,string studaddress,string gender,string course,string sports,
            string phone,string emailaddress,string username,string password)
        {
            bool status = false;
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("InsertData", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@firstname", firstname);
                    cmd.Parameters.AddWithValue("@lastname", lastname);
                    cmd.Parameters.AddWithValue("@studaddress", studaddress);
                    cmd.Parameters.AddWithValue("@gender", gender);
                    cmd.Parameters.AddWithValue("@course", course);
                    cmd.Parameters.AddWithValue("@sports", sports);
                    cmd.Parameters.AddWithValue("@phone", phone);
                    cmd.Parameters.AddWithValue("@emailaddress", emailaddress);
                    cmd.Parameters.AddWithValue("@username", username.Trim());
                    cmd.Parameters.AddWithValue("@password", password.Trim());
                    con.Open();
                    status = Convert.ToBoolean(cmd.ExecuteScalar());
                    //SqlDataReader dr = cmd.ExecuteReader();
                    con.Close();
                    return status;
                    
                }
                



                //using (SqlCommand cmd = new SqlCommand("Sp_GridCrud", con))
                //    {

                //        cmd.CommandType = CommandType.StoredProcedure;
                //        cmd.Parameters.AddRange(new SqlParameter[]
                //            {
                //       new SqlParameter("@Event","Insert"),
                //        new SqlParameter("@firstname",firstname),
                //        new SqlParameter("@lastname",lastname),
                //        new SqlParameter("@studaddress",studaddress),
                //        new SqlParameter("@gender",gender),
                //        new SqlParameter("@course",course),
                //        new SqlParameter("@sports",sports),
                //        new SqlParameter("@phone",phone),
                //        new SqlParameter("@emailaddress",emailaddress),
                //        new SqlParameter("@username",username),
                //        new SqlParameter("@password",password)
                //            });

                //        con.Open();
                //        cmd.ExecuteNonQuery();
                 
                //        con.Close();


                //    }
                
            }
           

        }

       
        
        public DataTable  DataShow()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("Sp_GridCrud", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Event", "Select");
                    //cmd.Parameters.AddRange(new SqlParameter[]
                    //    {
                    //        new SqlParameter("@Event","Select"),
                      
                    //    });
                    using(SqlDataAdapter adp = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        adp.Fill(dt);
                        return dt;
                    }
                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();


                }
            }
        }




    }
}
