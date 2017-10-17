using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection connection;
    SqlDataAdapter adapter;
    DataSet dataSet;
    SqlCommand command;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CreateDataSet();
            RosterGridView.DataSource = RosterSource;
            RosterGridView.DataBind();
        }

    }

    protected void RosterGridView_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    private void CreateDataSet()
    {
        connection = new SqlConnection(RosterSource.ConnectionString);
        command = new SqlCommand(RosterSource.SelectCommand, connection);
        adapter = new SqlDataAdapter(command);
        dataSet = new DataSet();
        adapter.Fill(dataSet, "Roster");
    }

    public void OpenDatabase()
    {
        connection = new SqlConnection(RosterSource.ConnectionString);
        if (connection.State == ConnectionState.Closed)
        {
            connection.Open();
        }
    }

    public void Execute(String sql)
    {
        OpenDatabase();
        command = new SqlCommand(sql, connection);
        command.ExecuteNonQuery();
        connection.Close();

    }

    protected void RosterGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        string ID = RosterGridView.Rows[e.RowIndex].Cells[0].Text.ToString();
        String sql = "DELETE FROM Roster WHERE Id = '" + ID + "'";
        Execute(sql);
        Refresh();
    }



    private void Refresh()
    {
        CreateDataSet();
        DataView dataView = new DataView(dataSet.Tables["Roster"]);
        RosterGridView.DataSource = dataView;
        RosterGridView.DataBind();
    }

    protected void RosterGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        this.RosterGridView.EditIndex = e.RowIndex;
        string primaryKey = RosterGridView.DataKeys[e.RowIndex].Value.ToString();
        string name = ((TextBox)(RosterGridView.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim();
        string sex = ((TextBox)(RosterGridView.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim();
        string age = ((TextBox)(RosterGridView.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim();
        string birth = ((TextBox)(RosterGridView.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString().Trim();
        string tel = ((TextBox)(RosterGridView.Rows[e.RowIndex].Cells[5].Controls[0])).Text.ToString().Trim();
        string strsql = "UPDATE Roster " +
            "SET Name ='" + name 
            + "' ,Sex = '" + sex 
            + "' ,Age = '" + age 
            + "' ,Birth = '" + birth 
            + "' ,Tel = '" + tel
            + "' where Id = '" + primaryKey + "'";
        SqlConnection connection = new SqlConnection(RosterSource.ConnectionString);
        SqlCommand command = new SqlCommand(strsql, connection);
        connection.Open();
        command.ExecuteNonQuery();
        connection.Close();
        RosterGridView.EditIndex = -1;
        Refresh();
    }

    protected void RosterGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {

        RosterGridView.EditIndex = 0;
        Refresh();
    }


    protected void RosterGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        RosterGridView.EditIndex = -1;
        Refresh();
    }

    protected void AddButton_Click(object sender, EventArgs e)
    {
        string id = TextBox1.Text;
        string name = TextBox2.Text;
        string sex = TextBox3.Text;
        string age = TextBox4.Text;
        string birth = TextBox5.Text;
        string tel = TextBox6.Text;

        string strsql = "INSERT INTO Roster(Id, Name, Sex, Age, Birth, Tel) VALUES(" + id + ", '" + name + "', '" + sex + "', '"+ age + "', '" + birth + "', '" + tel + "');";
        CreateDataSet();
        SqlConnection connection = new SqlConnection(RosterSource.ConnectionString);
        SqlCommand command = new SqlCommand(strsql, connection);
        connection.Open();
        command.ExecuteNonQuery();
        connection.Close();
        Refresh();
        TextBox1.Text = TextBox2.Text = TextBox3.Text = TextBox4.Text = TextBox5.Text = TextBox6.Text = "";
    }
}