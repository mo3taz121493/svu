using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
namespace TestDB
{
    public class Classifier2
    {
        private DataSet dataSet2 = new DataSet();
        protected string DES;

        public DataSet DataSet2
        {
            get { return dataSet2; }
            set { dataSet2 = value; }
        }
        public void TrainClassifier(DataTable table)
        {
            dataSet2.Tables.Add(table);

            DataTable GaussianDistribution = dataSet2.Tables.Add("Gaussian");
            GaussianDistribution.Columns.Add(table.Columns[0].ColumnName);

            for (int i = 1; i < table.Columns.Count; i++)
            {
                GaussianDistribution.Columns.Add(table.Columns[i].ColumnName + "Mean");
                GaussianDistribution.Columns.Add(table.Columns[i].ColumnName + "Variance");
            }

            var results = (from myRow in table.AsEnumerable()
                           group myRow by myRow.Field<string>(table.Columns[0].ColumnName) into g
                           select new { Name = g.Key, Count = g.Count() }).ToList();
            for (int j = 0; j < results.Count; j++)
            {
                DataRow row = GaussianDistribution.Rows.Add();
                row[0] = results[j].Name;
                int a = 1;

                for (int i = 1; i < table.Columns.Count; i++)
                {

                    row[a] = VarianceAndMean.Mean(SelectRows(table, i, string.Format("{0} = '{1}'", table.Columns[0].ColumnName, results[j].Name)));

                    row[++a] = VarianceAndMean.Variance(SelectRows(table, i, string.Format("{0} = '{1}'", table.Columns[0].ColumnName, results[j].Name)));
                    a++;
                }
            }
        }
        public string Classify2(double[] obj)
        {
            Dictionary<string, double> score = new Dictionary<string, double>();

            var results = (from myRow in dataSet2.Tables[0].AsEnumerable()
                           group myRow by myRow.Field<string>(dataSet2.Tables[0].Columns[0].ColumnName) into g
                           select new { Name = g.Key, Count = g.Count() }).ToList();

            for (int i = 0; i < results.Count; i++)
            {
                List<double> subScoreList = new List<double>();
                int a = 1, b = 1;
                for (int k = 1; k < dataSet2.Tables["Gaussian"].Columns.Count; k = k + 2)
                {
                    double mean = Convert.ToDouble(dataSet2.Tables["Gaussian"].Rows[i][a]);
                    double variance = Convert.ToDouble(dataSet2.Tables["Gaussian"].Rows[i][++a]);
                    double result = VarianceAndMean.NormalDist(obj[b - 1], mean, VarianceAndMean.SquareRoot(variance));
                    subScoreList.Add(result);
                    a++; b++;

                }

                double finalScore = 0;
                for (int z = 0; z < subScoreList.Count; z++)
                {
                    if (finalScore == 0)
                    {
                        finalScore = subScoreList[z];
                        continue;
                    }

                    finalScore = finalScore * subScoreList[z];
                }

                score.Add(results[i].Name, finalScore * 0.5);
            }

            double maxOne = score.Max(c => c.Value);
            double minOne = score.Min(c => c.Value);
            var name = (from c in score
                        where c.Value == maxOne
                        select c.Key).First();


            string r = "";
            if (maxOne > 0.27532865692145E-9)
            { r = "Negative"; }

            else { r = "Positive"; }
           
            return "The Result is " + r ;

        }

        #region Helper Function
        public IEnumerable<double> SelectRows(DataTable table, int column, string filter)
        {
            List<double> _doubleList = new List<double>();
            DataRow[] rows = table.Select(filter);
            for (int i = 0; i < rows.Length; i++)
            {
                var test = rows[i][column].ToString();
                _doubleList.Add(double.Parse(  rows[i][column].ToString()));
            }

            return _doubleList;
        }
        public void Clear()
        {
            dataSet2 = new DataSet();
        }

        #endregion

    }
}
