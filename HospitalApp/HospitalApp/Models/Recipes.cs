using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;

namespace HospitalApp.Models
{
    internal class Recipes
    {
        public int ReceptionId { get; set; }
        public int DoctorId { get; set; }

        public DateTime ReceptionDate { get; set; }

        public string ReceptionTime { get; set; }

        public int IsActive { get; set; }

        public SolidColorBrush Color
        {
            get
            {
                if (IsActive == 1)
                {
                    return new SolidColorBrush(Colors.Green);
                }
                else
                {
                    return new SolidColorBrush(Colors.Red);
                }
            }
        }

        public SolidColorBrush ForeColor
        {
            get
            {
                if (IsActive == 1)
                {
                    return new SolidColorBrush(Colors.White);
                }
                else
                {
                    return new SolidColorBrush(Colors.White);
                }
            }
        }
    }
}
