﻿using System;

namespace Accio.Business.Models.LanguageModels
{
    public class LanguageModel
    {
        public Guid LanguageId { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string FlagImagePath { get; set; }
        public bool Enabled { get; set; } = false;
        public Guid CreatedById { get; set; }
        public DateTime CreatedDate { get; set; }
        public Guid UpdatedById { get; set; }
        public DateTime UpdatedDate { get; set; }
        public bool Deleted { get; set; }
    }
}
