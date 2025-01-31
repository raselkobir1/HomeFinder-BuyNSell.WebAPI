﻿using System;
using System.Collections.Generic;

namespace Domain.Entities;

public partial class Country
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public int? LastUpdatedBy { get; set; }

    public DateTime? LastUpdatedOn { get; set; }

    public virtual ICollection<City> Cities { get; set; } = new List<City>();

    public virtual User? LastUpdatedByNavigation { get; set; }

    public virtual ICollection<Property> Properties { get; set; } = new List<Property>();
}
