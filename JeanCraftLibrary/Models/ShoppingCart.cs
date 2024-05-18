using System;
using System.Collections.Generic;

namespace JeanCraftLibrary.Models;

public partial class ShoppingCart
{
    public Guid CartId { get; set; }

    public Guid UserId { get; set; }
}
