using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Fortune_Teller_MVC.Models;

namespace Fortune_Teller_MVC.Controllers
{
    public class CustomersController : Controller
    {
        private FortuneTellerMVCEntities1 db = new FortuneTellerMVCEntities1();

        // GET: Customers
        public ActionResult Index()
        {
            var customers = db.Customers.Include(c => c.BirthMonth).Include(c => c.Color).Include(c => c.Sibling);
            return View(customers.ToList());
        }

        // GET: Customers/Details/5
        public ActionResult Details(int? id) //Put the extra code in here 
        {

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);

            //----------------------------------------------
            if (customer.Age % 2 == 0)
            {
                //even
                ViewBag.NumberOfYears = 20;
            }
            else
            {
                //odd
                ViewBag.NumberofYears = 35;
            }

            var firstLetterMonth = customer.BirthMonth.BirthMonth1[0]; // Birth Month 
            var secondLetterMonth = customer.BirthMonth.BirthMonth1[1];
            var thirdLetterMonth = customer.BirthMonth.BirthMonth1[2];
            string wholeName = customer.FirstName + customer.LastName;
            if (wholeName.Contains(firstLetterMonth))
            {
                ViewBag.AmountOfMoney = 300;
            }
            else if (wholeName.Contains(secondLetterMonth))
            {
                ViewBag.AmountOfMoney = 500;
            }
            else if (wholeName.Contains(thirdLetterMonth))
            {
                ViewBag.AmountOfMoney = 700;
            }
            else
            {
                ViewBag.AmountOfMoney = 5; 
            }
            //------------------------------------

            if (customer.Sibling.NumberOfSiblings == 0) //---Not sure why error occures
            {
                ViewBag.Location = "Siberia";
            }
            else if (customer.Sibling.NumberOfSiblings == 1)
            {
                ViewBag.Location = "Dubai";
            }
            else if (customer.Sibling.NumberOfSiblings == 2)
            {
                ViewBag.Location = "Hogwarts";
            }
            else if (customer.Sibling.NumberOfSiblings == 3)
            {
                ViewBag.Location = "Tatooine";
            }
            else
            {
                ViewBag.Location = "Aruba";
            }



            return View(customer);
            //-------------------Part 3
            // switch (customer.Color.Color1)
            //{
            //    case "RED":
            //        ViewBag.Color = "Maserati car";

            //        break;
            //    case "ORANGE":
            //        ViewBag.Color = "Mini Coop";
            //        break;
            //    case "YELLOW":
            //        ViewBag.Color = "RTA bus";
            //        break;
            //    case "GREEN":
            //        ViewBag.Color = "You will ride a camel";
            //        break;
            //    case "BLUE":
            //        ViewBag.Color = "Magic Carpet";
            //        break;
            //    case "INDIGO":
            //        ViewBag.Color = "Mermaidman and Barnacleboy's Invisible Boatmobile";
            //        break;
            //    case "VIOLET":
            //        ViewBag.Color = "go-kart";
            //        break;
            //} 
            //if (customer.)
            if (customer.Color.Color1 == "red")
            {
                ViewBag.Location = "Maserati car";
            }
            else if (customer.Color.Color1 == "orange")
            {
                ViewBag.Location = "Mini Coop";
            }
            else if (customer.Color.Color1 == "yellow")
            {
                ViewBag.Location = "RTA Bus";
            }
            else if (customer.Color.Color1 == "green")
            {
                ViewBag.Location = "You will ride a camel";
            }

            else if (customer.Color.Color1 == "blue")
            {
                ViewBag.Location = "Magic Carpet";
            }
            else if (customer.Color.Color1 == "indigo")
            {
                ViewBag.Location = "Mermaidman and Barnacleboy's Invisible Boatmobile";
            }

            else if (customer.Color.Color1 == "violet")
            {
                ViewBag.Location = "go-kart";
            }
            
        }

        

        
        // GET: Customers/Create
        public ActionResult Create()
        {
            ViewBag.BirthMonthID = new SelectList(db.BirthMonths, "BirthMonthID", "BirthMonth1");
            ViewBag.ColorID = new SelectList(db.Colors, "ColorID", "Color1");
            ViewBag.SiblingsID = new SelectList(db.Siblings, "SiblingsID", "SiblingsID");
            return View();
        }
        

        // POST: Customers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CustomerID,FirstName,LastName,Age,SiblingsID,ColorID,BirthMonthID")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                db.Customers.Add(customer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BirthMonthID = new SelectList(db.BirthMonths, "BirthMonthID", "BirthMonth1", customer.BirthMonthID);
            ViewBag.ColorID = new SelectList(db.Colors, "ColorID", "Color1", customer.ColorID);
            ViewBag.SiblingsID = new SelectList(db.Siblings, "SiblingsID", "SiblingsID", customer.SiblingsID);
            return View(customer);
        }

        // GET: Customers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            ViewBag.BirthMonthID = new SelectList(db.BirthMonths, "BirthMonthID", "BirthMonth1", customer.BirthMonthID);
            ViewBag.ColorID = new SelectList(db.Colors, "ColorID", "Color1", customer.ColorID);
            ViewBag.SiblingsID = new SelectList(db.Siblings, "SiblingsID", "SiblingsID", customer.SiblingsID);
            return View(customer);
        }

        // POST: Customers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CustomerID,FirstName,LastName,Age,SiblingsID,ColorID,BirthMonthID")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(customer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BirthMonthID = new SelectList(db.BirthMonths, "BirthMonthID", "BirthMonth1", customer.BirthMonthID);
            ViewBag.ColorID = new SelectList(db.Colors, "ColorID", "Color1", customer.ColorID);
            ViewBag.SiblingsID = new SelectList(db.Siblings, "SiblingsID", "SiblingsID", customer.SiblingsID);
            return View(customer);
        }

        // GET: Customers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // POST: Customers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Customer customer = db.Customers.Find(id);
            db.Customers.Remove(customer);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {

            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
