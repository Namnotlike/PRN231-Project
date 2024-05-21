using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace JeanCraftLibrary.Models;

public partial class ComponentType
{
    public Guid TypeId { get; set; }

    public string? Description { get; set; }
    [JsonIgnore]
    public virtual ICollection<Component> Components { get; set; } = new List<Component>();
}
