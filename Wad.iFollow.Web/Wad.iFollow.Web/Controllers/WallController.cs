using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Wad.iFollow.Web.Models;

namespace Wad.iFollow.Web.Controllers
{
    public class WallController : Controller
    {
        //
        // GET: /Main/

        public ActionResult MainPage()
        {
            user currentUser = Session["user"] as user;
            WallPostsModel wpm = new WallPostsModel();

            using (var entities = new ifollowdatabaseEntities4())
            {
                currentUser = entities.users.First(u => u.id == currentUser.id);
                wpm.BuildFromImagesAndPosts(currentUser.posts, currentUser.images);
            }

            return View(wpm);          
        }

        public ActionResult WallPost()
        {
            return PartialView("_WallPosts");
        }

        public ActionResult Settings()
        {
            ViewBag.Message = "Your contact page.";

            return PartialView("_SettingsModal");
        }

        public ActionResult Post()
        {
            ViewBag.Message = "Your posting page.";
            return PartialView("_PostSettings");
        }

        public ActionResult Profile()
        {
            user currentUser = Session["user"] as user;
            ProfileModel pm = new ProfileModel();
            pm.userName = currentUser.firstName;

            using (var entities = new ifollowdatabaseEntities4())
            {
                currentUser = entities.users.First(u => u.id == currentUser.id);
                pm.postsCount = currentUser.posts.Count();
                pm.followersCount = currentUser.followers.Count();
                pm.followedCount = currentUser.followers1.Count();
                pm.elements.BuildFromImagesAndPosts(currentUser.posts, currentUser.images);
            }
            ViewBag.Message = "Your profile page.";
            return PartialView("_ProfilePage", pm);
        }

        public ActionResult Followers()
        {
            ViewBag.Message = "Your followers page.";
            return PartialView("_Followers");
        }
    }
}
