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
    public class DoctorsController : ApiController
    {
        private HospitalEntities db = new HospitalEntities();

        public DoctorsController()
        {
            db.Configuration.ProxyCreationEnabled = false;
        }

        // GET: api/Doctors
        public IQueryable<Doctor> GetDoctor()
        {
            return db.Doctor;
        }

        // GET: api/Doctors/5
        [ResponseType(typeof(List<Models.ResponsDoctor>))]
        public IHttpActionResult GetDoctor(int id)
        {
            var doctor = db.Doctor.Where(p => p.Номер_участка == id).ToList().ConvertAll(p => new Models.ResponsDoctor(p));
            if (doctor == null)
            {
                return NotFound();
            }

            return Ok(doctor);
        }

        // PUT: api/Doctors/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutDoctor(int id, Doctor doctor)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != doctor.Код_врача)
            {
                return BadRequest();
            }

            db.Entry(doctor).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DoctorExists(id))
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

        // POST: api/Doctors
        [ResponseType(typeof(Doctor))]
        public IHttpActionResult PostDoctor(Doctor doctor)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Doctor.Add(doctor);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = doctor.Код_врача }, doctor);
        }

        // DELETE: api/Doctors/5
        [ResponseType(typeof(Doctor))]
        public IHttpActionResult DeleteDoctor(int id)
        {
            Doctor doctor = db.Doctor.Find(id);
            if (doctor == null)
            {
                return NotFound();
            }

            db.Doctor.Remove(doctor);
            db.SaveChanges();

            return Ok(doctor);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool DoctorExists(int id)
        {
            return db.Doctor.Count(e => e.Код_врача == id) > 0;
        }
    }
}