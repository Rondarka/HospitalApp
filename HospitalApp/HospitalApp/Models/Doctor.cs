using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HospitalApp.Models
{
    internal class Doctor
    {
        public int DoctorId { get; set; }
        public string Name { get; set; }
        public string Birthday { get; set; }
        public string Adress { get; set; }
        public long Passport { get; set; }
        public string Speciality { get; set; }
        public int SiteNumber { get; set; }
    }
}
