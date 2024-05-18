using System;
using System.Collections.Generic;

namespace JeanCraftLibrary.Models;

public partial class Address
{
    public Guid Id { get; set; }

    public Guid? UserId { get; set; }

    public string? Type { get; set; }

    public string? Detail { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();

    public virtual Account? User { get; set; }
}
