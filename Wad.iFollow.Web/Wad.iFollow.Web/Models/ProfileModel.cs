using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Wad.iFollow.Web.Models
{
    public class ProfileModel
    {
        public ProfileModel()
        {
            elements = new WallPostsModel();
        }

        public string userName { get; set; }
        public int postsCount { get; set; }
        public int followersCount { get; set; }
        public int followedCount { get; set; }

        public WallPostsModel elements { get; set; }
    }
}