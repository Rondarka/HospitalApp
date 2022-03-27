using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using HospitalWebApi.DB;

namespace HospitalWebApi.Controllers
{
    public class RecordsController : ApiController
    {
        private HospitalEntities db = new HospitalEntities();
        public RecordsController()
        {
            db.Configuration.ProxyCreationEnabled = false;
        }

        // GET: api/Records
        public IQueryable<Records> GetRecords()
        {
            return db.Records;
        }

        // GET: api/Records/5
        [ResponseType(typeof(Records))]
        public IHttpActionResult GetRecords(int id)
        {
            Records records = db.Records.Find(id);
            if (records == null)
            {
                return NotFound();
            }

            return Ok(records);
        }

        // PUT: api/Records/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutRecords(int id, Records records)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != records.Номер_записи)
            {
                return BadRequest();
            }

            db.Entry(records).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!RecordsExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Records
        [ResponseType(typeof(Records))]
        public IHttpActionResult PostRecords(Records records, int ReceptionId, int CardCode, int WorkerCode)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Records.Add(new Records() { Номер_приема = ReceptionId, Номер_карты = CardCode, Код_сотрудника = WorkerCode});
            db.SaveChanges();

            var LastRecordId = db.Reception.Single(p => p.Номер_приема == ReceptionId);
            LastRecordId.is_active = 0;
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = records.Номер_записи }, records);
        }

        // DELETE: api/Records/5
        [ResponseType(typeof(Records))]
        public IHttpActionResult DeleteRecords(int id)
        {
            Records records = db.Records.Find(id);
            if (records == null)
            {
                return NotFound();
            }

            db.Records.Remove(records);
            db.SaveChanges();          

            return Ok(records);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool RecordsExists(int id)
        {
            return db.Records.Count(e => e.Номер_записи == id) > 0;
        }
    }
}