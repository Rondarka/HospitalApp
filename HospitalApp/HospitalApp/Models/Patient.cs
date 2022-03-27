using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HospitalApp.Models
{
    internal class Patient
    {
        public int CardCode { get; set; }
        public string Name { get; set; }
        public string Birthday { get; set; }
        public long POLIS { get; set; }
        public string SNILS { get; set; }
        public string Adress { get; set; }
        public string Telephone { get; set; }
        public int SiteNumber { get; set; }
    }
}
