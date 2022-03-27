using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HospitalWebApi.DB;

namespace HospitalWebApi.Models
{
    public class ResponseRecipes
    {
        private HospitalEntities db = new HospitalEntities();
        public ResponseRecipes()
        {
            db.Configuration.ProxyCreationEnabled = false;
        }
        public ResponseRecipes(DB.Reception reception)
        {
            DoctorId = reception.Код_врача;
            ReceptionId = reception.Номер_приема;
            ReceptionData = reception.Дата_приема.Date;
            ReceptionTime = reception.Время_приема.ToString();
            IsActive = reception.is_active;
        }
        public int ReceptionId { get; set; }
        public int DoctorId { get; set; }

        public DateTime ReceptionData { get; set; }

        public string ReceptionTime { get; set; }

        public int IsActive { get; set; }
    }
}