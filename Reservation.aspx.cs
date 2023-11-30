using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YEARBOOK
{
    public partial class Reservation : Page
    {

        string connectionString = @"Server=localhost;Database=dbyearbook;Uid=root;Pwd=Abegail-1";

        public int Id { get; set; }
        public string User { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            using (var connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                var query = "SELECT Id, User, StartTime, EndTime FROM tblReservations";
                using (var adapter = new MySqlDataAdapter(query, connection))
                {
                    var dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    GridView1.DataSource = dataTable;
                    GridView1.DataBind();
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var user = txtUser.Text;
            var startTime = DateTime.Parse(txtStartTime.Text);
            var endTime = DateTime.Parse(txtEndTime.Text);

            var newReservation = new Reservation { User = user, StartTime = startTime, EndTime = endTime };

            if (!HasConflict(newReservation))
            {
                AddReservation(newReservation);
                BindGridView();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Conflict with existing reservations.');", true);
            }
        }

        private bool HasConflict(Reservation newReservation)
        {
            using (var connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                var query = "SELECT Id, User, StartTime, EndTime FROM tblReservations WHERE StartTime < @EndTime AND EndTime > @StartTime";
                using (var command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@StartTime", newReservation.StartTime);
                    command.Parameters.AddWithValue("@EndTime", newReservation.EndTime);

                    using (var reader = command.ExecuteReader())
                    {
                        return reader.HasRows;
                    }
                }
            }
        }

        private void AddReservation(Reservation reservation)
        {
            using (var connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                var query = "INSERT INTO tblReservations (User, StartTime, EndTime) VALUES (@User, @StartTime, @EndTime)";
                using (var command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@User", reservation.User);
                    command.Parameters.AddWithValue("@StartTime", reservation.StartTime);
                    command.Parameters.AddWithValue("@EndTime", reservation.EndTime);

                    command.ExecuteNonQuery();
                }
            }
        }
    }
}
