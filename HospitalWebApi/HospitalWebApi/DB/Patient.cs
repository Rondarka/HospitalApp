//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HospitalWebApi.DB
{
    using System;
    using System.Collections.Generic;
    
    public partial class Patient
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Patient()
        {
            this.Records = new HashSet<Records>();
        }
    
        public int Номер_карты { get; set; }
        public string ФИО { get; set; }
        public System.DateTime Дата_рождения { get; set; }
        public string Адрес { get; set; }
        public string Телефон { get; set; }
        public string СНИЛС { get; set; }
        public long Полис { get; set; }
        public int Номер_участка { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Records> Records { get; set; }
        public virtual Sites Sites { get; set; }
    }
}