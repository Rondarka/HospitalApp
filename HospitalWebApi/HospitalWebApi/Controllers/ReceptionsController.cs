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
    public class ReceptionsController : ApiController
    {
        private HospitalEntities db = new HospitalEntities();
        public ReceptionsController()
        {
            db.Configuration.ProxyCreationEnabled = false;
        }

        // GET: api/Receptions
        public IQueryable<Reception> GetReception()
        {
            return db.Reception;
        }

        // GET: api/Receptions/5
        [ResponseType(typeof(List<Models.ResponseRecipes>))]
        public IHttpActionResult GetReception(int DoctorId, DateTime ReceptionDate)
        {
            var reception = db.Reception.Where(p => p.Код_врача == DoctorId && p.Дата_приема == ReceptionDate).ToList().ConvertAll(p => new Models.ResponseRecipes(p));
            if (reception == null)
            {
                return NotFound();
            }

            return Ok(reception);
        }

        // PUT: api/Receptions/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutReception(int id, Reception reception)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != reception.Номер_приема)
            {
                return BadRequest();
            }

            db.Entry(reception).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ReceptionExists(id))
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

        // POST: api/Receptions
        [ResponseType(typeof(Reception))]
        public IHttpActionResult PostReception(Reception reception, int DoctorId, string receptionTime, string receptrionDate)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Reception.Add(new Reception() {  Код_врача = DoctorId, Дата_приема = Convert.ToDateTime(receptrionDate), Время_приема = TimeSpan.Parse(receptionTime), is_active = 1 });
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = reception.Номер_приема }, reception);
        }

        // DELETE: api/Receptions/5
        [ResponseType(typeof(Reception))]
        public IHttpActionResult DeleteReception(int id)
        {
            Reception reception = db.Reception.Find(id);
            if (reception == null)
            {
                return NotFound();
            }

            db.Reception.Remove(reception);
            db.SaveChanges();

            return Ok(reception);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ReceptionExists(int id)
        {
            return db.Reception.Count(e => e.Номер_приема == id) > 0;
        }
    }
}