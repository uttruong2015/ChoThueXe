//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ChoThueXe.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("tbl_xe")]
    public partial class tbl_xe
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_xe()
        {
            this.tbl_dangkyxe = new HashSet<tbl_dangkyxe>();
            this.tbl_laplichxe = new HashSet<tbl_laplichxe>();
        }
        [Key]
        public string Sttxe { get; set; }
        public string Banso { get; set; }
        public string Hieuxe { get; set; }
        public string Mahangxe { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_dangkyxe> tbl_dangkyxe { get; set; }
        public virtual tbl_hangxe tbl_hangxe { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_laplichxe> tbl_laplichxe { get; set; }
    }
}
