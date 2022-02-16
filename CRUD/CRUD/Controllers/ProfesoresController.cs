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
using CRUD.Models;

namespace CRUD.Controllers
{
    public class ProfesoresController : ApiController
    {
        private EvaluacionRedEntities db = new EvaluacionRedEntities();

        // GET: api/Profesores
        public IQueryable<Profesores> GetProfesores()
        {
            return db.Profesores;
        }

        // GET: api/Profesores/5
        [ResponseType(typeof(Profesores))]
        public IHttpActionResult GetProfesores(int id)
        {
            Profesores profesores = db.Profesores.Find(id);
            if (profesores == null)
            {
                return NotFound();
            }

            return Ok(profesores);
        }

        // PUT: api/Profesores/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutProfesores(int id, Profesores profesores)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != profesores.IdProfesor)
            {
                return BadRequest();
            }

            db.Entry(profesores).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProfesoresExists(id))
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

        // POST: api/Profesores
        [ResponseType(typeof(Profesores))]
        public IHttpActionResult PostProfesores(Profesores profesores)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Profesores.Add(profesores);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = profesores.IdProfesor }, profesores);
        }

        // DELETE: api/Profesores/5
        [ResponseType(typeof(Profesores))]
        public IHttpActionResult DeleteProfesores(int id)
        {
            Profesores profesores = db.Profesores.Find(id);
            if (profesores == null)
            {
                return NotFound();
            }

            db.Profesores.Remove(profesores);
            db.SaveChanges();

            return Ok(profesores);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ProfesoresExists(int id)
        {
            return db.Profesores.Count(e => e.IdProfesor == id) > 0;
        }
    }
}