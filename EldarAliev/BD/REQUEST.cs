//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EldarAliev.BD
{
    using System;
    using System.Collections.Generic;
    
    public partial class REQUEST
    {
        public int Number { get; set; }
        public int CountOfProduct { get; set; }
        public System.DateTime DateRequest { get; set; }
        public System.DateTime Deadline { get; set; }
        public int ConsumerCode { get; set; }
        public int ProductNumber { get; set; }
    
        public virtual CONSUMER CONSUMER { get; set; }
        public virtual PRODUCT PRODUCT { get; set; }
    }
}
