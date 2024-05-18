using System;
using System.Collections.Generic;

namespace JeanCraftLibrary.Models;

public partial class ComponentType
{
    public Guid TypeId { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<Component> Components { get; set; } = new List<Component>();
}
