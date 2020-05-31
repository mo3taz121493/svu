using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace TestDB
{
    public partial class DataMinningPage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Motaz\\source\\repos\\TestDB\\TestDB\\App_Data\\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void b2_Click(object sender, EventArgs e)
        {
            string s = "select  disease,age,chest_pain_type,rest_blood_pressure ,blood_sugar,rest_electro ,max_heart_rate,exercice_angina from HeartDisease";
            SqlCommand cmd = new SqlCommand(s, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            SqlDataAdapter da2 = new SqlDataAdapter(cmd);
            
            DataTable dt = new DataTable();
            DataTable dt2 = new DataTable();
            
            da.Fill(dt);
            da2.Fill(dt2);
            
            Classifier bayes = new Classifier();
            Classifier2 ID = new Classifier2();
            
            //تمرير البيانات الى المصنف للتدريب
            bayes.TrainClassifier(dt);
            ID.TrainClassifier(dt2);
            
            //تخزين القيم المدخلة من الواجهة ضمن متغيرات
            double age = Convert.ToDouble(t1.Text);
            double Chest_Pain_Type = Convert.ToDouble(d1.SelectedValue);
            double blood_pres = Convert.ToDouble(t2.Text);
            double fasting_blood = Convert.ToDouble(t4.SelectedValue);
            double Resting_Electro = Convert.ToDouble(DropDownList1.SelectedValue);
            double max_heart_rate = Convert.ToDouble(t3.Text);
            double Exercise = Convert.ToDouble(DropDownList2.SelectedValue);


            double age2 = Convert.ToDouble(t1.Text);
            double Chest_Pain_Type2 = Convert.ToDouble(d1.SelectedValue);
            double blood_pres2 = Convert.ToDouble(t2.Text);
            double fasting_blood2 = Convert.ToDouble(t4.SelectedValue);
            double Resting_Electro2 = Convert.ToDouble(DropDownList1.SelectedValue);
            double max_heart_rate2 = Convert.ToDouble(t3.Text);
            double Exercise2 = Convert.ToDouble(DropDownList2.SelectedValue);

            //تمرير البيانات المدخلة للتصنيف وعرض النتيجة ضمن ليل

            if (algo.SelectedValue == "1")
            {
                l1.Text = "Bayes :  " + bayes.Classify(new double[] { age, Chest_Pain_Type, blood_pres, fasting_blood, Resting_Electro, max_heart_rate, Exercise }).ToString();
            }

            else
            {
                l1.Text = "ID3 : " + ID.Classify2(new double[] { age2, Chest_Pain_Type2, blood_pres2, fasting_blood2, Resting_Electro2, max_heart_rate2, Exercise2 }).ToString();
            }


        }
    }
}