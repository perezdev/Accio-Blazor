﻿using System;
using System.Collections.Generic;

namespace Accio.Data
{
    public partial class LessonType
    {
        public Guid LessonTypeId { get; set; }
        public string Name { get; set; }
        public string ImageName { get; set; }
        public string CssClassName { get; set; }
        public Guid CreatedById { get; set; }
        public DateTime CreatedDate { get; set; }
        public Guid UpdatedById { get; set; }
        public DateTime UpdatedDate { get; set; }
        public bool Deleted { get; set; }
    }
}
