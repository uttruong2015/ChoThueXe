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

    [Table("tbl_laplichxe")]
    public partial class tbl_laplichxe
    {
        [Key]
        [Column(Order = 1)]
        public string Manv { get; set; }
        [Key]
        [Column(Order = 2)]
        public string Sttxe { get; set; }
        [Key]
        [Column(Order = 3 )]
        public System.DateTime Ngaydukien { get; set; }
        [Key]
        [Column(Order = 4)]
        public byte Tugio { get; set; }
        public Nullable<byte> Dengio { get; set; }
        public Nullable<bool> DaThue { get; set; }
    
        public virtual tbl_nhanvien tbl_nhanvien { get; set; }
        public virtual tbl_xe tbl_xe { get; set; }
    }
}