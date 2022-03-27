using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HospitalWebApi.DB;

namespace HospitalWebApi.Models
{

    public class ResponsePatient
    {
        private HospitalEntities db = new HospitalEntities();
        public ResponsePatient()
        {
            db.Configuration.ProxyCreationEnabled = false;
        }
        public ResponsePatient(DB.Patient patient)
        {
            CardCode = patient.Номер_карты;
            Name = patient.ФИО;
            Birthday = patient.Дата_рождения.ToShortDateString();
            Adress = patient.Адрес;
            Telephone = patient.Телефон;
            SNILS = patient.СНИЛС;
            POLIS = patient.Полис;
            SiteNumber = patient.Номер_участка;
        }
        public int CardCode { get; set; }
        public string Name { get; set; }
        public string Birthday { get; set; }
        public string Adress { get; set; }
        public string Telephone { get; set; }
        public string SNILS { get; set; }
        public long POLIS { get; set; }
        public int SiteNumber { get; set; }
    }
}