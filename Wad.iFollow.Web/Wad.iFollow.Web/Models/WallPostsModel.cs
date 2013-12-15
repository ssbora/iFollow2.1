using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Diagnostics;

namespace Wad.iFollow.Web.Models
{
    public class WallPostsModel
    {
        public List<UploadFileModel> wallElements { get; set; }

        public void BuildFromImagesAndPosts(ICollection<post> posts, ICollection<image> images)
        {
            wallElements = new List<UploadFileModel>();

            for (int index = posts.Count() - 1; index >= 0 ; index--)
            {
                UploadFileModel newModel = new UploadFileModel();
                newModel.Message = posts.ElementAt(index).message;

                if (posts.ElementAt(index).imageId != null)
                {
                    string imagePath = images.First(i => i.id == posts.ElementAt(index).imageId).url;
                    string path = @"~/Images/UserPhotos/" + imagePath;
                    newModel.Path = path;
                }
                else
                {
                    newModel.Path = "~/Images/1.jpg";
                }

                wallElements.Add(newModel);
            }
        }
    }
}