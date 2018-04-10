using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace QuanLySieuThi
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
            SqlConnection connect = new SqlConnection(@"Data Source=HP\SQLEXPRESS;Initial Catalog=QLSieuThi;Integrated Security=True");
            try
            {
                connect.Open();
                string tk = txtDangNhap.Text.Trim();
                string mk = txtPass.Text.Trim();
                string sql = "Select * from User where (Username = N'" + tk + "')"
                                            + "And (Password = '" + mk + "')";
                SqlCommand sqlcm = new SqlCommand(sql, connect);
                SqlDataReader dt = sqlcm.ExecuteReader();
                if (dt.Read() == true)
                {
                    panel2.Controls.Clear();
                    FrMain fr = new FrMain();
                    fr.TopLevel = false;
                    panel2.Controls.Add(fr);
                    fr.Show();
                }
                else
                {
                    MessageBox.Show("Đăng nhập thất bại!");
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi đăng nhập!");
            }
        }

        private void simpleButton2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
