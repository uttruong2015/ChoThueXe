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

    [Table("tbl_chucvu")]
    public partial class tbl_chucvu
    {
       
        public tbl_chucvu()
        {
            this.tbl_nhanvien = new HashSet<tbl_nhanvien>();
        }
        [Key]
        public string Macv { get; set; }
        public string Tencv { get; set; }
    
        public virtual ICollection<tbl_nhanvien> tbl_nhanvien { get; set; }
    }
}
