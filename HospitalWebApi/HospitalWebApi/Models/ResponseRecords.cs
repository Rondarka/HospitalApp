using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HospitalWebApi.DB;

namespace HospitalWebApi.Models
{
    public class ResponseRecords
    {
        private HospitalEntities db = new HospitalEntities();
        public ResponseRecords()
        {
            db.Configuration.ProxyCreationEnabled = false;
        }
        public ResponseRecords(DB.Records records)
        {
            RecordId = records.Номер_записи;
            ReceptionId = records.Номер_приема;
            CardCode = records.Номер_карты;
            WorderId = records.Код_сотрудника;
        }

        public int RecordId { get; set; }

        public int ReceptionId { get; set; }

        public int CardCode { get; set; }

        public int WorderId { get; set; }
    }
}