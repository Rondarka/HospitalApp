using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HospitalWebApi.DB;

namespace HospitalWebApi.Models
{
    public class ResponsDoctor
    {
        private HospitalEntities db = new HospitalEntities();
        public ResponsDoctor()
        {
            db.Configuration.ProxyCreationEnabled = false;
        }
        public ResponsDoctor(DB.Doctor doctor)
        {
            DoctorId = doctor.Код_врача;
            Name = doctor.ФИО;
            Birthday = doctor.Дата_рождения.ToShortDateString();
            Adress = doctor.Адрес;
            Passport = doctor.Паспорт;
            Speciality = doctor.Специальность;
            SiteNumber = doctor.Номер_участка;
        }
        public int DoctorId { get; set; }
        public string Name { get; set; }
        public string Birthday { get; set; }
        public string Adress { get; set; }
        public long Passport { get; set; }
        public string Speciality { get; set; }
        public int SiteNumber { get; set; }
    }
}