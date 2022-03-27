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
    public class PatientsController : ApiController
    {
        private HospitalEntities db = new HospitalEntities();

        public PatientsController()
        {
            db.Configuration.ProxyCreationEnabled = false;
        }

        // GET: api/Patients
        public IQueryable<Patient> GetPatient()
        {
            return db.Patient;
        }

        // GET: api/Patients/5
        [ResponseType(typeof(List<Models.ResponsePatient>))]
        public IHttpActionResult GetPatient(int sitenumber)
        {
            var patients = db.Patient.Where(p => p.Номер_участка == sitenumber).ToList().ConvertAll(p => new Models.ResponsePatient(p));
            if (patients == null)
            {
                return NotFound();
            }

            return Ok(patients);
        }


        // PUT: api/Patients/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutPatient(int id, Patient patient)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != patient.Номер_карты)
            {
                return BadRequest();
            }

            db.Entry(patient).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PatientExists(id))
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

        // POST: api/Patients
        [ResponseType(typeof(Patient))]
        public IHttpActionResult PostPatient(Patient patient, string name, string birth, string adres, string phone, string snils, long polis, int sitecode)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Patient.Add(new Patient() { ФИО = name, Дата_рождения = Convert.ToDateTime(birth), Адрес = adres, Телефон = phone, СНИЛС = snils, Полис = polis, Номер_участка = sitecode } );
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = patient.Номер_карты }, patient);
        }

        // DELETE: api/Patients/5
        [ResponseType(typeof(Patient))]
        public IHttpActionResult DeletePatient(int id)
        {
            Patient patient = db.Patient.Find(id);
            if (patient == null)
            {
                return NotFound();
            }

            db.Patient.Remove(patient);
            db.SaveChanges();

            return Ok(patient);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool PatientExists(int id)
        {
            return db.Patient.Count(e => e.Номер_карты == id) > 0;
        }
    }
}