using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HospitalApp.Models
{
    internal class UserInfo
    {
        public int Код_Сотрудника { get; set; }
        public string ФИО { get; set; }
        public string Номер_участка { get; set; }
        public string Должность { get; set; }

    }
}
